<html>
	<head>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
		<style>
			.div-container{
				text-align: center;
			}
			.table{
				display:none;
				width: auto !important;
			}
			.div-content{
				width:60%;
				margin-top:60px;
			}
			.code-container{
				text-align:left;
				margin: 10 0 20 0;
			}
			.centered{
				display:inline-block;
			}
			.code-container code{
				display:block;
			}
		</style>
	</head>
	<body>

	<div class="div-container">

		<h1>BentClipBros, LLC</h1>
		<div><em>We totally don't use sweatshops.</em></div>

		<div id="ohdiv" class="div-content centered">

			<h3>Get Customer's Order History</h3>

			<div class="text-info">Returns a customer's order history based on <strong>DAYSBACK</strong> and <strong>CUSTOMERNAME</strong> parameters.</div>

			<div class="code-container centered">
				<code>
					SELECT <br>
					&nbsp; o.id, <br>
					&nbsp; o.amount, <br>
					&nbsp; o.quantity, <br>
					&nbsp; o.confirmation_number, <br>
					&nbsp; c.name, <br>
					&nbsp; c.email, <br>
					&nbsp; c.phone <br>
					FROM ORDER o <br>
					INNER JOIN CUSTOMER c <br>
					&nbsp; ON o.customer_id = c.id <br>
					WHERE o.date_created < sysdate <br>
					&nbsp; AND o.date_created >= sysdate - <strong>DAYSBACK</strong> <br>
					&nbsp; AND c.name = 					<strong>CUSTOMERNAME</strong> <br>
				</code>
			</div>

			<form class="form-horizontal">
				<div class="form-group">
					<label for="customerNameInput" class="col-sm-6 control-label">Enter customer name (case-sensitive):</label>
					<div class="col-sm-3">
						<input type="text" id="customerNameInput" class="form-control" placeholder="Bob">
					</div>
					<div class="col-sm-3">&nbsp;</div>
				</div>

				<div class="form-group">
					<label for="daysBackInput" class="col-sm-6 control-label">Enter order history length (in days):</label>
					<div class="col-sm-3">
						<input type="number" id="daysBackInput" class="form-control" min="1" placeholder="500">
					</div>
					<div class="col-sm-3">&nbsp;</div>
				</div>

				<div class="form-group">
		    		<div>
						<input type="button" id="orderHistoryBtn" class="btn btn-primary" value="Submit">
					</div>
				</div>
			</form>



			<table id="orderHistoryTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Amount</th>
						<th>Quantity</th>
						<th>Confirmation Number</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>

		</div>

		<div id="bcdiv" class="div-content centered">

			<h3>Get Best Customers</h3>

			<div class="text-info">Returns our best customers based on their number of orders.</div>

			<div class="code-container centered">
				<code>
					SELECT <br>
					&nbsp; c.name, <br>
					&nbsp; COUNT(o.id) AS numOrders <br>
					FROM CUSTOMER c <br>
					INNER JOIN ORDER o <br>
					&nbsp; ON c.id = o.customer_id <br>
					INNER JOIN SUPPLIER s <br>
					&nbsp; ON o.supplier_id = s.id <br>
					INNER JOIN DESIGN d <br>
					&nbsp; ON s.design_id = d.id <br>
					INNER JOIN ARTIST a <br>
					&nbsp; ON d.artist_id = a.id <br>
					GROUP BY c.name <br>
					HAVING COUNT(o.id) >= 3 <br>
					ORDER BY c.name
				</code>
			</div>

			<form class="form-horizontal">
				<div class="form-group">
		    		<div>
						<input type="button" id="bestCustomersBtn" class="btn btn-primary" value="Submit">
					</div>
				</div>
			</form>

			<table id="bestCustomersTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Number of Orders</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<div id="ssdiv" class="div-content centered">

			<h3>Get Special Sales</h3>

			<div class="text-info">Returns the total sales for orders that contain design materials that are on special.</div>

			<div class="code-container centered">
				<code>
					SELECT <br>
					&nbsp; o.id, <br>
					&nbsp; SUM(o.amount * o.quantity) AS totalSales, <br>
					&nbsp; d.material <br>
					FROM ORDER o <br>
					INNER JOIN SUPPLIER s <br>
					&nbsp; ON o.supplier_id = s.id <br>
					INNER JOIN DESIGN d <br>
					&nbsp; ON s.design_id = d.id <br>
					WHERE d.material IN <br>
					&nbsp; (SELECT material <br>
					&nbsp; FROM SPECIAL) <br>
					GROUP BY o.id, d.material <br>
					ORDER BY o.id
				</code>
			</div>

			<form class="form-horizontal">
				<div class="form-group">
		    		<div>
						<input type="button" id="specialSalesBtn" class="btn btn-primary" value="Submit">
					</div>
				</div>
			</form>



			<table id="specialSalesTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Material</th>
						<th>Total Sales</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>

		</div>

		<div id="fadiv" class="div-content centered">

			<h3>Get Favorite Artist</h3>

			<div class="text-info">Returns the artist with the most number of orders.</div>

			<div class="code-container centered">
				<code>
					SELECT <br>
					&nbsp; name AS fav_artist, <br>
					&nbsp; quantity <br>
					FROM <br>
					&nbsp; (SELECT a.name, sum(o.quantity) AS quantity <br>
					&nbsp; FROM ORDER o <br>
					&nbsp; INNER JOIN SUPPLIER <br>
					&nbsp; &nbsp; ON o.supplier_id = s.id <br>
					&nbsp; INNER JOIN DESIGN d <br>
					&nbsp; &nbsp; ON s.design_id = d.id <br>
					&nbsp; INNER JOIN ARTIST a <br>
					&nbsp; &nbsp; ON d.artist_id = a.id <br>
					&nbsp; GROUP BY a.name <br>
					&nbsp; ORDER BY quantity DESC) <br>
					WHERE rownum <= 1
				</code>
			</div>

			<form class="form-horizontal">
				<div class="form-group">
		    		<div>
						<input type="button" id="favoriteArtistBtn" class="btn btn-primary" value="Submit">
					</div>
				</div>
			</form>



			<table id="favoriteArtistTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Favorite Artist</th>
						<th>Number of Orders</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>

		</div>

	</div>


	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.js"></script>
	<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript">

		$( document ).ready( function() {

			$("#orderHistoryBtn").click(function(){

				$.ajax({
					type: "POST",
					url: "Phase5Queries.cfc?method=getOrderHistory",
					data: ({
						customerName: 	$("#customerNameInput").val(),
						daysBack:		$("#daysBackInput").val()
					}),
					dataType: "HTML",
					error: function(msg){
			            alert(msg.statusText);
			            return msg;
			        },
					success: function(data){

						//Parse the returned json data
						var obj = $.parseJSON(data);

						if ( obj.DATA.length == 0 ){

							//Client-side validation
							var name = $("#customerNameInput").val();

							if ( name == "" ){
								alert("Please enter a customer's name.");
								return;
							}

							var days = $("#daysBackInput").val();

							if ( days == "" ){
								alert("Please a order history length.");
								return;
							} else if ( days < 1 ){
								alert("Order history length cannot be 0 or negative.");
								$("#daysBackInput").val("");
								return;
							}

							$("#orderHistoryTable").hide();
							alert("No data found for " + name + " in the past " + days + " days.");

							return;
						};

						//Remove old table data
						$("#orderHistoryTable > tbody > tr > td").remove();

						//Add the parsed JSON data to the table row by row

						$.each(obj.DATA, function(index, itemData){
							$("#orderHistoryTable > tbody:last").append("<tr>"+
								"<td>" + itemData[0] + "</td>" +
								"<td>" + itemData[1] + "</td>" +
								"<td>" + itemData[2] + "</td>" +
								"<td>" + itemData[3] + "</td>" +
								"<td>" + itemData[4] + "</td>" +
								"<td>" + itemData[5] + "</td>" +
								"<td>" + itemData[6] + "</td>"
							)
						});

						//Center the table
						$("#orderHistoryTable").addClass("centered");

						//Show the table if it's hidden'
						$("#orderHistoryTable").show();
					}
				});


			});

			$("#bestCustomersBtn").click(function(){

				$.ajax({
					type: "POST",
					url: "Phase5Queries.cfc?method=getBestCustomers",
					error: function(msg){
			            alert(msg.statusText);
			            return msg;
			        },
					success: function(data){

						//Parse the returned json data
						var obj = $.parseJSON(data);

						if ( obj.DATA.length == 0 ){
							alert("No best customers found.");
							$("#bestCustomersTable").hide();
							return;
						};

						//Remove old table data
						$("#bestCustomersTable > tbody > tr > td").remove();

						//Add the parsed JSON data to the table row by row

						$.each(obj.DATA, function(index, itemData){
							$("#bestCustomersTable > tbody:last").append("<tr>"+
								"<td>" + itemData[0] + "</td>" +
								"<td>" + itemData[1] + "</td>"
							)
						});

						//Center the table
						$("#bestCustomersTable").addClass("centered");

						//Show the table if it's hidden'
						$("#bestCustomersTable").show();
					}
				});


			});

			$("#specialSalesBtn").click(function(){

				$.ajax({
					type: "POST",
					url: "Phase5Queries.cfc?method=getSpecialSales",
					error: function(msg){
			            alert(msg.statusText);
			            return msg;
			        },
					success: function(data){

						//Parse the returned json data
						var obj = $.parseJSON(data);

						if ( obj.DATA.length == 0 ){
							alert("No special sales found.");
							$("#specialSalesTable").hide();
							return;
						};

						//Remove old table data
						$("#specialSalesTable > tbody > tr > td").remove();

						//Add the parsed JSON data to the table row by row

						$.each(obj.DATA, function(index, itemData){
							$("#specialSalesTable > tbody:last").append("<tr>"+
								"<td>" + itemData[0] + "</td>" +
								"<td>" + itemData[1] + "</td>" +
								"<td>" + itemData[2] + "</td>"
							)
						});

						//Center the table
						$("#specialSalesTable").addClass("centered");

						//Show the table if it's hidden'
						$("#specialSalesTable").show();
					}
				});


			});

			$("#favoriteArtistBtn").click(function(){

				$.ajax({
					type: "POST",
					url: "Phase5Queries.cfc?method=getFavoriteArtist",
					error: function(msg){
			            alert(msg.statusText);
			            return msg;
			        },
					success: function(data){

						//Parse the returned json data
						var obj = $.parseJSON(data);

						if ( obj.DATA.length == 0 ){
							alert("No favorite artist found.");
							$("#favoriteArtistTable").hide();
							return;

						};

						//Remove old table data
						$("#favoriteArtistTable > tbody > tr > td").remove();

						//Add the parsed JSON data to the table row by row

						$.each(obj.DATA, function(index, itemData){
							$("#favoriteArtistTable > tbody:last").append("<tr>"+
								"<td>" + itemData[0] + "</td>" +
								"<td>" + itemData[1] + "</td>"
							)
						});

						//Center the table
						$("#favoriteArtistTable").addClass("centered");

						//Show the table if it's hidden'
						$("#favoriteArtistTable").show();
					}
				});


			});

		});
	</script>


	</body>
</html>