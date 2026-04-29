{{config(
    materialized='table',
    tags = ['silver']
)}}
with 

source as (

    select * from {{ source('posgre', 'ORDER_ITEM') }}

),

renamed as (

    select
        order_id,
        product_id,
        quantity,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed