{{config(
    materialized='table',
    tags = ['silver']
)}}
with 

source as (

    select * from {{ source('posgre', 'ADDRESS') }}

),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        state,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed