-- join payment information to the corresponding store

with payment_data as (
    select
        p.payment_id,
        p.customer_id,
        p.staff_id,
        p.amount,
        p.payment_date,
        s.store_id
    from {{ ref('stg__dvd_rental_payment') }} p
    join {{ ref('stg__dvd_rental_staff') }} s
      on p.staff_id = s.staff_id
)

select *
from payment_data