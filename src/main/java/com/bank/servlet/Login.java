package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.UserDAO;
import com.bank.dao.impl.UserDAOImpl;
import com.bank.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO udao = new UserDAOImpl();
		User u = udao.getUserByMailAndPassword(req.getParameter("mail"), req.getParameter("password"));
		if(u != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", u);
			if(u.getRole().equals("Customer")) {
				resp.sendRedirect("user_db.jsp");
			}
			else {
				resp.sendRedirect("admin.jsp");
			}
		}
		else {
		  req.setAttribute("error", "invalid credentials!");
		  req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
	
  
	
}
