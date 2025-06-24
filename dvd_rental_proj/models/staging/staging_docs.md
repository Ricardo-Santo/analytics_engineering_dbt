# Staging docs

{% docs stg__dvd_rental_category %}
Staging table for the **category** entity. Contains a unique identifier and the name of each film category, along with the timestamp of the last update.
{% enddocs %}

{% docs stg__dvd_rental_film_category %}
Staging table representing the relationship between films and their categories. Links each film to its category using foreign keys, and includes a timestamp for the last update.
{% enddocs %}

{% docs stg__dvd_rental_film %}
Staging table for **film** entities. Includes key metadata such as title, release year, rental and replacement costs, and timestamps. Acts as a dimension table for film attributes.
{% enddocs %}

{% docs stg__dvd_rental_inventory %}
Staging table representing the inventory of films available in each store. Maps **film_id** to **store_id** via **inventory_id**, with a last update timestamp.
{% enddocs %}

{% docs stg__dvd_rental_payment %}
Staging table for payment transactions. Contains detailed payment data, including foreign keys to rentals, customers, and staff, plus payment amounts and timestamps.
{% enddocs %}

{% docs stg__dvd_rental_rental %}
Staging table capturing each rental event. Includes start and return timestamps, references to inventory and customer, and the staff member who managed the rental.
{% enddocs %}

{% docs stg__dvd_rental_staff %}
Staging table with staff member information, such as names, address, username, and store assignment. Also tracks whether the staff is active and their last update.
{% enddocs %}

{% docs stg__dvd_rental_store %}
Staging table for store-level information. Includes the store manager and address, with a unique identifier and update timestamp.
{% enddocs %}

{% docs stg__dvd_rental_customer %}
Staging table for customer records. Contains only anonymized or non-personal data, with references to store, activity status, and timestamps for creation and updates.
{% enddocs %}
