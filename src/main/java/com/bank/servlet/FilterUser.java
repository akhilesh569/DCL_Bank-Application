package com.bank.servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import com.bank.dao.UserDAO;
import com.bank.dao.impl.UserDAOImpl;
import com.bank.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/filteruser")
public class FilterUser extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String mail = req.getParameter("mail");
		UserDAO udao = new UserDAOImpl();
		List<User> users = udao.getAllUser().stream().filter(u1->u1.getRole().equalsIgnoreCase("customer")).collect(Collectors.toList());
		if(name != null && !name.trim().isEmpty()) {
			users = users.stream().filter(u->u.getUser_name().toLowerCase().contains(name.trim().toLowerCase())).collect(Collectors.toList());
		}
		if(mail != null && !mail.trim().isEmpty()) {
			users = users.stream().filter(u->u.getEmail().toLowerCase().contains(mail.trim().toLowerCase())).collect(Collectors.toList());
		}
		
		req.setAttribute("filterUser", users);
		req.getRequestDispatcher("viewallusers.jsp").forward(req, resp);
	}

}
