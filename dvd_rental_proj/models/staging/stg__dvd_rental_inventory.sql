WITH inventory_source AS (
    SELECT *
    FROM { { source('project_dvd', 'inventory') } }
)
SELECT
film_id::INTEGER
store_id::INTEGER
FROM inventory_source