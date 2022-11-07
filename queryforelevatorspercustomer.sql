SELECT companyname as "Customer", count(nbelevators) as ElevatorsPerCustomer

FROM public.dim_customers
GROUP BY "companyname";