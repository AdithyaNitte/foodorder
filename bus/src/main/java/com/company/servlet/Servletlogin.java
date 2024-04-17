package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.dao.UserDao;
import com.company.dao.UserDaoImp;

/**
 * Servlet implementation class Servletlogin
 */
public class Servletlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static UserDaoImp userDao = new UserDaoImp();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servletlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("hii i am login ");
		 String username = request.getParameter("username");
		 String password = request.getParameter("password");
		
		
		if (userDao.isValidUser (username, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("main.html"); 
		
		} else {

		response.sendRedirect("login.jsp?error=1"); System.out.println("Error A gya");

		}
	}
}
