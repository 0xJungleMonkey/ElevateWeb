SELECT date_trunc('Month', creationdate) as "Month",count(contactid) as ContactRequestsPerMonth
FROM public.fact_contacts
GROUP BY "Month"
ORDER BY "Month" DESC;