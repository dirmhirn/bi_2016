SELECT dm_customer.Name,sum(dm_factsales.OrderLineProfit) as profit
FROM dm_factsales
	join dm_time
		on dm_factsales.OrderDate = dm_time.DateID
	join dm_customer
		on dm_factsales.CustomerID = dm_customer.CustomerID
	join dm_product
		on dm_factsales.ProductID = dm_product.ProductID
    where
		dm_time.CalendarYear = 2014 AND dm_time.MonthNumberOfYear  >= 1 AND dm_time.MonthNumberOfYear <= 6 
    group by
		dm_customer.Name
	order by
		profit desc
	LIMIT 10;