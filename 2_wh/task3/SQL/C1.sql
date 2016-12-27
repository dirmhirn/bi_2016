SELECT dm_factsales.ShipmentMethod, dm_location.CountryRegion, (sum(dm_factsales.IsLateShipment)/count(dm_factsales.IsLateShipment))*100
from dm_factsales
join dm_location
	on dm_location.AddressID = dm_factsales.ShipToAddressID
group by
	dm_factsales.ShipmentMethod,dm_location.CountryRegion
order by
	dm_location.CountryRegion asc,dm_factsales.ShipmentMethod asc;