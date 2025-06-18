{{ config(materialized='view') }}

WITH store_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'store') }}
)
SELECT
store_id,
manager_staff_id::INTEGER AS manager_staff_id,
address_id,
last_update
FROM store_source