with rentals_joined as (
    select
        f.film_id,
        f.title,
        s.store_id,
        date_trunc('month', r.rental_date) as month,
        r.rental_id
    from {{ ref('stg__dvd_rental_rental') }} r
    join {{ ref('stg__dvd_rental_inventory') }} i
      on r.inventory_id = i.inventory_id
    join {{ ref('stg__dvd_rental_film') }} f
      on i.film_id = f.film_id
    join {{ ref('stg__dvd_rental_staff') }} s
      on r.staff_id = s.staff_id
)

select
    film_id,
    title,
    store_id,
    month,
    count(rental_id) as rental_count
from rentals_joined
group by film_id, title, store_id, month
