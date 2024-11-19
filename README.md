# DEC-bootcamp_project2
# DEC Project#2
# Objective

This project will explore building a big data ETL pipeline solution using the lessons learnt such as:
> - data integration tools like Airbyte
> - cluster compute engines to transform data such as Snowflake
> - Create DAGs for transformations using dbt
> - data quality tests for using transformations using dbt tests
> - host this solution on the AWS cloud

## Consumers
The end users would be analysts from the sales and marketing team who will need to generate sales and customer reports.

## Questions
> - what is the total cost spent by a customer 
> - what total revenue is generated for a product over a year
> - how many customers are there in a demograph


## Source datasets

| Source Name           | Source Type | Source Documentation                       |
|----------------------|-------------|-------------------------------------------|
| Northwind Store  | Postgres SQL   | https://github.com/pthom/northwind_psql |

To install the Northwind store in Postgresql read northwind_db_setup.md

## Solution architecture

1. The source , Northwind Store, will be loaded into the localhost computer by postgres
2. Airbyte will ingest the source data into Data Warehouse Snowflake
3. DBT will be responsible DAG formation based on data formation
4. Semantic modeling and visualization - tool Preset is used to visualize the data reports.

![solution_architecture](</img/solution_architecture.png>)


## STAR-SCHEMA

1. marts.fact_orders : contains the details of all the orders
2. marts.dim_products: contains the details of the products, their categories and suppliers
3. marts.dim_customers: contains the details of the customers
4. marts.dim_employees: contains the details of the employees, employee_territories and employee_regions

![star_shema](<img/star_schema.png>).