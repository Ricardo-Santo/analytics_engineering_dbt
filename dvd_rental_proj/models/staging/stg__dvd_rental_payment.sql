WITH payment_source AS (
    SELECT *
    FROM { { source('project_dvd', 'payment') } }
)
SELECT
staff_id::INTEGER
rental_id::INTEGER
FROM payment_source