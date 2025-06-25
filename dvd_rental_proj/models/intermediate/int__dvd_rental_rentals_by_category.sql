-- aggregate rental counts per category, store, and period
with rentals_joined as (
    select
        s.store_id AS store_id,
        c.name as category_name,
        r.rental_id AS rental_id,
        r.rental_date AS rental_date
    from {{ ref('stg__dvd_rental_rental') }} r
    join {{ ref('stg__dvd_rental_inventory') }} i on r.inventory_id = i.inventory_id
    join {{ ref('stg__dvd_rental_film') }} f on i.film_id = f.film_id
    join {{ ref('stg__dvd_rental_film_category') }} fc on f.film_id = fc.film_id
    join {{ ref('stg__dvd_rental_category') }} c on fc.category_id = c.category_id
    join {{ ref('stg__dvd_rental_staff') }} s on r.staff_id = s.staff_id
    GROUP BY s.store_id, category_name, rental_date, rental_id
    )

select *
from rentals_joined