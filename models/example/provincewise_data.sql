
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

SELECT _ROW,
NEW_CASES, NEW_ACTIVE_CASES, NEW_CASES_PER_MILLION,
NEW_DEATHS, NEW_DEATHS_PER_MILLION,
NEW_RECOVERED,
TOTAL_CASES, TOTAL_ACTIVE_CASES, TOTAL_CASES_PER_MILLION,
TOTAL_DEATHS, TOTAL_DEATHS_PER_MILLION,
TOTAL_RECOVERED,
GROWTH_FACTOR_OF_NEW_DEATHS,
CAST(DATE AS DATETIME) AS DATE
FROM "FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_KESHAV_SARDA"
WHERE LOCATION_LEVEL = 'Province'
ORDER BY CAST(DATE AS DATETIME) DESC

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
