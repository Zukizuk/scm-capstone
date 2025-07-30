# 📦 End-to-End Supply Chain Analytics Platform

This repository contains the complete codebase and documentation for a **cloud-native data analytics platform** focused on **supply chain management**. It leverages a modern data stack to ingest, process, and store procurement and inventory data—culminating in interactive dashboards for business intelligence.

---

## 🚀 Key Features & Deliverables

- **Automated Data Pipelines**
  Orchestrated batch data pipelines using AWS Step Functions and AWS Glue to process data from source to analytics-ready format.

- **Infrastructure as Code (IaC)**
  All cloud infrastructure is defined using Terraform, ensuring reproducibility and scalability.

- **Star-Schema Data Warehouse**
  A dimensional model implemented in Amazon Redshift, optimized for analytical queries and reporting.

- **CI/CD Automation**
  GitHub Actions automate validation and deployment of infrastructure changes.

- **Interactive BI Dashboards**
  Power BI dashboards for supplier and inventory management provide actionable business insights.

---

## 🧱 Technology Stack

| Category                 | Technology / Service               | Purpose                                                                |
| ------------------------ | ---------------------------------- | ---------------------------------------------------------------------- |
| **IaC**                  | Terraform                          | Provisioning and managing AWS resources (S3, Redshift, Glue)           |
| **Data Lake Storage**    | AWS S3                             | Storing raw (Bronze), transformed (Silver), and aggregated (Gold) data |
| **ETL & Transformation** | AWS Glue, Python (Pandas, PySpark) | Data cleaning, standardization, and transformation                     |
| **Orchestration**        | AWS Step Functions                 | Managing ETL workflow execution                                        |
| **Data Warehouse**       | Amazon Redshift                    | Final structured storage using star schema                             |
| **BI & Visualization**   | Power BI                           | Dashboards querying Redshift                                           |
| **CI/CD**                | GitHub Actions                     | Automated deployment and validation of Terraform code                  |
| **Source DB**            | PostgreSQL on AWS RDS              | Source of transactional data                                           |

---

## 🏗️ Architecture Overview

The platform follows a **data lakehouse** architecture:

1. **Ingestion**
   Data is extracted from PostgreSQL and landed as raw files in the **S3 Bronze Layer**.

2. **Transformation**
   `transform_to_silver.py` (AWS Glue job) cleans and standardizes the data, storing it in **S3 Silver Layer** (e.g., Parquet).

3. **Loading**
   `load_to_gold.py` remodels Silver data into a star schema and loads it into **Amazon Redshift (Gold Layer)**.

4. **Orchestration**
   The ETL flow is orchestrated using **AWS Step Functions**.

5. **Visualization**
   **Power BI** connects to Redshift to visualize data through interactive dashboards.

📷 _(Optional: Replace or update the path below with your actual diagram)_
![Architecture Diagram](sql/data%20model.png)

---

## 📁 Repository Structure

```
.
├── README.md                    # Project overview (this file)
├── main.tf                      # Main Terraform configuration
├── glue_job.tf                 # Glue job-specific Terraform config
├── redshift.tf                 # Redshift-specific Terraform config
├── providers.tf                # Terraform provider definitions
├── terraform.tf                # General Terraform settings
├── variables.tf                # Input variables for Terraform
├── module/                     # Reusable Terraform modules
│   ├── glue/
│   ├── rds/
│   ├── redshift/
│   └── s3/
├── scripts/                    # Python scripts for ETL logic
│   ├── ingest_to_s3.py
│   ├── transform_to_silver.py
│   └── load_to_gold.py
├── sql/                        # SQL scripts and data models
│   ├── ⭐ schema.sql            # Star-schema DDL for Redshift
│   ├── copy commands.sql       # Redshift COPY commands
│   └── data model.png          # Schema diagram
```

---

## ⚙️ Setup and Deployment

### Prerequisites

- AWS account with required IAM permissions
- [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed
- AWS credentials configured in your terminal or environment

### Steps

1. **Clone the Repository**

   ```bash
   git clone <your-repo-url>
   cd scm-capstone
   ```

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Review Terraform Plan**

   ```bash
   terraform plan
   ```

4. **Deploy Infrastructure**

   ```bash
   terraform apply
   ```

   Once deployed, trigger the **AWS Step Function** manually (via AWS Console) to run the ETL pipeline.

---

## 👤 Author

**\[Marzuk Sanni Entsie]**
