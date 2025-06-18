{{ config(materialized='view') }}

WITH category_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'category') }}
)
SELECT
category_id,
name,
last_update
FROM category_source