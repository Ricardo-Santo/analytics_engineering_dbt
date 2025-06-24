-- calculate revenue and rental activity per customer, typically aggregated by month.

with customer_payments as (
    select
        p.customer_id,
        c.store_id,
        date_trunc('month', p.payment_date) as month,
        sum(p.amount) as total_revenue,
        count(p.payment_id) as num_payments
    from {{ ref('stg__dvd_rental_payment') }} p
    join {{ ref('stg__dvd_rental_customer') }} c on p.customer_id = c.customer_id
    group by p.customer_id, c.store_id, month
),

customer_rentals as (
    select
        r.customer_id,
        date_trunc('month', r.rental_date) as month,
        count(r.rental_id) as total_rentals
    from {{ ref('stg__dvd_rental_rental') }} r
    group by r.customer_id, month
)

select
    cp.customer_id,
    cp.store_id,
    cp.month,
    cp.total_revenue,
    cp.num_payments,
    cr.total_rentals
from customer_payments cp
join customer_rentals cr
on cp.customer_id = cr.customer_id
