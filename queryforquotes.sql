SELECT date_trunc('Month', creation) as "Month",count(quoteid) as QuotePerMonth
FROM public.fact_quotes
GROUP BY "Month"
ORDER BY "Month" DESC;