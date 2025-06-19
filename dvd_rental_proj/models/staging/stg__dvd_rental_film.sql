{{ config(materialized='view') }}

WITH film_source AS (
    SELECT *
    FROM {{ source('project_dvd', 'film') }}
)
SELECT
film_id,
title,
release_year,
rental_duration::INTEGER AS rental_duration,
rental_rate,
replacement_cost,
last_update
FROM film_source