{{ config(materialized='view') }}

WITH payment_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'payment') }}
)
SELECT
payment_id,
customer_id,
staff_id::INTEGER AS staff_id,
rental_id::INTEGER AS rental_id,
amount,
payment_date
FROM payment_source