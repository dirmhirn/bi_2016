SELECT dm_location.CountryRegion,sum(dm_factsales.OrderLineProfit) as profit
FROM dm_factsales
	join dm_location
		on dm_factsales.BillToAddressID = dm_location.AddressID
	join dm_time
		on dm_factsales.OrderDate = dm_time.DateID
	where
		dm_time.CalendarYear = 2013
    group by
		dm_location.CountryRegion
	order by
		profit desc, dm_location.CountryRegion asc;