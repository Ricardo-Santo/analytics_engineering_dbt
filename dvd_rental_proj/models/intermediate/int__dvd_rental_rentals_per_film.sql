-- calculates how often each film was rented

with rentals_joined as (
    select
        f.film_id AS film_id,
        f.title AS title,
        s.store_id AS store_id,
        date_trunc('month', r.rental_date) as month,
        r.rental_id AS rental_id
    from {{ ref('stg__dvd_rental_rental') }} r
    join {{ ref('stg__dvd_rental_inventory') }} i on r.inventory_id = i.inventory_id
    join {{ ref('stg__dvd_rental_film') }} f on i.film_id = f.film_id
    join {{ ref('stg__dvd_rental_staff') }} s on r.staff_id = s.staff_id
    GROUP BY f.film_id, f.title, s.store_id, month, rental_id
    )

select *
from rentals_joined