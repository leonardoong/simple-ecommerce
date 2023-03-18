CREATE TABLE "user" (
  "user_id" SERIAL PRIMARY KEY,
  "username" VARCHAR(30),
  "profile_img" VARCHAR(200),
  "phone" VARCHAR(25),
  "email" VARCHAR(40),
  "password" VARCHAR(50),
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "user_address" (
  "address_id" SERIAL PRIMARY KEY,
  "user_id" INTEGER,
  "address_line1" VARCHAR,
  "address_line2" VARCHAR,
  "city" VARCHAR,
  "postal_code" VARCHAR,
  "country" VARCHAR,
  "status" SMALLINT,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "product" (
  "product_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(200),
  "description" VARCHAR(250),
  "price" INTEGER,
  "status" SMALLINT,
  "inventory_id" INTEGER,
  "category_id" INTEGER,
  "create_by" INTEGER,
  "updated_by" INTEGER,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "product_image_map_id" (
  "product_id" INTEGER,
  "image_id" INTEGER,
  "display_order" SMALLINT,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP,
  PRIMARY KEY ("product_id", "image_id")
);

CREATE TABLE "image" (
  "image_id" SERIAL PRIMARY KEY,
  "url" VARCHAR,
  "description" VARCHAR[50],
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "product_inventory" (
  "inventory_id" SERIAL PRIMARY KEY,
  "stock" INTEGER,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "product_category" (
  "category_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(50),
  "description" VARCHAR(250),
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "cart" (
  "cart_id" SERIAL PRIMARY KEY,
  "user_id" INTEGER,
  "product_id" INTEGER,
  "quantity" INTEGER,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "order" (
  "order_id" SERIAL PRIMARY KEY,
  "user_id" INTEGER,
  "product_id" INTEGER,
  "quantity" INTEGER,
  "status" SMALLINT,
  "create_by" INTEGER,
  "updated_by" INTEGER,
  "created_at" INTEGER,
  "updated_at" INTEGER
);

CREATE TABLE "order_status" (
  "status_id" SERIAL PRIMARY KEY,
  "name" VARCHAR[30],
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "admin_type" (
  "type_id" SERIAL PRIMARY KEY,
  "admin_type" VARCHAR,
  "permissions" VARCHAR,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "admin_user" (
  "admin_id" SERIAL PRIMARY KEY,
  "username" VARCHAR[30],
  "email" VARCHAR[40],
  "password" VARCHAR,
  "type_id" SMALLINT,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

ALTER TABLE "user_address" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "product" ADD FOREIGN KEY ("inventory_id") REFERENCES "product_inventory" ("inventory_id");

ALTER TABLE "product" ADD FOREIGN KEY ("category_id") REFERENCES "product_category" ("category_id");

ALTER TABLE "product" ADD FOREIGN KEY ("create_by") REFERENCES "admin_user" ("admin_id");

ALTER TABLE "product" ADD FOREIGN KEY ("updated_by") REFERENCES "admin_user" ("admin_id");

ALTER TABLE "product_image_map_id" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("product_id");

ALTER TABLE "product_image_map_id" ADD FOREIGN KEY ("image_id") REFERENCES "image" ("image_id");

ALTER TABLE "cart" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "cart" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("product_id");

ALTER TABLE "order" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "order" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("product_id");

ALTER TABLE "order" ADD FOREIGN KEY ("status") REFERENCES "order_status" ("status_id");

ALTER TABLE "order" ADD FOREIGN KEY ("create_by") REFERENCES "user" ("user_id");

ALTER TABLE "order" ADD FOREIGN KEY ("updated_by") REFERENCES "admin_user" ("admin_id");

ALTER TABLE "admin_user" ADD FOREIGN KEY ("type_id") REFERENCES "admin_type" ("type_id");

-- DROP TABLE

DROP TABLE "user" CASCADE;

DROP TABLE "user_address" CASCADE;

DROP TABLE "product" CASCADE;

DROP TABLE "product_image_map_id" CASCADE;

DROP TABLE "image" CASCADE;

DROP TABLE "product_inventory" CASCADE;

DROP TABLE "product_category" CASCADE;

DROP TABLE "cart" CASCADE;

DROP TABLE "order" CASCADE;

DROP TABLE "order_status" CASCADE;

DROP TABLE "admin_type" CASCADE;

DROP TABLE "admin_user" CASCADE;