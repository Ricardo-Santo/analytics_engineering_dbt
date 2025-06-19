with rentals_joined as (
    select
        r.rental_id,
        r.rental_date,
        c.name as category_name,
        s.store_id
    from {{ ref('stg__dvd_rental_rental') }} r
    join {{ ref('stg__dvd_rental_inventory') }} i on r.inventory_id = i.inventory_id
    join {{ ref('stg__dvd_rental_film') }} f on i.film_id = f.film_id
    join {{ ref('stg__dvd_rental_film_category') }} fc on f.film_id = fc.film_id
    join {{ ref('stg__dvd_rental_category') }} c on fc.category_id = c.category_id
    join {{ ref('stg__dvd_rental_staff') }} s on r.staff_id = s.staff_id
),

rentals_grouped as (
    select
        store_id,
        date_trunc('month', rental_date) as month,
        category_name,
        count(*) as rental_count
    from rentals_joined
    group by store_id, month, category_name
)

select *
from rentals_grouped
