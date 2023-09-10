<%@page import="dqd.sport.dao.ProductDao"%>
<%@page import="dqd.techtutorial.connection.*"%>
<%@page import="dqd.techtutorial.model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<title>DQD Sport - Soccer shoes</title>
<%@include file="includes/header.jsp"%>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-images/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">Price: <%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="#"
								class="btn btn-primary">Buy Now</a>
						</div>

					</div>
				</div>

			</div>
			<%
			}
			}else{
				out.println("There is no products !");
			}
			%>

		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>