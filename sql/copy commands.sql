COPY public.gold_dim_category
FROM 's3://your-bucket/export/gold_dim_category/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_dim_product
FROM 's3://your-bucket/export/gold_dim_product/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_dim_location
FROM 's3://your-bucket/export/gold_dim_location/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_dim_supplier
FROM 's3://your-bucket/export/gold_dim_supplier/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_dim_status
FROM 's3://your-bucket/export/gold_dim_status/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_fact_inventory_transactions
FROM 's3://your-bucket/export/gold_fact_inventory_transactions/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_fact_inventory_snapshot
FROM 's3://your-bucket/export/gold_fact_inventory_snapshot/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_fact_damage_reports
FROM 's3://your-bucket/export/gold_fact_damage_reports/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;

COPY public.gold_fact_supplier_performance
FROM 's3://your-bucket/export/gold_fact_supplier_performance/'
IAM_ROLE 'arn:aws:iam::account-id:role/service-role/AmazonRedshift-CommandsAccessRole-20250711T180655'
FORMAT AS PARQUET;
