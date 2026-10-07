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

@WebServlet("/updateAccount")
public class UpdateAccount extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountDAO adao = new AccountDAOImpl();
		Account a = adao.getAccountById(Integer.parseInt(req.getParameter("accid")));
		if(a != null) {
			a.setAcc_type(req.getParameter("type"));
			a.setBranch_id(Integer.parseInt(req.getParameter("branch_id")));
			a.setStatus(req.getParameter("status"));
			adao.updateAccount(a);
			req.setAttribute("sucess", "updated sucessfully!");
			req.setAttribute("accid", a.getAcc_id());
			req.getRequestDispatcher("updateaccount.jsp").forward(req, resp);
		}
	}

}
