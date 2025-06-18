{{ config(materialized='view') }}

WITH film_category_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'film_category') }}
)
SELECT
film_id::INTEGER AS film_id,
category_id::INTEGER AS category_id,
last_update
FROM film_category_source