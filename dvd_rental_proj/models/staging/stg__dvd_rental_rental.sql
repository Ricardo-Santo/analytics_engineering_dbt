WITH rental_source AS (
    SELECT *
    FROM { { source('project_dvd', 'rental') } }
)
SELECT
inventory_id::INTEGER
staff_id::INTEGER
FROM rental_source