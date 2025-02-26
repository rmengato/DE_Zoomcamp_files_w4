with fct_trips_qtr_year as (
    select *,
    DATEPART('YEAR', pickup_datetime) AS YEAR,
    DATEPART('QUARTER', pickup_datetime) as quarter
    from {{ ref('fact_trips') }}
)



select * from fct_trips_qtr_year limit 10