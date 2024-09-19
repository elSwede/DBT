{{ config(materialized='table') }}

select
  md5(concat(title, workout_timestamp)) AS workout_id
, md5(concat(title, COALESCE(class_timestamp, workout_timestamp))) AS class_id
, md5(title) AS class_title_id
, WORKOUT_TIMESTAMP --VARCHAR(16777216),
, LIVE_ON_DEMAND --VARCHAR(16777216),
, md5(COALESCE(instructor_name, 'No Instructor')) AS instructor_id
, INSTRUCTOR_NAME --VARCHAR(16777216),
, LENGTH_MINUTES --NUMBER(38,0),
, FITNESS_DISCIPLINE --VARCHAR(16777216),
, TYPE --VARCHAR(16777216),
, TITLE --VARCHAR(16777216),
, CLASS_TIMESTAMP --VARCHAR(16777216),
, TOTAL_OUTPUT --NUMBER(38,0),
, AVG_WATTS --NUMBER(38,0),
, AVG_RESISTANCE --VARCHAR(16777216),
, AVG_CADENCE --NUMBER(38,0),
, AVG_SPEED --NUMBER(38,2),
, DISTANCE --NUMBER(38,2),
, CALORIES_BURNED --NUMBER(38,0),
, AVG_HEARTRATE --NUMBER(38,2)
from {{ source("PELOTON", "PELOTON_WORKOUTS") }}