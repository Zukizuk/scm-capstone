# Supply Chain Management Platform (Capstone Project)

## Overview

This project implements a foundational analytics and integration layer for a cloud-native **Supply Chain Management Platform**, aimed at digitizing and optimizing procurement, inventory, logistics, and analytics for manufacturing businesses.

## Features

- Batch and real-time data pipelines using production-grade tools
- Dimensional data warehouse with curated marts and KPIs
- Dashboards for procurement, inventory, logistics, and supplier analysis
- Secure, role-based access and audit logging
- Cloud-native, modular, and scalable architecture

## Tech Stack

- **Cloud**: AWS (S3, Redshift, Glue, Lambda, Kinesis)
- **Data Engineering**: Spark, Kafka, SQL, Python
- **Visualization**: QuickSight / Power BI
- **IaC & CI/CD**: Terraform, GitHub Actions

## Core Entities

- Fact tables: `FactInventoryMovement`, `FactPurchaseOrders`, `FactDeliveries`
- Dimension tables: `DimDate`, `DimSupplier`, `DimProduct`, `DimLocation`, `DimUser`

## Personas & Dashboards

- **Procurement Manager**: Supplier performance, spend trends
- **Inventory Manager**: Stock levels, location-wise distribution
- **Logistics Manager**: Shipment delays, vendor KPIs
- **Analyst**: Root causes of stockouts, cost breakdowns

## Project Structure

- `data/` – Sample source data (CSV, JSON)
- `pipelines/` – ETL scripts (batch & streaming)
- `models/` – Dimensional data models
- `dashboards/` – Dashboard templates and KPI definitions
- `infra/` – Terraform code for provisioning
- `docs/` – Architecture diagrams, setup guides

## Deployment

See [`docs/deployment.md`](docs/deployment.md) for instructions on provisioning, pipeline execution, and dashboard access.

## Final Deliverables

- Cloud-deployed batch & streaming pipelines
- Star-schema warehouse
- Interactive dashboards
- Codebase with CI/CD
- Architecture diagrams and project report
