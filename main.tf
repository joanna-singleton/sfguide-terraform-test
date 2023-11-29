terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.76"
    }
  }
}

provider "snowflake" {
  role = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "x-small"
  auto_suspend   = 60
}

resource "snowflake_schema" "schema" {
	database = "TF_DEMO"
	name = "demo_schema"
	comment = "Schema for TF Demo."
}

resource "snowflake_table" "table" {
	database = "TF_DEMO"
	schema = "TF_DEMO.demo_schema"
	name = "firsttable"

	column {
	name = "v"
	type = "string"
}
}
