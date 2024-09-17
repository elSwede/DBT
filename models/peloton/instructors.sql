{{ config(materialized='table') }}

--select instructor_name from {{ source("PELOTON", "RIDES") }}
select distinct instructor_name from WORKOUTS.RAW_DATA.RIDES
