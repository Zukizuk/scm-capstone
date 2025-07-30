import sys
import logging
from datetime import datetime
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.utils import getResolvedOptions
from pyspark.sql import functions as F
from pyspark.conf import SparkConf

# Initialize Logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[
        logging.StreamHandler(sys.stdout)
    ]
)
logger = logging.getLogger(__name__)

logger.info("Starting Glue Job")

# Arguments
args = getResolvedOptions(sys.argv, ['JOB_NAME'])
job_name = args['JOB_NAME']

# Spark/Glue Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(job_name, args)

# Delta Lake Config
conf = SparkConf()
conf.set("spark.sql.catalogImplementation", "hive")
conf.set("hive.metastore.client.factory.class", "com.amazonaws.glue.catalog.metastore.AWSGlueDataCatalogHiveClientFactory")
conf.set("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
conf.set("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
spark.sparkContext._conf.setAll(conf.getAll())

# Configuration
catalog_db = "capstone_glue_database"
gold_s3_bucket = "s3://your-bucket/gold/"
today = datetime.today().date()

def read_glue_table(glue_context, db, tbl):
    """
    Read table from Glue Catalog - handles both Delta and regular tables
    """
    logger.info(f"Reading from Glue Catalog: {db}.{tbl}")
    try:
        # For Delta tables, use getDataFrame instead of getDynamicFrame
        return glue_context.create_data_frame.from_catalog(database=db, table_name=tbl)
    except Exception as e:
        logger.warning(f"Failed to read as DataFrame, trying DynamicFrame: {e}")
        # Fallback to DynamicFrame for non-Delta tables
        return glue_context.create_dynamic_frame.from_catalog(database=db, table_name=tbl).toDF()

def write_to_delta_s3(df, table_name, partition_cols=None):
    """
    Write DataFrame to S3 as Delta Lake format
    """
    logger.info(f"Writing to S3 Delta table: {table_name}")
    logger.info(f"DataFrame schema for {table_name}:")
    df.printSchema()
    logger.info(f"Sample data for {table_name}:")
    df.show(5)

    # Check if DataFrame is empty
    row_count = df.count()
    if row_count == 0:
        logger.warning(f"DataFrame {table_name} is empty, skipping write")
        return

    s3_path = f"{gold_s3_bucket}{table_name}/"
    
    try:
        writer = df.write \
            .format("delta") \
            .mode("overwrite") \
            .option("overwriteSchema", "true")
        
        # Add partitioning if specified
        if partition_cols:
            writer = writer.partitionBy(*partition_cols)
        
        writer.save(s3_path)
        
        logger.info(f"Successfully wrote {row_count} rows to {s3_path}")
        
        # Register table in Glue Catalog for Spectrum
        try:
            spark.sql(f"""
                CREATE TABLE IF NOT EXISTS {catalog_db}.{table_name}
                USING DELTA
                LOCATION '{s3_path}'
            """)
            logger.info(f"Registered Delta table {table_name} in Glue Catalog")
        except Exception as catalog_error:
            logger.warning(f"Failed to register table in catalog: {catalog_error}")
        
    except Exception as e:
        logger.error(f"Failed to write to {table_name}: {str(e)}")
        raise

try:
    category_df = read_glue_table(glueContext, catalog_db, "silver_category_entity")
    locations_df = read_glue_table(glueContext, catalog_db, "silver_locations")
    suppliers_df = read_glue_table(glueContext, catalog_db, "silver_supplier")
    statuses_df = read_glue_table(glueContext, catalog_db, "silver_statuses")
    transactions_df = read_glue_table(glueContext, catalog_db, "silver_inventory_transactions")
    inventory_df = read_glue_table(glueContext, catalog_db, "silver_inventory")
    damages_df = read_glue_table(glueContext, catalog_db, "silver_damage_reports")
    metrics_df = read_glue_table(glueContext, catalog_db, "silver_supplier_key_metrics")
    products_df = read_glue_table(glueContext, catalog_db, "silver_products")
    
    # --- DIM TABLES ---
    category_dim = category_df \
        .withColumn("category_key", F.monotonically_increasing_id()) \
        .withColumn("effective_date", F.lit(today)) \
        .withColumn("expiry_date", F.lit(None).cast("date")) \
        .withColumn("is_current", F.lit(True)) \
        .select(
            "category_key",
            "category_id",
            "category_name",
            "category_description",
            "effective_date",
            "expiry_date",
            "is_current"
        )

    product_dim = products_df \
        .withColumn("product_key", F.monotonically_increasing_id()) \
        .withColumn("product_name", F.col("name")) \
        .withColumn("effective_date", F.lit(today)) \
        .withColumn("expiry_date", F.lit(None).cast("date")) \
        .withColumn("is_current", F.lit(True)) \
        .select(
            "product_key",
            F.col("id").alias("product_id"),
            "sku",
            "product_name",
            "description",
            "price",
            "effective_date",
            "expiry_date",
            "is_current",
            "created_at",
            "updated_at"
        )

    location_dim = locations_df \
        .withColumn("location_key", F.monotonically_increasing_id()) \
        .withColumn("location_name", F.col("name")) \
        .withColumn("effective_date", F.lit(today)) \
        .withColumn("expiry_date", F.lit(None).cast("date")) \
        .withColumn("is_current", F.lit(True)) \
        .select(
            "location_key",
            F.col("id").alias("location_id"),
            "location_name",
            "address",
            "contact_email",
            "contact_person",
            "contact_phone",
            "effective_date",
            "expiry_date",
            "is_current",
            "created_at",
            "updated_at"
        )

    supplier_dim = suppliers_df \
        .withColumn("supplier_key", F.monotonically_increasing_id()) \
        .withColumn("effective_date", F.lit(today)) \
        .withColumn("expiry_date", F.lit(None).cast("date")) \
        .withColumn("is_current", F.lit(True)) \
        .select(
            "supplier_key",
            "supplier_id",
            "supplier_name",
            "company_name",
            "supplier_description",
            "supplier_address",
            "supplier_city",
            "supplier_country",
            "supplier_zip_code",
            "supplier_phone_number",
            "supplier_email",
            "status",
            "category_id",
            "effective_date",
            "expiry_date",
            "is_current"
        )

    status_dim = statuses_df \
        .withColumn("status_key", F.monotonically_increasing_id()) \
        .withColumn("status_name", F.col("name")) \
        .withColumn("status_type", F.lit("GENERIC")) \
        .select(
            "status_key",
            F.col("id").alias("status_id"),
            "status_name",
            "description",
            "is_active",
            "status_type",
            "created_at",
            "updated_at"
        )

    # --- FACT TABLES ---
    
    # For transactions_fact, we need to join with products to get price for total_value calculation
    transactions_fact = transactions_df.alias("t") \
        .join(inventory_df.select("id", "product_id").alias("i"), 
              F.col("t.inventory_id") == F.col("i.id"), "left") \
        .join(products_df.select("id", "price").alias("p"), 
              F.col("i.product_id") == F.col("p.id"), "left") \
        .withColumn("transaction_key", F.monotonically_increasing_id()) \
        .withColumn("total_value", F.col("t.quantity") * F.coalesce(F.col("p.price"), F.lit(0))) \
        .withColumn("transaction_type", F.lit("INBOUND")) \
        .withColumn("date_key", F.date_format(F.col("t.created_at"), "yyyyMMdd").cast("int")) \
        .withColumn("year", F.year(F.col("t.created_at"))) \
        .withColumn("month", F.month(F.col("t.created_at"))) \
        .withColumn("day", F.dayofmonth(F.col("t.created_at"))) \
        .select(
            "transaction_key",
            F.col("t.id").alias("transaction_id"),
            F.col("t.inventory_id"),
            F.col("t.quantity"),
            "total_value",
            "transaction_type",
            F.col("t.received_by"),
            F.col("t.supplier"),
            F.col("t.transaction_type_id"),
            "date_key",
            "year",
            "month",
            "day",
            F.col("t.created_at"),
            F.col("t.updated_at")
        )

    # For snapshot_fact, we need to join with products to get price for inventory value calculation
    snapshot_fact = inventory_df.alias("inv") \
        .join(products_df.select("id", "price").alias("prod"), 
              F.col("inv.product_id") == F.col("prod.id"), "left") \
        .withColumn("snapshot_key", F.monotonically_increasing_id()) \
        .withColumn("available_quantity", F.col("inv.quantity") - F.coalesce(F.col("inv.damaged_quantity"), F.lit(0))) \
        .withColumn("total_inventory_value", F.col("inv.quantity") * F.coalesce(F.col("prod.price"), F.lit(0))) \
        .withColumn("snapshot_date", F.lit(today)) \
        .withColumn("date_key", F.date_format(F.col("inv.updated_at"), "yyyyMMdd").cast("int")) \
        .withColumn("year", F.year(F.col("inv.updated_at"))) \
        .withColumn("month", F.month(F.col("inv.updated_at"))) \
        .withColumn("day", F.dayofmonth(F.col("inv.updated_at"))) \
        .select(
            "snapshot_key",
            F.col("inv.id").alias("inventory_id"),
            F.col("inv.product_id"),
            F.col("inv.location_id"),
            F.col("inv.status_id"),
            F.col("inv.quantity"),
            F.col("inv.damaged_quantity"),
            "available_quantity",
            "total_inventory_value",
            "snapshot_date",
            "date_key",
            "year",
            "month",
            "day",
            F.col("inv.created_at"),
            F.col("inv.updated_at")
        )

    damage_fact = damages_df \
        .withColumn("damage_report_key", F.monotonically_increasing_id()) \
        .withColumn("unit_loss_value", 
                    F.when(F.col("quantity") > 0, F.col("estimated_loss_value") / F.col("quantity"))
                     .otherwise(F.lit(0))) \
        .withColumn("date_key", F.date_format(F.col("created_at"), "yyyyMMdd").cast("int")) \
        .withColumn("year", F.year(F.col("created_at"))) \
        .withColumn("month", F.month(F.col("created_at"))) \
        .withColumn("day", F.dayofmonth(F.col("created_at"))) \
        .select(
            "damage_report_key",
            F.col("id").alias("damage_report_id"),
            "inventory_id",
            "location_id",
            "status_id",
            "report_number",
            "description",
            "reason",
            "quantity",
            "estimated_loss_value",
            "unit_loss_value",
            "inspection_date",
            "date_key",
            "year",
            "month",
            "day",
            "created_at",
            "updated_at"
        )

    performance_fact = metrics_df \
        .withColumn("performance_key", F.monotonically_increasing_id()) \
        .withColumn("overall_performance_score", 
                    (F.coalesce(F.col("on_time_delivery"), F.lit(0)) + 
                     F.coalesce(F.col("quality_score"), F.lit(0)) + 
                     F.coalesce(F.col("responsiveness"), F.lit(0))) / 3.0) \
        .withColumn("date_key", F.date_format(F.col("record_date"), "yyyyMMdd").cast("int")) \
        .select(
            "performance_key",
            F.col("id").alias("metrics_id"),
            "supplier_id",
            "year",
            "month",
            "on_time_delivery",
            "quality_score",
            "responsiveness",
            "overall_performance_score",
            "record_date",
            "date_key"
        )

    # --- Write to S3 as Delta Tables ---
    
    # Write dimension tables (no partitioning needed for small dimension tables)
    write_to_delta_s3(category_dim, "gold_dim_category")
    write_to_delta_s3(product_dim, "gold_dim_product")
    write_to_delta_s3(location_dim, "gold_dim_location")
    write_to_delta_s3(supplier_dim, "gold_dim_supplier")
    write_to_delta_s3(status_dim, "gold_dim_status")

    # Write fact tables (with partitioning for better performance)
    write_to_delta_s3(transactions_fact, "gold_fact_inventory_transactions", ["year", "month"])
    write_to_delta_s3(snapshot_fact, "gold_fact_inventory_snapshot", ["year", "month"])
    write_to_delta_s3(damage_fact, "gold_fact_damage_reports", ["year", "month"])
    write_to_delta_s3(performance_fact, "gold_fact_supplier_performance", ["year", "month"])

    logger.info("Job completed successfully. All tables written to S3 as Delta format.")
    job.commit()

except Exception as e:
    logger.exception("Job failed due to error:")
    job.commit()
    raise