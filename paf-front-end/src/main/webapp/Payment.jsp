<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="com.electrogrid.model.*" %>
<%@ page import="com.electrogrid.repository.*" %>

<%
PaymentRepository paymentrepository=new PaymentRepository();
List<Payment> payments = paymentrepository.getPayments();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="Views/payment.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="Component/payments.js"></script>

<meta charset="ISO-8859-1">

<title>Payment List</title>


</head>
<body>
<figure class="text-center">
	<blockquote class="blockquote">
		<h2><b>PAYMENT MANAGEMENT</b></h2>
	</blockquote>
	<figcaption class="blockquote-footer">
		MANAGE THE PAYMENT DETAILS
	</figcaption>
</figure>


<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b> Payments</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addPaymentModal" class="btn btn-success"  data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Payment</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover"  id="displayPayments">
				<thead>
					<tr>
						<th>Name</th>
						<th>Account_no</th>
						<th>Amount</th>
						<th>Card_no</th>
						<th>Security_code</th>						
						<th>Expiration_date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<%for (int recodeCount = 0; recodeCount < payments.size();recodeCount++){ %>
				<% Payment payment = payments.get(recodeCount); %>
				
					<tr>
<!-- 						<td> </td> -->
						<td><%= payment.getName() %> </td>						
						<td><%= payment.getAccount_no() %> </td>						
						<td><%= payment.getAmount() %> </td>						
						<td><%= payment.getCard_no() %> </td>						
						<td><%= payment.getSecurity_code() %> </td>						
						<td><%= payment.getExpiration_date() %> </td>						
						
						<td>
							<a href="#editPaymentModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deletePaymentModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	</div>        
</div>

<!-- Edit Modal HTML -->
<div id="addPaymentModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Add Payment</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Account_no</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Amount</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Card_no</label>
						<input type="text" class="form-control" required>
					</div>		
					<div class="form-group">
						<label>Security_code</label>
						<input type="text" class="form-control" required>
					</div>	
					<div class="form-group">
						<label>Expiration_date</label>
						<input type="text" class="form-control" required>
					</div>						
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
			<div id="alertSuccess" class="alert alert-success"></div>
			<div id="alertError" class="alert alert-danger"></div>
		</div>
	</div>
</div>
<!-- Edit Modal HTML -->
<div id="editPaymentModal" name = "editPaymentModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="editformPayment" name="editformPayment">>
				<div class="modal-header">						
					<h4 class="modal-title">Edit Payment</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Name</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Account_no</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Amount</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Card_no</label>
						<input type="text" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Security_code</label>
						<input type="text" class="form-control" required>
					</div>	
					<div class="form-group">
						<label>Expiration_date</label>
						<input type="text" class="form-control" required>
					</div>				
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-info" value="Save">
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Delete Modal HTML -->
<div id="deletePaymentModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Delete Payment</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete" >
					 
				</div>
			</form>
		</div>
	</div>
</div>


</body>
</html>