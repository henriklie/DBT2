WITH orders as (
    select order_id
           ,customer_id
           ,order_date
           From {{ref('stg_orders')}}
),

payments as (
    select orderid, sum(amount) amount
    from {{(ref('stg_payments'))}}
    where status = 'success'
    group by orderid
),

final as (

select *
from orders o
left join payments p on o.order_id = p.OrderId

)

select * from final