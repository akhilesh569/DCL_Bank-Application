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

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	UserDAO udao = new UserDAOImpl();
	User u = udao.getUserByMail(req.getParameter("mail"));
	
	if(u != null) {
		if(req.getParameter("password").equals(req.getParameter("confirm"))) {
			u.setPassword(req.getParameter("password"));
			udao.updateUser(u);
			req.setAttribute("sucess", "updated sucessfully");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("error", "password mismatch!");
			req.getRequestDispatcher("password.jsp").forward(req, resp);
		}
	}
	else {
		req.setAttribute("error", "user not found");
		req.getRequestDispatcher("password.jsp").forward(req, resp);
	}
	
	
	
	
}
}
