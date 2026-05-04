with 

source as (

    select * from {{ source('postgre_db', 'address') }}

),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        initcap(state),
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed