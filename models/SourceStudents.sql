
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_students as (

    select 1 as id, 'Zian' as FirstName, 'Biswas' as LastName
    union all
    select 2 as id, 'Audrika' as FirstName, 'Biswas' as LastName

)

select *
from source_students

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
