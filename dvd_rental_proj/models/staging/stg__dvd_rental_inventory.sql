{{ config(materialized='view') }}

WITH inventory_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'inventory') }}
)
SELECT
inventory_id,
film_id::INTEGER AS film_id,
store_id::INTEGER AS store_id,
last_update
FROM inventory_source