{{ config(materialized='table') }}

select distinct
  md5(title) AS class_title_id
, title AS class_name
, length_minutes AS duration
, fitness_discipline as fitness_discipline
, type as type
, COUNT(*) AS attendence_count
from {{ source("PELOTON", "PELOTON_WORKOUTS") }}
group by all