-- Monthly revenue-based performance index by store, after 2006

SELECT
  store_id,
  sum(total_revenue) as total_revenue,
  to_char(month, 'YYYY-MM') as month
FROM {{ ref('int__dvd_rental_store_performance') }}
WHERE month >= date '2007-01-01'
GROUP BY store_id, month
ORDER BY store_id, month