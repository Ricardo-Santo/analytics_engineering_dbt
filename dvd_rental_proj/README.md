# Welcome to your new dbt project

## Using the starter project

Try running the following commands:

- dbt run
- dbt test

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
---

## Project Overview

As part of this analytics engineering project, we were tasked with answering key operational and financial questions from the CEO of a DVD rental company. Using dbt to build reliable, testable data models, we answered the following:

#### 1. What is the most rented film category each month?
→ Helps identify seasonal trends and customer genre preferences over time.

#### 2. Which are the top 10 most rented films overall?
→ Provides insight into product popularity and inventory optimization.

#### 3. Which store has the most rentals per month?
→ Assesses store performance and operational efficiency.

#### 4. Which store generates the most revenue per month?
→ Supports revenue attribution and store profitability analysis.

## Staging layer design
In the staging layer, our goal was to clean and standardize the raw data before applying more complex logic. This layer is materialized as views to save space and promote modularity.

## Key Actions Taken:
Sources defined in sources.yml, with each raw table mapped to staging models inside the staging/ folder.

Data type normalization: Several columns with SMALLINT types were converted to INTEGER to maintain consistency during joins and aggregations in later models.

Columns converted:

film_category: film_id, category_id

inventory: film_id, store_id

payment: staff_id, rental_id

rental: staff_id

staff: address_id, store_id

store: manager_staff_id

Unnecessary columns dropped:
For example, in the staff table, columns not relevant to our KPIs (like picture or last update timestamps) were removed to streamline the model and avoid clutter.

Tests and documentation:

Data quality tests (e.g., not_null, unique, accepted_values) were implemented in schema.yml

Descriptions and relationships between tables were also documented here.
# Layers Overview
## Intermediate layer design

The intermediate layer is where we joined and aggregated data across multiple staging models to prepare them for final KPI reporting.

Transformations performed:

Date transformations: Timestamps were broken down into year and month fields for easier time-based grouping and analysis.

Aggregations:

Rentals per store/month

Revenue per store/month

Rentals per film/category/month

Views created: About five models were developed to support the core metrics needed in the final layer. These were materialized as views to maintain efficiency and reusability.


## Mart Layer Design – KPI Reporting
In the mart layer, we answered the business questions directly through three final models, each designed to be business-readable, metrics-focused, and optimized for visualization.

Final Tables:

fct_most_rented_category_by_period_by_store – Displays the most rented film category per month.

fct_most_rented_film_by_period_by_store – Lists the top 10 most rented films based on total rentals.

fct_rental_performance_by_store – Gives out monthly revenue per store for comparison.

fct_revenue_performance_by_store - Gives out monthly number of rentals per store for comparison.

These final tables were used directly in the optional Streamlit dashboard to present KPIs visually and interactively.