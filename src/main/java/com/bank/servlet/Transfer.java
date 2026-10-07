package com.bank.servlet;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/transfer")
public class Transfer extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer accId = Integer.parseInt(req.getParameter("from_account"));
		Double amt = Double.parseDouble(req.getParameter("amount"));
		String mode = req.getParameter("mode");
		Long toAcc = Long.parseLong(req.getParameter("to_account"));
		Long confirm = Long.parseLong(req.getParameter("confirm_account"));
		
		AccountDAO adao = new AccountDAOImpl();
		Account a = adao.getAccountById(accId);
		Transcation t = new Transcation();
		TranscationDAO tdao = new TranscationDAOImpl();
		List<Account> li = adao.getAllAccounts();
//		Long count = li.stream().filter(a1->a1.getAcc_no().equals(toAcc)).count();
		Account toAccount = li.stream().filter(a1->a1.getAcc_no().equals(toAcc)).findFirst().orElse(null);
		
		if(toAcc.equals(confirm) && toAccount != null) {
			if(a != null && toAccount.getStatus().equalsIgnoreCase("active") && a.getStatus().equalsIgnoreCase("active") && a.getAcc_id() != toAccount.getAcc_id() && amt > 0 && (a.getBalance() >= amt)) {
				a.setBalance(a.getBalance() - amt);
				toAccount.setBalance(toAccount.getBalance() + amt);
				adao.updateAccount(a);
				adao.updateAccount(toAccount);
				
				t.setAmount(amt);
			    t.setFrom_acc_id(accId);
			    t.setStatus("success");
			    t.setTo_acc_id(toAccount.getAcc_id());
			    t.setMode_of_transcation(mode);
			    t.setTrans_type("transfer");
			    tdao.addTranscation(t);
			    req.setAttribute("transcation", t);
			    req.getRequestDispatcher("payment_sucess.jsp").forward(req, resp);
			}
			else {
				t.setAmount(amt);
				t.setFrom_acc_id(accId);
				t.setStatus("failed");
				t.setTo_acc_id(toAccount.getAcc_id());
				t.setMode_of_transcation(mode);
				t.setTrans_type("transfer");
				tdao.addTranscation(t);
				req.setAttribute("error", "Payment failed due to insufficient balance");
				req.getRequestDispatcher("transfer.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("error", "Invalid Acc no");
			req.getRequestDispatcher("transfer.jsp").forward(req, resp);
		}
	}

}
