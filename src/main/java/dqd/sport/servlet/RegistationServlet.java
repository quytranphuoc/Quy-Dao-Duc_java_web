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
import dqd.sport.dao.UserDatabase;
import dqd.sport.model.User;

@WebServlet("/user-register")
public class RegistationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("registation.jsp");;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String name = request.getParameter("regiter-name");
			String email = request.getParameter("regiter-email");
			String password = request.getParameter("regiter-password");
		
			//make user object
			User userModel = new User(name, email, password);
			
			//create a database model
			UserDatabase regUser;
			try {
				regUser = new UserDatabase(DbCon.getConnection());
				if (regUser.saveUsers(userModel)) {
					   response.sendRedirect("index.jsp");
					} else {
					    String errorMessage = "User Available";
					    HttpSession regSession = request.getSession();
					    regSession.setAttribute("RegError", errorMessage);
					    response.sendRedirect("registation.jsp");
					}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}}}
