# Intermediate docs

{% docs int__dvd_rental_payment_store %}
Intermediate model that aggregates payment data by store, linking **customers**, **staff**, and **payment details** with the associated store where the transaction occurred. Useful for downstream analysis of store-level payments.
{% enddocs %}

{% docs int__dvd_rental_rentals_by_category %}
Intermediate aggregation of **rental counts** by film **category** and **store**. Supports reporting and analytics around popular genres at each location.
{% enddocs %}

{% docs int__dvd_rental_rentals_per_film %}
Counts how many times each **film** was rented at each **store**, including film title and rental volume. Useful for understanding film popularity and demand.
{% enddocs %}

{% docs int__dvd_rental_customer_revenue %}
Intermediate model aggregating **customer-level revenue**, including the number of rentals and payments per customer per month. Supports segmentation and revenue contribution analysis.
{% enddocs %}

{% docs int__dvd_rental_store_performance %}
Combines multiple performance metrics at the **store-month level**, such as total revenue, rental volume, and average rental duration. This model acts as a base for the **store performance index** and comparison across stores.
{% enddocs %}
