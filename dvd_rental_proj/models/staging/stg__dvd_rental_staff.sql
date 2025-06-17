WITH staff_source AS (
    SELECT *
    FROM { { source('project_dvd', 'staff') } }
)
SELECT staff_id,
first_name,
last_name,
address_id::INTEGER,
store_id::INTEGER,
active,
username,
last_update
from staff_source