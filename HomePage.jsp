<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>  -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
html {
	box-sizing: border-box;
}

.column {
	float: left;
	width: 33.3%;
	margin-bottom: 16px;
	padding: 0 8px;
}

.contain {
	padding: 0 16px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

#bgc {
	background-color: #00cccc;
	color: White;
}
</style>
<title>Bank</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0); 
String name = (String) session.getAttribute("name");
if(name==null || name=="")
{
	response.sendRedirect("login");
}
 %>
	<nav class="navbar" id="bgc">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Bank</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li class="navbar-text"><%=session.getAttribute("name")%></li>
			<li><a href="Logout">Logout</a></li>
		</ul>
	</div>
	</nav>

	<h1>Banking Application</h1>
	<pre>
    This site is only for the bank authorities who have access.
    You can add details of the new customers. view them according to the city. Also manipulate the data if required  
</pre>
	<br>

	<div class="container">

		<div class="row">
			<div class="column">
				<div class="card">
					<div class="contain">
						<h1>Mumbai</h1>
						<p>you can find the details of the bank that are present in
							mumbai.</p>
						<p>
							<button type="button" class="btn btn-primary btn-block"
								onclick="displayData('mumbai')">Details</button>
						</p>
						<br>
					</div>
				</div>
			</div>

			<div class="column">
				<div class="card">
					<div class="contain">
						<h1>Delhi</h1>
						<p>you can find the details of the bank that are present in
							delhi.</p>
						<p>
							<button type="button" class="btn btn-primary btn-block"
								onClick="displayData('delhi')">Details</button>
						</p>
						<br>
					</div>
				</div>
			</div>
			<div class="column">
				<div class="card">
					<div class="contain">
						<h1>Bangalore</h1>
						<p>you can find the details of the bank that are present in
							bangalore.</p>
						<p>
							<button type="button" class="btn btn-primary btn-block"
								onClick="displayData('bangalore')">Details</button>
						</p>
						<br>
					</div>
				</div>
			</div>
		</div>
		<button type="button" class="btn btn-success btn-lg" 
			data-toggle="modal" data-target="#add" style="margin-top: 200px; margin-left: 1150px">
			<span class="glyphicon glyphicon-plus"></span>
		</button>
		<div class="modal fade" id="add" role="dialog" tabindex="-1" style="z-index: 1060">
			<div class="modal-dialog">
				<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Add Your Details Here</h4>
						</div>
						<div class="modal-body">


							<div class="form-group">

								<label for="name">Enter your Name</label><br> <input
									type="text" name="name" id="nameId" class="form-control"
									required="required">

							</div>
							<div class="form-group">

								<label for="bankName">Enter your Bank Name</label><br> <input
									type="text" name="bankName" id="bankNameId" class="form-control"
									required="required">
							</div>
							<div class="form-group">
								<label for="accountNumber">Enter your Account Number </label><br>

								<input type="number" name="accountNumber" id="accountNumberId" class="form-control"
									required="required">

							</div>
							<div class="form-group">
								<label for="city">Enter Your City</label><br> 
								<select class="form-control" name="city" id="cityId">
									<option value="mumbai">Mumbai</option>
									<option value="delhi">Delhi</option>
									<option value="bangalore">Bangalore</option>
								</select>

							</div>
						</div>
						<div class="modal-footer">
							<button type="button" id="AddEdit" onClick="addData()" class="btn btn-success">ADD</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="city" role="dialog" style="z-index: 1050">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" id="city-title">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"></h4>
					</div>
					<div class="modal-body" id="details-table"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('document').ready(function() {

		});
		var currentCity="";
		var currentId=0;
		var edited=0;
		function displayData(city) {
			$.ajax({
				url : 'CollectDetails',
				type : 'post',
				dataType : 'JSON',
				data : {
					city : city
				},
				success : function(branchData) {
					currentCity=city;
					var data = "<table class='table table-striped'>" + "<thead >"
							+ "<tr>" + "<th>Name</th>" + "<th>Bank name</th>"
							+ "<th>Account number</th>" 
							+ "<th> Modify </th>" +
							"<th> Remove </th>"
							+"</tr>" + "</thead>"
							+ "<tbody>";
					for ( var i in branchData) {
						//console.log(branchData[i].name + " " + branchData[i].bankName+ " " + branchData[i].accountNumber + " " + branchData[i].city);

						data = data + "<tr>" + "<td>" + branchData[i].name
								+ "</td>" + "<td>" + branchData[i].bankName
								+ "</td>" + "<td>"
								+ branchData[i].accountNumber + "</td>"+
								"<td><button type='button' class='btn btn-success' data-target='#add'"+
								"onclick=edit('"+branchData[i].id+"')>edit</button></td>"+
								"<td> <button type='button' class='btn btn-danger'"+
								"onclick=remove('"+branchData[i].id+"')>delete</button></td>"
								+ "</tr>";

					}
					data = data + "</tbody> </table>";
					$('#city-title').html(city);
					$('#details-table').html(data);
					$('#city').modal('show');
				}
				
			});
		}
		function addData(){
			console.log($('#nameId').val());
			$.ajax({
				url :'UpdateBank' ,
				type :'post' ,
				data : { 
					name : $('#nameId').val(),
					bankName : $('#bankNameId').val() ,
					accountNumber : $('#accountNumberId').val(),
					city : $('#cityId').val(),
					id: currentId
				},
				success:function (){
					console.log("Added");
					$('#nameId').val(""),
					$('#bankNameId').val("") ,
					$('#accountNumberId').val(""),
					$('#cityId').val(""),
					$('#add').modal('hide');
					if(edited==1){
						displayData(currentCity);
						edited=0;
					}
					currentId="0";
				}
			});
		}
		
			function remove(id){
				
				$.ajax({
					url : 'RemoveData' ,
					type : 'post' ,
					data : {
						id : id 
					},
					success:function (){
						displayData(currentCity);
					}
				});
			}
			function edit(id){
				currentId=id;
				edited=1;
				$.ajax({
					url : 'CollectDataToModify' ,
					type : 'post' ,
					dataType :'JSON',
					data : {
						id : id 
					},
					success:function (person){
						$('#nameId').val(person.name),
						$('#bankNameId').val(person.bankName) ,
						$('#accountNumberId').val(person.accountNumber),
						$('#cityId').val(person.city),
						$('#add').modal('show');	
					}
				});
			}
	</script>
</body>
</html>