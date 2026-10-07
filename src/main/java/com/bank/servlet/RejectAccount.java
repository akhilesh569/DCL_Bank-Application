package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.AccountDAO;
import com.bank.dao.impl.AccountDAOImpl;
import com.bank.dto.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/rejectAccount")
public class RejectAccount extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountDAO adao = new AccountDAOImpl();
		Account a = adao.getAccountById(Integer.parseInt(req.getParameter("accid")));
		if(a != null && a.getStatus().equalsIgnoreCase("pending")) {
			a.setStatus("rejected");
			adao.updateAccount(a);
		}
		resp.sendRedirect("admin.jsp");
	}

}
