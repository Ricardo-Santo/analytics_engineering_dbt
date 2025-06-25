-- Top 10 rented Films
SELECT
  title,
  count(film_id) AS number_of_rentals
FROM {{ ref('int__dvd_rental_rentals_per_film') }}
GROUP BY title order by number_of_rentals DESC limit(10)