<%@page import="dqd.sport.dao.ProductDao"%>
<%@page import="java.util.*"%>
<%@page import="dqd.sport.connection.*"%>
<%@page import="dqd.sport.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<title>DQD Sport - My Cart</title>
<%@include file="includes/header.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: $ 0</h3>
			<a class="mx-3 btn btn-primary" href="#">Check Outs</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td>ADIDAS X Speed Portal</td>
					<td>Soccer Shoes</td>
					<td>280</td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="1"
								class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-decre" href="#"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control" value="1"
									readonly="readonly"> <a class="btn bnt-sm btn-incre"
									href="#"><i class="fas fa-plus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="">Remove</a></td>

				</tr>
				
			</tbody>
		</table>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>