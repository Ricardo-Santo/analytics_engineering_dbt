WITH inventory_source AS (
    SELECT *
    FROM { { source('project_dvd', 'inventory') } }
)
SELECT
*
FROM inventory_source