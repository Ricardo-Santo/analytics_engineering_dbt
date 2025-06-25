# Marts docs

{% docs fct_rental_performance_by_store %}
Fact table that captures the **monthly rental performance** of each store **before 2006**. It includes total rentals and the average duration of those rentals, helping to evaluate store performance on a pre-revenue basis.
{% enddocs %}

{% docs fct_revenue_performance_by_store %}
Fact table summarizing the **monthly revenue performance** of each store **after 2006**. Contains total revenue per month.
{% enddocs %}

{% docs fct_most_rented_category_by_period_by_store %}
Fact table that captures the **most rented category** of each store **before 2006**, by **month**. In includes the most rented category name for each month, helping to understand what type of category performed the best in a given month.
{% enddocs %}
