WITH payments as (
    select id ,
    orderid,
    paymentmethod ,
    status,
    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created

    from raw.stripe.payment
)
select * from payments