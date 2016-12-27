select dm_time.CalendarYear,dm_time.MonthNumberOfYear,dm_product.ProductTopCategory,sum(dm_factsales.OrderLineProfit) as profit
	from dm_factsales
	join dm_time
		on dm_factsales.OrderDate = dm_time.DateID
	join dm_product
		on dm_factsales.ProductID = dm_product.ProductID
	where
		DATE(CONCAT(CONCAT(CAST(dm_time.CalendarYear AS CHAR),'-'),(CONCAT(CONCAT(RIGHT(CONCAT('0',CAST(dm_time.MonthNumberOfYear AS CHAR)),2),'-'),RIGHT(CONCAT('0',CAST(day(curdate()) as char)),2)))))
		>= (DATE_SUB(CURDATE(),INTERVAL 2 year))
    group by
		dm_time.CalendarYear,dm_time.MonthNumberOfYear,dm_product.ProductTopCategory
	order by
		dm_time.CalendarYear asc,dm_time.MonthNumberOfYear asc,dm_time.DayNumberOfMonth asc,dm_product.ProductTopCategory asc;