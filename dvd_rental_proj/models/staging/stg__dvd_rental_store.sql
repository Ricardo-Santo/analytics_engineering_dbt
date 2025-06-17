WITH store_source AS (
    SELECT *
    FROM { { source('project_dvd', 'store') } }
)
SELECT
staff_id::INTEGER
FROM store_source