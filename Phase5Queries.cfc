<cfcomponent displayName="Phase 5 queries">

	<cffunction name="getOrderHistory" returntype="query" returnformat="json" access="remote" hint="Get user's order history for a given number of days">
		<cfargument name="customerName" required ="true" 	type="string">
		<cfargument name="daysBack" 	required="true" 	type="numeric">
		<cfquery name="orderHistoryQuery" datasource="bentclipbros-dev.com" >
			select o.id
			, o.amount
			, o.quantity
			, o.confirmation_number
			, c. name
			, c.email
			, c.phone
			from MATT.ORDERS o
			inner join MATT.customer c
			  on o.customer_id = c.id
			where o.date_created < sysdate
				AND o.date_created >= sysdate - <cfqueryparam value="#arguments.daysBack#" 		cfsqltype="CF_SQL_INTEGER">
				AND c.name = 					<cfqueryparam value="#arguments.customerName#" 	cfsqltype="CF_SQL_VARCHAR" maxLength="20">
		</cfquery>
		<cfreturn orderHistoryQuery>
	</cffunction>

	<cffunction name="getBestCustomers" returntype="query" returnformat="json" access="remote" hint="Select our best customers">
		<cfquery name="bestCustomers" datasource="bentclipbros-dev.com">
			SELECT c.name, COUNT(o.id) AS numOrders
			FROM MATT.CUSTOMER c
			INNER JOIN MATT.ORDERS o
			  ON c.id = o.customer_id
			INNER JOIN MATT.supplier s
			  ON o.supplier_id = s.id
			INNER JOIN MATT.design d
			  ON s.design_id = d.id
			INNER JOIN MATT.artist a
			  ON d.artist_id = a.id
			GROUP BY c.name
			HAVING COUNT(o.id) >= 3
			ORDER BY c.name
		</cfquery>
		<cfreturn bestCustomers>
	</cffunction>

	<cffunction name="getSpecialSales" returntype="query" returnformat="json" access="remote" hint="Find the total sales for orders that contain design materials on special">
		<cfquery name="specialSales" datasource="bentclipbros-dev.com" >
			SELECT o.id, SUM(o.amount * o.quantity) AS totalSales, d.material
			FROM MATT.ORDERS o
			INNER JOIN MATT.SUPPLIER s
			  ON o.supplier_id = s.id
			INNER JOIN MATT.DESIGN d
			  ON s.design_id = d.id
			WHERE d.material IN
			  (SELECT material
			   FROM MATT.SPECIAL)
			GROUP BY o.id, d.material
			ORDER BY o.id
		</cfquery>
		<cfreturn specialSales>
	</cffunction>

	<cffunction name="getFavoriteArtist" returntype="query" returnformat="json" access="remote" hint="Select our favorite artist by quantity of order">
		<cfquery name="favoriteArtist" datasource="bentclipbros-dev.com" >
			select name as fav_artist, quantity from
			(select a.name, sum(o.quantity) as quantity
			from MATT.ORDERS o
			inner join MATT.supplier s
			  on o.supplier_id = s.id
			inner join MATT.design d
			  on s.design_id = d.id
			inner join MATT.artist a
			  on d.artist_id = a.id
			group by a.name
			order by quantity desc)
			where rownum <= 1
		</cfquery>
		<cfreturn favoriteArtist>
	</cffunction>

</cfcomponent>