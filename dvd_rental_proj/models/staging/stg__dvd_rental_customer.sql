{{ config(materialized='view') }}

WITH customer_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'customer') }}
)

SELECT
    customer_id::INTEGER AS customer_id,
    store_id::INTEGER AS store_id,
    active::BOOLEAN AS is_active,
    create_date::TIMESTAMP AS created_at,
    last_update::TIMESTAMP AS updated_at
FROM customer_source