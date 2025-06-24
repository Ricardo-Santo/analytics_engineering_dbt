-- Sum of total payments
SELECT
  r.store_id,
  SUM(r.amount) AS avg_payment

from {{ ref('int__dvd_rental_payment_store') }} r
GROUP BY r.store_id