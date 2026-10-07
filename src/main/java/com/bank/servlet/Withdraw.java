package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.AccountDAO;
import com.bank.dao.TranscationDAO;
import com.bank.dao.impl.AccountDAOImpl;
import com.bank.dao.impl.TranscationDAOImpl;
import com.bank.dto.Account;
import com.bank.dto.Transcation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/withdraw")
public class Withdraw extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("account_id"));
		Double amt = Double.parseDouble(req.getParameter("amount"));
		String mode = req.getParameter("mode");
		AccountDAO adao = new AccountDAOImpl();
		Account a = adao.getAccountById(id);
		Transcation t = new Transcation();
		TranscationDAO tdao = new TranscationDAOImpl();
		
		if(a != null && a.getStatus().equalsIgnoreCase("active") && amt > 0 && (a.getBalance() >= amt)) {
		  a.setBalance(a.getBalance() - amt);
		  adao.updateAccount(a);
		  
		  t.setAmount(amt);
		  t.setFrom_acc_id(id);
		  t.setStatus("success");
		  t.setTo_acc_id(null);
		  t.setMode_of_transcation(mode);
		  t.setTrans_type("withdrawl");
		  tdao.addTranscation(t);
		  req.setAttribute("transcation", t);
		  req.getRequestDispatcher("payment_sucess.jsp").forward(req, resp);
		}
		else {
		  t.setAmount(amt);
		  t.setFrom_acc_id(id);
		  t.setStatus("failed");
		  t.setTo_acc_id(null);
		  t.setMode_of_transcation(mode);
		  t.setTrans_type("withdrawl");
		  tdao.addTranscation(t);
		  req.setAttribute("error", "Withdraw failed due to insufficient balance");
		  req.getRequestDispatcher("withdraw.jsp").forward(req, resp);
		}
		
		
		
		
	}

}
