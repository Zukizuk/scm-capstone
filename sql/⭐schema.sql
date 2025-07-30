-- ======================
-- DIMENSION TABLES
-- ======================

-- gold_dim_category
CREATE TABLE public.gold_dim_category (
    category_key BIGINT NOT NULL,
    category_id VARCHAR(255),
    category_name VARCHAR(255),
    category_description VARCHAR(500),
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN NOT NULL
);

-- gold_dim_product
CREATE TABLE public.gold_dim_product (
    product_key BIGINT NOT NULL,
    product_id BIGINT,
    sku VARCHAR(255),
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(19,2),
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- gold_dim_location
CREATE TABLE public.gold_dim_location (
    location_key BIGINT NOT NULL,
    location_id BIGINT,
    location_name VARCHAR(255),
    address TEXT,
    contact_email VARCHAR(255),
    contact_person VARCHAR(255),
    contact_phone VARCHAR(50),
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- gold_dim_supplier
CREATE TABLE public.gold_dim_supplier (
    supplier_key BIGINT NOT NULL,
    supplier_id VARCHAR(255),
    supplier_name VARCHAR(255),
    company_name VARCHAR(255),
    supplier_description TEXT,
    supplier_address VARCHAR(500),
    supplier_city VARCHAR(255),
    supplier_country VARCHAR(255),
    supplier_zip_code VARCHAR(50),
    supplier_phone_number VARCHAR(50),
    supplier_email VARCHAR(255),
    status VARCHAR(255),
    category_id VARCHAR(255),
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN NOT NULL
);

-- gold_dim_status
CREATE TABLE public.gold_dim_status (
    status_key BIGINT NOT NULL,
    status_id BIGINT,
    status_name VARCHAR(255),
    description TEXT,
    is_active BOOLEAN,
    status_type VARCHAR(100) NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- ======================
-- FACT TABLES
-- ======================

-- gold_fact_inventory_transactions
CREATE TABLE public.gold_fact_inventory_transactions (
    transaction_key BIGINT NOT NULL,
    transaction_id BIGINT,
    inventory_id BIGINT,
    quantity INT,
    total_value DECIMAL(30,2),
    transaction_type VARCHAR(100) NOT NULL,
    received_by VARCHAR(255),
    supplier VARCHAR(255),
    transaction_type_id BIGINT,
    date_key INT,
    year INT,
    month INT,
    day INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- gold_fact_inventory_snapshot
CREATE TABLE public.gold_fact_inventory_snapshot (
    snapshot_key BIGINT NOT NULL,
    inventory_id BIGINT,
    product_id BIGINT,
    location_id BIGINT,
    status_id BIGINT,
    quantity INT,
    damaged_quantity INT,
    available_quantity INT,
    total_inventory_value DECIMAL(30,2),
    snapshot_date DATE NOT NULL,
    date_key INT,
    year INT,
    month INT,
    day INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- gold_fact_damage_reports
CREATE TABLE public.gold_fact_damage_reports (
    damage_report_key BIGINT NOT NULL,
    damage_report_id BIGINT,
    inventory_id BIGINT,
    location_id BIGINT,
    status_id BIGINT,
    report_number VARCHAR(255),
    description TEXT,
    reason VARCHAR(255),
    quantity INT,
    estimated_loss_value DECIMAL(19,2),
    unit_loss_value DECIMAL(30,13),
    inspection_date DATE,
    date_key INT,
    year INT,
    month INT,
    day INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- gold_fact_supplier_performance
CREATE TABLE public.gold_fact_supplier_performance (
    performance_key BIGINT NOT NULL,
    metrics_id VARCHAR(255),
    supplier_id VARCHAR(255),
    year INT,
    month INT,
    on_time_delivery INT,
    quality_score INT,
    responsiveness INT,
    overall_performance_score DOUBLE PRECISION,
    record_date DATE,
    date_key INT
);
