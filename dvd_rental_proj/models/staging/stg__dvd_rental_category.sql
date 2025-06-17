WITH category_source AS (
    SELECT *
    FROM { { source('project_dvd', 'category') } }
)
SELECT
*
FROM category_source