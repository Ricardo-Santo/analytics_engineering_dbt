-- Rental-based performance index by store, before 2006
SELECT
  store_id,
  sum(total_rentals) AS total_rentals,
  avg(avg_rental_duration) AS avg_rental_duration,
  to_char(month, 'YYYY-MM') as month,
FROM {{ ref('int__dvd_rental_store_performance') }}
WHERE month <= date '2006-01-01'
GROUP BY store_id, month
ORDER BY store_id, month;