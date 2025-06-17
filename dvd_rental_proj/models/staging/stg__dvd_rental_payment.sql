WITH payment_source AS (
    SELECT *
    FROM { { source('project_dvd', 'payment') } }
)
SELECT
staff_id::INTEGER
FROM payment_source