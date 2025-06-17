WITH rental_source AS (
    SELECT *
    FROM { { source('project_dvd', 'rental') } }
)
SELECT
staff_id::INTEGER
FROM rental_source