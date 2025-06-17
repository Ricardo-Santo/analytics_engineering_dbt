WITH film_category_source AS (
    SELECT *
    FROM { { source('project_dvd', 'film_category') } }
)
SELECT
film_id::INTEGER
category_id::INTEGER
FROM film_category_source