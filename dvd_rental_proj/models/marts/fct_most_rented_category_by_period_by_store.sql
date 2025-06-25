-- Ranked most rented category by month and by store, before 2006

WITH rentals_by_store_month_category AS (
  SELECT
    c.store_id,
    c.category_name,
    COUNT(c.rental_id) AS rental_count,
    TO_CHAR(f.month, 'YYYY-MM') AS month
  FROM {{ ref('int__dvd_rental_rentals_by_category') }} c
  JOIN {{ ref('int__dvd_rental_rentals_per_film') }} f ON c.rental_id = f.rental_id
  WHERE f.month < DATE '2006-01-01'
    AND c.store_id IN (1, 2)
  GROUP BY c.store_id, TO_CHAR(f.month, 'YYYY-MM'), c.category_name
),

ranked_categories AS (
  SELECT *,
         RANK() OVER (PARTITION BY store_id, month ORDER BY rental_count DESC) AS rank
  FROM rentals_by_store_month_category
)

SELECT store_id, month, category_name, rental_count
FROM ranked_categories
WHERE rank = 1
ORDER BY store_id, month
