<%@page import="dqd.sport.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
	
}
%>
<!DOCTYPE html>
<html>
<head>
<title>DQD Sport - Register Account</title>
<%@include file="includes/header.jsp"%>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Register Account</div>
			<div class="card-body">
				<form action="user-register" method="post">
					<div class="form-group">
						<label>Name</label> <input class="form-control"
							type="text" name="regiter-name" placeholder="Enter Your Name"
							required="required">
					</div>
					<div class="form-group">
						<label>Email Address</label> <input class="form-control"
							type="email" name="regiter-email" placeholder="Enter Your Email"
							required="required">
					</div>
					<div class="form-group">
						<label>Password</label> <input class="form-control"
							type="password" name="regiter-password"
							placeholder="Enter Your Password" required="required">
					</div>
				
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Register</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>