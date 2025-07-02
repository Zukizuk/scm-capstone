-- INVENTORY MANAGEMENT STAR SCHEMA
-- Optimized for analytics and data pipeline insights

-- =============================================================================
-- DIMENSION TABLES
-- =============================================================================

-- Product Dimension
CREATE TABLE dim_product (
    product_key BIGINT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    sku VARCHAR(255) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(19,2) NOT NULL,
    category_id VARCHAR(255),
    category_name VARCHAR(255),
    category_description VARCHAR(255),
    -- SCD Type 2 fields
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    -- Audit fields
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Location Dimension
CREATE TABLE dim_location (
    location_key BIGINT PRIMARY KEY,
    location_id BIGINT NOT NULL,
    location_name VARCHAR(255) NOT NULL,
    address TEXT,
    contact_person VARCHAR(255),
    contact_phone VARCHAR(255),
    contact_email VARCHAR(255),
    -- SCD Type 2 fields
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    -- Audit fields
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Supplier Dimension
CREATE TABLE dim_supplier (
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
    -- SCD Type 2 fields
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    -- Audit fields
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Status Dimension
CREATE TABLE dim_status (
    status_key BIGINT PRIMARY KEY,
    status_id BIGINT NOT NULL,
    status_name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    color_code VARCHAR(7),
    is_active BOOLEAN NOT NULL,
    status_type VARCHAR(50), -- 'INVENTORY', 'TRANSACTION', 'DAMAGE_REPORT', etc.
    -- Audit fields
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Date Dimension
CREATE TABLE dim_date (
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

-- =============================================================================
-- FACT TABLES
-- =============================================================================

-- Inventory Transactions Fact Table (Main fact table)
CREATE TABLE fact_inventory_transactions (
    transaction_key BIGINT PRIMARY KEY,
    -- Dimension keys
    product_key BIGINT NOT NULL,
    location_key BIGINT NOT NULL,
    supplier_key BIGINT, -- nullable for internal transactions
    status_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    
    -- Original IDs for traceability
    transaction_id BIGINT NOT NULL,
    inventory_id BIGINT NOT NULL,
    
    -- Measures
    quantity INT NOT NULL,
    unit_price DECIMAL(19,2),
    total_value DECIMAL(19,2),
    
    -- Transaction details
    transaction_type VARCHAR(50) NOT NULL, -- 'INBOUND', 'OUTBOUND', 'ADJUSTMENT', 'DAMAGE'
    reference_number VARCHAR(255),
    received_by VARCHAR(255),
    
    -- Audit fields
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign keys
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (supplier_key) REFERENCES dim_supplier(supplier_key),
    FOREIGN KEY (status_key) REFERENCES dim_status(status_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Inventory Snapshot Fact Table (for current stock levels)
CREATE TABLE fact_inventory_snapshot (
    snapshot_key BIGINT PRIMARY KEY,
    -- Dimension keys
    product_key BIGINT NOT NULL,
    location_key BIGINT NOT NULL,
    status_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    
    -- Original IDs
    inventory_id BIGINT NOT NULL,
    
    -- Measures
    quantity_on_hand INT NOT NULL,
    damaged_quantity INT NOT NULL,
    available_quantity INT NOT NULL, -- calculated: quantity_on_hand - damaged_quantity
    unit_price DECIMAL(19,2),
    total_inventory_value DECIMAL(19,2),
    
    -- Thresholds and alerts
    low_stock_threshold INT,
    overstock_threshold INT,
    is_low_stock BOOLEAN DEFAULT FALSE,
    is_overstock BOOLEAN DEFAULT FALSE,
    
    -- Audit fields
    snapshot_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign keys
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (status_key) REFERENCES dim_status(status_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Damage Reports Fact Table
CREATE TABLE fact_damage_reports (
    damage_report_key BIGINT PRIMARY KEY,
    -- Dimension keys
    product_key BIGINT NOT NULL,
    location_key BIGINT NOT NULL,
    status_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    
    -- Original IDs
    damage_report_id BIGINT NOT NULL,
    inventory_id BIGINT NOT NULL,
    
    -- Measures
    damaged_quantity INT NOT NULL,
    estimated_loss_value DECIMAL(19,2),
    unit_loss_value DECIMAL(19,2), -- calculated: estimated_loss_value / damaged_quantity
    
    -- Report details
    report_number VARCHAR(255) NOT NULL,
    damage_reason VARCHAR(255) NOT NULL,
    reported_by VARCHAR(255) NOT NULL,
    inspection_officer VARCHAR(255),
    inspection_date DATE,
    
    -- Audit fields
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign keys
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (location_key) REFERENCES dim_location(location_key),
    FOREIGN KEY (status_key) REFERENCES dim_status(status_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- Supplier Performance Fact Table
CREATE TABLE fact_supplier_performance (
    performance_key BIGINT PRIMARY KEY,
    -- Dimension keys
    supplier_key BIGINT NOT NULL,
    date_key INT NOT NULL,
    
    -- Original ID
    metrics_id VARCHAR(255) NOT NULL,
    
    -- Measures
    on_time_delivery_score INT NOT NULL,
    quality_score INT NOT NULL,
    responsiveness_score INT NOT NULL,
    overall_performance_score DECIMAL(5,2), -- calculated average
    
    -- Time context
    performance_month INT NOT NULL,
    performance_year INT NOT NULL,
    
    -- Audit fields
    record_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign keys
    FOREIGN KEY (supplier_key) REFERENCES dim_supplier(supplier_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);

-- =============================================================================
-- INDEXES FOR PERFORMANCE
-- =============================================================================

-- Fact table indexes
CREATE INDEX idx_fact_inventory_transactions_product ON fact_inventory_transactions(product_key);
CREATE INDEX idx_fact_inventory_transactions_location ON fact_inventory_transactions(location_key);
CREATE INDEX idx_fact_inventory_transactions_date ON fact_inventory_transactions(date_key);
CREATE INDEX idx_fact_inventory_transactions_type ON fact_inventory_transactions(transaction_type);

CREATE INDEX idx_fact_inventory_snapshot_product ON fact_inventory_snapshot(product_key);
CREATE INDEX idx_fact_inventory_snapshot_location ON fact_inventory_snapshot(location_key);
CREATE INDEX idx_fact_inventory_snapshot_date ON fact_inventory_snapshot(date_key);
CREATE INDEX idx_fact_inventory_snapshot_alerts ON fact_inventory_snapshot(is_low_stock, is_overstock);

CREATE INDEX idx_fact_damage_reports_product ON fact_damage_reports(product_key);
CREATE INDEX idx_fact_damage_reports_location ON fact_damage_reports(location_key);
CREATE INDEX idx_fact_damage_reports_date ON fact_damage_reports(date_key);

CREATE INDEX idx_fact_supplier_performance_supplier ON fact_supplier_performance(supplier_key);
CREATE INDEX idx_fact_supplier_performance_date ON fact_supplier_performance(date_key);

-- Dimension table indexes
CREATE INDEX idx_dim_product_sku ON dim_product(sku);
CREATE INDEX idx_dim_product_current ON dim_product(is_current);
CREATE INDEX idx_dim_location_current ON dim_location(is_current);
CREATE INDEX idx_dim_supplier_current ON dim_supplier(is_current);

-- =============================================================================
-- REMOVED/EXCLUDED TABLES (Not needed for analytics)
-- =============================================================================
/*
EXCLUDED TABLES - These are operational/security tables not needed for analytics:

1. failed_login_attempt - Security/audit only
2. user_code - 2FA implementation
3. users - User management (PII sensitive)
4. profiles - User profiles (PII sensitive)
5. roles - Role management
6. role_permissions - Security permissions
7. global_inventory_settings - Configuration table
8. alert_thresholds - Operational configuration (could be included if alerting analytics needed)
9. damage_report_photos - Binary data, not suitable for analytics

These tables serve operational purposes but don't provide business insights
for inventory management analytics and reporting.
*/