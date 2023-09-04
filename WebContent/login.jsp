<%@page import="dqd.techtutorial.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
		User auth = (User) request.getSession().getAttribute("auth");
		if(auth!=null){
			response.sendRedirect("index.jsp");
		}
	%>
<!DOCTYPE html>
<html>
<head>
<title>DQD Sport Login</title>
<%@include file="includes/header.jsp" %>
</head>
<body>

<%@include file="includes/navbar.jsp"%>

<div class="container">
	<div class="card w-50 mx-auto my-5">
		<div class="card-header text-center">User Login</div>
		<div class="card-body">
			<form action="user-login" method="post">
				<div class="form-group">
					<label>Email Adress</label>
					<input class="form-control" type="email" name="login-email" placeholder="Enter Your Email" required="required">
				</div>
				<div class="form-group">
					<label>Password</label>
					<input class="form-control" type="password" name="login-password" placeholder="Enter Your Password" required="required">
				</div>
				
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>