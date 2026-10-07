package com.bank.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.dao.AccountDAO;
import com.bank.dao.impl.AccountDAOImpl;
import com.bank.dto.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/requestAccount")
public class AccountRequest extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountDAO adao = new AccountDAOImpl();
		Account a = new Account();
		List<Account> li = adao.getAllAccounts();
		if(li.stream().filter(a1->a1.getUser_id() == Integer.parseInt(req.getParameter("user_id")) && a1.getAcc_type().equalsIgnoreCase(req.getParameter("acc_type"))).count() == 0) {
			a.setAcc_type(req.getParameter("acc_type"));
			a.setBranch_id(Integer.parseInt(req.getParameter("branch_id")));
			a.setUser_id(Integer.parseInt(req.getParameter("user_id")));
			
			long count = li.stream().filter(a2->a2.getBranch_id() == Integer.parseInt(req.getParameter("branch_id"))).count();
			long series = count+1;
		
			Integer branchCode = 100+Integer.parseInt(req.getParameter("branch_id"));
			Long accNo = Long.parseLong(branchCode+String.format("%09d", series));
			a.setAcc_no(accNo);
			adao.addAccount(a);

			req.setAttribute("sucess", "Account request submitted successfully");
			req.getRequestDispatcher("account_request.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("error", "you already have account of this type");
			req.getRequestDispatcher("account_request.jsp").forward(req, resp);
		}
		
	}

}
