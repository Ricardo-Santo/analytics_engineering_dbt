-- Sum of total payments
SELECT
  store_id,
  DATE_TRUNC('month', payment_date) AS month,
  SUM(amount) AS total_income
FROM {{ ref('int__dvd_rental_payment_store') }}
GROUP BY store_id, DATE_TRUNC('month', payment_date)