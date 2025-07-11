-- Category Dimension (NEW)
CREATE TABLE IF NOT EXISTS dim_category (
    category_key BIGINT PRIMARY KEY,
    category_id VARCHAR(255) NOT NULL,
    category_name VARCHAR(255),
    category_description VARCHAR(255)
);

-- Product Dimension (Updated)
CREATE TABLE IF NOT EXISTS dim_product (
    product_key BIGINT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    sku VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(19,2) NOT NULL,
    category_key BIGINT,
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_key) REFERENCES dim_category(category_key)
);

-- Location Dimension
CREATE TABLE IF NOT EXISTS dim_location (
    location_key BIGINT PRIMARY KEY,
    location_id BIGINT NOT NULL,
    location_name VARCHAR(255) NOT NULL,
    address TEXT,
    contact_person VARCHAR(255),
    contact_phone VARCHAR(255),
    contact_email VARCHAR(255),
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Supplier Dimension
CREATE TABLE IF NOT EXISTS dim_supplier (
    supplier_key BIGINT PRIMARY KEY,
    supplier_id VARCHAR(255) NOT NULL,
    supplier_name VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    supplier_email VARCHAR(255),
    supplier_phone VARCHAR(255),
    supplier_address VARCHAR(255),
    supplier_city VARCHAR(255),
    supplier_country VARCHAR(255),
    supplier_zip_code VARCHAR(255),
    status VARCHAR(255),
    category_id VARCHAR(255),
    category_name VARCHAR(255),
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Status Dimension (monolithic, with status_type)
CREATE TABLE IF NOT EXISTS dim_status (
    status_key BIGINT PRIMARY KEY,
    status_id BIGINT NOT NULL,
    status_name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    is_active BOOLEAN NOT NULL,
    status_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Date Dimension
CREATE TABLE IF NOT EXISTS dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week INT,
    day_name VARCHAR(20),
    day_of_month INT,
    day_of_year INT,
    week_of_year INT,
    month_number INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT,
    is_weekend BOOLEAN,
    is_holiday BOOLEAN,
    fiscal_year INT,
    fiscal_quarter INT
);

-- =========================
-- FACT TABLES
-- =========================

-- Inventory Transactions Fact Table
CREATE TABLE IF NOT EXISTS fact_inventory_transactions (
    transaction_key BIGINT PRIMARY KEY,
    product_key BIGINT NOT NULL,
    location_key BIGINT NOT NULL,
    supplier_key BIGINT,
    status_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    transaction_id BIGINT NOT NULL,
    inventory_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(19,2),
    total_value DECIMAL(19,2),
    transaction_type VARCHAR(50) NOT NULL,
    reference_number VARCHAR(255),
    received_by VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (supplier_key) REFERENCES dim_supplier(supplier_key),
    FOREIGN KEY (status_key) REFERENCES dim_status(status_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Inventory Snapshot Fact Table
CREATE TABLE IF NOT EXISTS fact_inventory_snapshot (
    snapshot_key BIGINT PRIMARY KEY,
    product_key BIGINT NOT NULL,
    location_key BIGINT NOT NULL,
    status_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    inventory_id BIGINT NOT NULL,
    quantity_on_hand INT NOT NULL,
    damaged_quantity INT NOT NULL,
    available_quantity INT NOT NULL,
    unit_price DECIMAL(19,2),
    total_inventory_value DECIMAL(19,2),
    low_stock_threshold INT,
    overstock_threshold INT,
    is_low_stock BOOLEAN DEFAULT FALSE,
    is_overstock BOOLEAN DEFAULT FALSE,
    snapshot_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (status_key) REFERENCES dim_status(status_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Damage Reports Fact Table
CREATE TABLE IF NOT EXISTS fact_damage_reports (
    damage_report_key BIGINT PRIMARY KEY,
    product_key BIGINT NOT NULL,
    location_key BIGINT NOT NULL,
    status_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    damage_report_id BIGINT NOT NULL,
    inventory_id BIGINT NOT NULL,
    damaged_quantity INT NOT NULL,
    estimated_loss_value DECIMAL(19,2),
    unit_loss_value DECIMAL(19,2),
    report_number VARCHAR(255) NOT NULL,
    damage_reason VARCHAR(255) NOT NULL,
    inspection_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (status_key) REFERENCES dim_status(status_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Supplier Performance Fact Table
CREATE TABLE IF NOT EXISTS fact_supplier_performance (
    performance_key BIGINT PRIMARY KEY,
    supplier_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    metrics_id VARCHAR(255) NOT NULL,
    on_time_delivery_score INT NOT NULL,
    quality_score INT NOT NULL,
    responsiveness_score INT NOT NULL,
    overall_performance_score DECIMAL(5,2),
    performance_month INT NOT NULL,
    performance_year INT NOT NULL,
    record_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_key) REFERENCES dim_supplier(supplier_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);