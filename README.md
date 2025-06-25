# Welcome to our dbt Project

**Developed by:**

Ricardo Espírito Santo

Rodolfo Fernandes

# ANALYTICS ENGINEERING PROJECT

This project demonstrates the Analytics Engineering workflow using dbt (data build tool) for data transformation within an ELT pipeline. The data is integrated into a PostgreSQL database and modeled to support stakeholder-driven decision-making — specifically tailored to answer key business questions from the CEO of a DVD rental store.

---

## Project Overview

The goal of this project is to simulate a real-world analytics use case: delivering clean, modeled data to support business KPIs. Using dbt, we transform raw DVD rental data into actionable insights, helping stakeholders understand performance trends, customer behavior, and operational metrics.

---

## Project Structure

```text
DVDRENTAL/
├── data/
|   ├── fct_most_rented_category_by_period_by_store.csv
|   ├── fct_rental_performance_by_store.csv
|   ├── fct_revenue_performance_by_store.csv
|   └── fct_most_rented_film_by_period_by_store.csv        
|
├── src/
|   └── app.py
|
└── dvd_rental_proj/
    └── models/
        ├── staging/
        │   ├── stg__dvd_rental_customer.sql
        │   ├── stg__dvd_rental_payment.sql
        |   ├── stg__dvd_rental_rental.sql
        │   ├── stg__dvd_rental_inventory.sql
        │   ├── stg__dvd_rental_film.sql
        │   ├── stg__dvd_rental_category.sql
        │   ├── stg__dvd_rental_film_category.sql
        │   └── stg__dvd_rental_staff.sql
        ├── intermediate/
        │   ├── int__dvd_rental_customer_revenue.sql
        │   ├── int__dvd_rental_payment_store.sql
        │   ├── int__dvd_rental_rentals_by_category.sql
        │   ├── int__dvd_rental_rentals_per_film.sql
        │   └── int__dvd_rental_store_performance.sql
        └── marts/
            ├── fct_most_rented_category_by_period_by_store.sql
            ├── fct_rental_performance_by_store.sql
            ├── fct_revenue_performance_by_store.sql
            └── fct_most_rented_film_by_period_by_store.sql        

```

---
### Technologies Used

- **Python 3.12** to help prepare data for visualization
- **PostgreSQL** hosted locally
- **dbt** for transformations and models
- **Streamlit** for data visualization
---

### ELT Pipeline

1. **Extract**: DVD rental data is sourced from raw operational tables, imported manually into a local PostgreSQL database.
2. **Load**: Raw data is loaded into staging tables inside PostgreSQL. These include information on:
Category
Customers
Film
Film Category
Inventory
Payment
Rental
Staff
3. **Transform**: Using dbt, raw tables are cleaned, standardized, and transformed into analytics-ready models.
These models are organized by layers:
Staging models – Rename, cast, and clean raw source data
Intermediate models – Join related tables, compute derived fields (e.g., rental duration, number of rentals, revenue by film category)
Mart models – Final business-focused tables used to answer stakeholder questions and KPIs (e.g., top rented films, revenue performance of a store by time)
4. **Visualize** (optional): Use Streamlit to create an interactive dashboard for exploring key metrics and trends, such as most popular films, top-paying customers, or rental activity over time.
---

### Run the dashboard

```bash
# Run dashboard visualization
streamlit run src/dashboard_jva.py
```
