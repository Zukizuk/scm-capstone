import sys
import logging
from pyspark.context import SparkContext
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, trim
from pyspark.sql.types import DecimalType, IntegerType, BooleanType, DateType, TimestampType
from awsglue.context import GlueContext
from awsglue.utils import getResolvedOptions
from pyspark.conf import SparkConf

# Initialize Glue context
args = getResolvedOptions(sys.argv, ["JOB_NAME", "S3_BUCKET"])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job_name = args["JOB_NAME"]

# Enable Delta Lake support
conf = SparkConf()
conf.set("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
conf.set("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
spark.sparkContext._conf.setAll(conf.getAll())

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
logger.info(f"Starting Glue Job: {job_name}")

# ------------------------------
# CONFIGURATION
# ------------------------------
bronze_base = f"s3://{args['S3_BUCKET']}/bronze/"
silver_base = f"s3://{args['S3_BUCKET']}/silver/"

# Table-wise cleaning config
tables = {
    "products": {
        "pk": "id",
        "fields_to_trim": ["name", "sku", "description"],
        "cast_types": {
            "price": DecimalType(19, 2),
            "created_at": TimestampType(),
            "updated_at": TimestampType()
        },
        "columns_to_exclude": []
    },
    "locations": {
        "pk": "id",
        "fields_to_trim": ["address", "contact_email", "contact_person", "contact_phone", "name"],
        "cast_types": {
            "created_at": TimestampType(),
            "updated_at": TimestampType()
        },
        "columns_to_exclude": []
    },
    "statuses": {
        "pk": "id",
        "fields_to_trim": ["name", "color_code", "description"],
        "cast_types": {
            "is_active": BooleanType(),
            "created_at": TimestampType(),
            "updated_at": TimestampType()
        },
        "columns_to_exclude": ["color_code"]
    },
    "inventory": {
        "pk": "id",
        "fields_to_trim": [],
        "cast_types": {
            "damaged_quantity": IntegerType(),
            "quantity": IntegerType(),
            "created_at": TimestampType(),
            "updated_at": TimestampType()
        },
        "columns_to_exclude": []
    },
    "inventory_transactions": {
        "pk": "id",
        "fields_to_trim": ["received_by", "reference_number", "supplier"],
        "cast_types": {
            "quantity": IntegerType(),
            "created_at": TimestampType(),
            "updated_at": TimestampType()
        },
        "columns_to_exclude": ["reference_number"]
    },
    "category_entity": {
        "pk": "category_id",
        "fields_to_trim": ["category_description", "category_name"],
        "cast_types": {},
        "columns_to_exclude": []
    },
    "supplier": {
        "pk": "supplier_id",
        "fields_to_trim": [
            "supplier_email",
            "supplier_address",
            "supplier_description",
            "supplier_phone_number"
        ],
        "cast_types": {},
        "columns_to_exclude": ["password"]
    },
    "supplier_key_metrics": {
        "pk": "id",
        "fields_to_trim": [],
        "cast_types": {
            "month": IntegerType(),
            "year": IntegerType(),
            "record_date": DateType()
        },
        "columns_to_exclude": []
    },
    "damage_reports": {
        "pk": "id",
        "fields_to_trim": [
            "description",
            "reason",
            "reported_by",
            "report_number",
            "inspection_officer"
        ],
        "cast_types": {
            "estimated_loss_value": DecimalType(19, 2),
            "created_at": TimestampType(),
            "updated_at": TimestampType(),
            "inspection_date": DateType()
        },
        "columns_to_exclude": ["reported_by", "inspection_officer"]
    }
}

# ------------------------------
# TABLE PROCESSING FUNCTION
# ------------------------------
def process_table(table_name, config):
    logger.info(f"🔄 Starting processing for table: {table_name}")
    input_path = f"{bronze_base}{table_name}/"
    output_path = f"{silver_base}{table_name}/"

    try:
        # Read parquet data from Bronze
        df = spark.read.parquet(input_path)
        logger.info(f"✅ Read data from: {input_path}")
        logger.info(f"🔍 Schema of {table_name}:\n{df.printSchema()}")

        # Drop duplicates on primary key
        if config.get("pk") in df.columns:
            df = df.dropDuplicates([config["pk"]])

        # Trim string fields
        for field in config.get("fields_to_trim", []):
            if field in df.columns:
                df = df.withColumn(field, trim(col(field)))

        # Cast fields to proper types
        for field, data_type in config.get("cast_types", {}).items():
            if field in df.columns:
                df = df.withColumn(field, col(field).cast(data_type))
        
        # Drop excluded columns
        columns_to_exclude = config.get("columns_to_exclude", [])
        for col_name in columns_to_exclude:
            if col_name in df.columns:
                df = df.drop(col_name)

        # Write cleaned data to Delta (Silver Layer)
        df.write.format("delta") \
            .mode("overwrite") \
            .option("overwriteSchema", "true") \
            .save(output_path)

        logger.info(f"✅ Finished writing {table_name} to Silver at: {output_path}")

    except Exception as e:
        logger.error(f"❌ Failed to process table {table_name}: {str(e)}", exc_info=True)

# ------------------------------
# PROCESS ALL TABLES
# ------------------------------
for table, config in tables.items():
    process_table(table, config)

logger.info("🏁 All tables processed successfully.")
