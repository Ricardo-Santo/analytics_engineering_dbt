-- Monthly revenue-based performance index by store, after 2006

{% set store_ids = [1, 2] %}

WITH
{% for store_id in store_ids %}
store_{{ store_id }} AS (
SELECT
  store_id,
  sum(total_revenue) as total_revenue,
  to_char(month, 'YYYY-MM') as month
FROM {{ ref('int__dvd_rental_store_performance') }}
WHERE month >= date '2007-01-01' AND store_id = {{ store_id }}
GROUP BY store_id, month
ORDER BY store_id, month
),

{% endfor %}

performance_revenue_by_store AS (
  {% for store_id in store_ids %}
  SELECT * FROM store_{{ store_id }}
  {% if not loop.last %} UNION ALL {% endif %}
  {% endfor %}
)

SELECT * FROM performance_revenue_by_store
ORDER BY store_id ASC, month ASC