##  ANALYTICS ENGINEERING PROJECT

This project focus in the Analytics Engineering process with the dbt technology. It integrates with a PostgreSQL database and supports dbt for transformation and Power BI for visualization.

---

###  Project Overview

This project automates the ETL pipeline for JVA stock data and company financials using the [Alpha Vantage API](https://www.alphavantage.co/). It stores the processed data in a PostgreSQL database and prepares it for analysis and modeling with [dbt](https://www.getdbt.com/).

---

### Project Structure

```
DVDRENTAL/
├── data/
├── src/
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
        │   ├── int__dvd_rental_payment_store.sql
        │   ├── int__dvd_rental_rentals_by_category.sql
        │   ├── int__dvd_rental_store_performance.sql
        │   ├── int__dvd_rental_rentals_per_film.sql
        │   └── int__dvd_rental_customer_revenue.sql
        ├── marts/
        │   ├── fct_income_per_store_period.sql
        │   ├── fct_top_category_per_store_period.sql
        │   ├── fct_avg_rental_duration.sql
        │   ├── fct_rentals_per_film.sql
        │   └── fct_store_performance_index.sql
        ├── dimensions/
        │   ├── dim_store.sql
        │   ├── dim_date.sql
        │   └── dim_film.sql
```

---

### Technologies Used

- **Python 3.12**
- **Pandas** for data manipulation
- **SQLAlchemy** for database operations 
- **PostgreSQL** hosted locally
- **dbt** for transformations and models 
- **Streamlit** for data visualization

---

###  How it works

1. **Extract**: Collects daily stock prices and company overview for JVA using Alpha Vantage API.
2. **Transform**: Creates star schema tables (`dim_empresa`, `dim_indicador`, `dim_tempo`, `fact_cotacoes`, `fact_indicadores`).
3. **Load**: Inserts the transformed data into a PostgreSQL database.
4. **Model** (optional): dbt can be used to create additional models (e.g., average monthly price).
5. **Visualize** (optional): Dashboards can be created in Power BI.

---

###  Run with Docker

```bash
# Build the Docker image
docker build -t etl_jva .

# Run the ETL pipeline
docker run --rm etl_jva
```
###  Run the dashboard

```bash
# Run dashboard visualization
streamlit run src/dashboard_jva.py
```



