##  ANALYTICS ENGINEERING PROJECT

This project focus in the Analytics Engineering process with the dbt technology. It integrates with a PostgreSQL database and supports dbt for transformation ... under the ELT pipeline the major focus is on the ...

---

###  Project Overview

This project uses dbt and ... to solve and present solutions to a CEO from a DVD rental store KPI and questions about the store and its activity.
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
2. **Load**: Inserts the transformed data into a PostgreSQL database.
2. **Transform**: ...
4. **Model** ...
5. **Visualize** (optional): ...

---


###  Run the dashboard

```bash
# Run dashboard visualization
streamlit run src/dashboard_jva.py
```



