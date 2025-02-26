with
    fct_trips_qtr_year as (
        select
            *,
            extract(year from pickup_datetime) as year,
            extract(quarter from pickup_datetime) as quarter
        from {{ ref("fact_trips") }}
    )
select service_type, year, quarter, sum(total_amount) as sum_amount
from fct_trips_qtr_year
group by service_type, year, quarter
order by service_type, sum_amount
