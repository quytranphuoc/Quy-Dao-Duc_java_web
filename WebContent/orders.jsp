<%@page import="dqd.sport.connection.*"%>
<%@page import="dqd.sport.model.*"%>
<%@page import="java.util.*"%>
<%@page import="dqd.sport.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
		User auth = (User) request.getSession().getAttribute("auth");
		List<Order> orders = null;
		if(auth!=null){
			OrderDao orderDao  = new OrderDao(DbCon.getConnection());
			orders = orderDao.userOrders(auth.getId());
		}
		else{
			response.sendRedirect("login.jsp");
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
<title>DQD Sport - My Orders</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=o.getPrice()%></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>