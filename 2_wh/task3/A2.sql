select dm_product.ProductTopCategory, sum(dm_factsales.OrderLineTotal) as revenue
	from dm_factsales
	join dm_time
		on dm_factsales.OrderDate = dm_time.DateID
	join dm_product
		on dm_factsales.ProductID = dm_product.ProductID
	where
		dm_time.CalendarYear = 2014
    group by
		dm_product.ProductTopCategory
	order by
		dm_product.ProductTopCategory asc;