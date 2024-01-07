<%@page import="dqd.sport.model.Admin"%>
<%@page import="dqd.sport.connection.*"%>

<% 
	
    Admin admin = (Admin) session.getAttribute("loggedAdmin");
    if(admin == null){
        response.sendRedirect("adminlogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
    </head>
    <body>
        
        <%= admin.getEmail() %>
        
    </body>
</html>