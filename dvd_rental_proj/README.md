# Welcome to your new dbt project

## Using the starter project

Try running the following commands:

- dbt run
- dbt test

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Add questions here

## In the Staging layer, we decide to materialize the table into views, so as to not take too much space

### We defined the sources model and placed it inside the staging folder

### We also decided to convert some of the data types from smallint to integer

### tables

### - film_category: film_id and category_id columns

### - inventory: film_id and store_id columns

### - payment: staff_id and rental_id columns

### - rental: staff_id column

### - staff: address_id and store_id columns

### - store: manager_staff_id column

### The justification for this was that in the next layer we will be merging and joining data tables, we want to have coherent data aggregation between the tables

### Some columns where also dropped from the staff table because it did not contain relevant information for the questions we where given to asnwer

### Tests, descriptions and relationships where also developed for each data table selected, and it's present in the schema.yml inside the staging folder
