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

@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	UserDAO udao = new UserDAOImpl();
	User u = udao.getUserById(Integer.parseInt(req.getParameter("user_id")));
	if(u != null) {
		if(req.getParameter("password").equals(req.getParameter("confirm"))) {
			u.setEmail(req.getParameter("email"));
			u.setPassword(req.getParameter("password"));
			u.setPhone(Long.parseLong(req.getParameter("phone")));
			u.setUser_name(req.getParameter("user_name"));
			udao.updateUser(u);
			req.setAttribute("sucess", "sucessfully updated!");
			req.getRequestDispatcher("edit_profile.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("error", "password mismatch!");
			req.getRequestDispatcher("edit_profile.jsp").forward(req, resp);
		}
	}
	else {
		req.setAttribute("error", "user not found");
		req.getRequestDispatcher("edit_profile.jsp").forward(req, resp);
	}
}
}
