with revenue as (
    select
        store_id,
        date_trunc('month', payment_date) as month,
        sum(amount) as total_revenue
    from {{ ref('int__payment_store') }}
    group by store_id, month
),

rental_counts as (
    select
        s.store_id,
        date_trunc('month', r.rental_date) as month,
        count(*) as total_rentals
    from {{ ref('stg__dvd_rental_rental') }} r
    join {{ ref('stg__dvd_rental_staff') }} s on r.staff_id = s.staff_id
    group by s.store_id, month
),

avg_duration as (
    select
        s.store_id,
        date_trunc('month', r.rental_date) as month,
        avg(return_date - rental_date) as avg_rental_duration
    from {{ ref('stg__dvd_rental_rental') }} r
    join {{ ref('stg__dvd_rental_staff') }} s on r.staff_id = s.staff_id
    where r.return_date is not null
    group by s.store_id, month
)

select
    coalesce(revenue.store_id, rental_counts.store_id, avg_duration.store_id) as store_id,
    coalesce(revenue.month, rental_counts.month, avg_duration.month) as month,
    revenue.total_revenue,
    rental_counts.total_rentals,
    avg_duration.avg_rental_duration
from revenue
full outer join rental_counts
  on revenue.store_id = rental_counts.store_id and revenue.month = rental_counts.month
full outer join avg_duration
  on revenue.store_id = avg_duration.store_id and revenue.month = avg_duration.month
