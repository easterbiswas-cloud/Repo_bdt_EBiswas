{{
    config(materialized = 'table')
}}

with cte_emp as

(
    select EMPLOYEE_ID as emp_id
            ,split_part(EMPLOYEE_NAME, ' ', 1) as first_name
            ,split_part(EMPLOYEE_NAME, ' ', 2) as last_name
            ,SALARY as salary
            ,HIRE_DATE as hire_date
            ,split_part(ADDRESS, ',', 1) as emp_street
            ,split_part(ADDRESS, ',', 2) as emp_city
            ,split_part(ADDRESS, ',', 3) as emp_zipcode

    from {{source('emp_dbt_model','employees')}} --DBT_EASTER_DB.DBT_EASTERBISWASCLOUD.employees
)
select * from cte_emp

