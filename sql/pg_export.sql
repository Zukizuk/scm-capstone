CREATE TABLE "products" (
  "id" bigint PRIMARY KEY,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "description" text,
  "name" varchar(255) NOT NULL,
  "price" numeric(19,2) NOT NULL,
  "sku" varchar(255) UNIQUE NOT NULL
);

CREATE TABLE "locations" (
  "id" bigint PRIMARY KEY,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "address" text,
  "contact_email" varchar(255) NOT NULL,
  "contact_person" varchar(255) NOT NULL,
  "contact_phone" varchar(255) NOT NULL,
  "name" varchar(255) UNIQUE NOT NULL
);

CREATE TABLE "statuses" (
  "id" bigint PRIMARY KEY,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "color_code" varchar(7),
  "description" varchar(500),
  "is_active" boolean NOT NULL,
  "name" varchar(100) UNIQUE NOT NULL
);

CREATE TABLE "inventory" (
  "id" bigint PRIMARY KEY,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "damaged_quantity" integer NOT NULL,
  "quantity" integer NOT NULL,
  "location_id" bigint NOT NULL,
  "product_id" bigint NOT NULL,
  "status_id" bigint
);

CREATE TABLE "inventory_transactions" (
  "id" bigint PRIMARY KEY,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "quantity" integer NOT NULL,
  "received_by" varchar(255),
  "reference_number" varchar(255),
  "supplier" varchar(255),
  "inventory_id" bigint NOT NULL,
  "transaction_type_id" bigint NOT NULL
);

CREATE TABLE "category_entity" (
  "category_id" varchar(255) PRIMARY KEY,
  "category_description" varchar(255) NOT NULL,
  "category_name" varchar(255) UNIQUE NOT NULL
);

CREATE TABLE "supplier" (
  "supplier_id" varchar(255) PRIMARY KEY,
  "company_name" varchar(255) UNIQUE NOT NULL,
  "password" varchar(255),
  "status" varchar(255),
  "supplier_address" varchar(255),
  "supplier_city" varchar(255),
  "supplier_country" varchar(255),
  "supplier_description" varchar(255),
  "supplier_email" varchar(255),
  "supplier_name" varchar(255),
  "supplier_phone_number" varchar(255),
  "supplier_zip_code" varchar(255),
  "category_id" varchar(255)
);

CREATE TABLE "supplier_key_metrics" (
  "id" varchar(255) PRIMARY KEY,
  "month" integer NOT NULL,
  "on_time_delivery" integer NOT NULL,
  "quality_score" integer NOT NULL,
  "record_date" date NOT NULL,
  "responsiveness" integer NOT NULL,
  "year" integer NOT NULL,
  "supplier_id" varchar(255)
);

CREATE TABLE "damage_reports" (
  "id" bigint PRIMARY KEY,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "description" text,
  "estimated_loss_value" numeric(19,2),
  "inspection_date" date,
  "inspection_officer" varchar(255),
  "quantity" integer NOT NULL,
  "reason" varchar(255) NOT NULL,
  "report_number" varchar(255) UNIQUE NOT NULL,
  "reported_by" varchar(255) NOT NULL,
  "inventory_id" bigint NOT NULL,
  "location_id" bigint NOT NULL,
  "status_id" bigint NOT NULL
);

ALTER TABLE "inventory" ADD FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "inventory" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "inventory" ADD FOREIGN KEY ("status_id") REFERENCES "statuses" ("id");

ALTER TABLE "inventory_transactions" ADD FOREIGN KEY ("inventory_id") REFERENCES "inventory" ("id");

ALTER TABLE "inventory_transactions" ADD FOREIGN KEY ("transaction_type_id") REFERENCES "statuses" ("id");

ALTER TABLE "supplier" ADD FOREIGN KEY ("category_id") REFERENCES "category_entity" ("category_id");

ALTER TABLE "supplier_key_metrics" ADD FOREIGN KEY ("supplier_id") REFERENCES "supplier" ("supplier_id");

ALTER TABLE "damage_reports" ADD FOREIGN KEY ("inventory_id") REFERENCES "inventory" ("id");

ALTER TABLE "damage_reports" ADD FOREIGN KEY ("location_id") REFERENCES "locations" ("id");

ALTER TABLE "damage_reports" ADD FOREIGN KEY ("status_id") REFERENCES "statuses" ("id");
