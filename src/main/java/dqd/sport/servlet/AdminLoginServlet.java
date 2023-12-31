package dqd.sport.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dqd.sport.connection.DbCon;
import dqd.sport.dao.AdminDao;
import dqd.sport.model.Admin;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {


	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            AdminDao ado;
			try {
				ado = new AdminDao(DbCon.getConnection());
				Admin admin = ado.logAdmin(email, password);
	            if(admin!=null){
	                HttpSession session = request.getSession();
	                session.setAttribute("loggedAdmin", admin); 
	                response.sendRedirect("adminpanel.jsp");
	            }else{
	                out.println("unknown credential");
	            }
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
        }
    }

	  @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

}
