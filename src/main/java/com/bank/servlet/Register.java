package com.bank.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.dao.UserDAO;
import com.bank.dao.impl.UserDAOImpl;
import com.bank.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet {

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	
	    	UserDAO udao= new UserDAOImpl();
	    	
	    	User u= new User();
	    	
	    	User alreadyExists=udao.getUserByMail(req.getParameter("mail"));
			if(alreadyExists==null) {
			if(req.getParameter("password").equalsIgnoreCase(req.getParameter("confirm"))) {
	    	
	        u.setUser_name(req.getParameter("name"));
	        u.setEmail(req.getParameter("mail"));
	        u.setPhone(Long.parseLong(req.getParameter("phone")));
	        u.setPassword(req.getParameter("password"));
	        List<User> li = udao.getAllUser();
	        if(li.size() == 0) {
	        	u.setRole("Manager");
	        }
	        else {
	        	u.setRole("Customer");
	        }
            udao.addUser(u);
        	req.setAttribute("sucess", "Account created!");
        	req.getRequestDispatcher("register.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("error", "password mismatch");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			}
			}
			
			else {
				req.setAttribute("error", "already account exists");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
	     
			
           }        
}

