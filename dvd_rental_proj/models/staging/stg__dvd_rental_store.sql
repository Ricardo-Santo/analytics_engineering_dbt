WITH store_source AS (
    SELECT *
    FROM { { source('project_dvd', 'store') } }
)
SELECT
manager_staff_id::INTEGER
FROM store_source