{{ config(materialized='view') }}

WITH rental_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'rental') }}
)
SELECT
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id::INTEGER AS staff_id,
last_update
FROM rental_source