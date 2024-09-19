{{ config(materialized='table') }}

select distinct
  md5(concat(title, COALESCE(class_timestamp, workout_timestamp))) AS class_id
, md5(title) AS class_title_id
--, concat(title, class_timestamp)
, title AS class_name
, md5(COALESCE(instructor_name, 'No Instructor')) AS instructor_id
, COALESCE(live_on_demand, 'Personal') AS live_on_demand
, length_minutes AS duration
, fitness_discipline as fitness_discipline
, type as type
, class_timestamp
, COUNT(*) AS attendence_count
from {{ source("PELOTON", "PELOTON_WORKOUTS") }}
group by all