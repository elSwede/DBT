{{ config(materialized='table') }}

select distinct instructor_name from {{ source("PELOTON", "RIDES") }}
