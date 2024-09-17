{{ config(materialized='table') }}

select distinct
  --{{ dbt-labs/dbt_utils.surrogate_key(['instructor_name']) }} as instructor_id
  --{{ dbt_utils.generate_surrogate_key(['instructor_name']) }} as instructor_id
  
 instructor_name
from {{ source("PELOTON", "RIDES") }}
