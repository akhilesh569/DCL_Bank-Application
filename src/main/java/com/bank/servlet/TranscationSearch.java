package com.bank.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.bank.dao.AccountDAO;
import com.bank.dao.TranscationDAO;
import com.bank.dao.impl.AccountDAOImpl;
import com.bank.dao.impl.TranscationDAOImpl;
import com.bank.dto.Account;
import com.bank.dto.Transcation;
import com.bank.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/searchTranscations")
public class TranscationSearch extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String tId = req.getParameter("transcation_id");
		String status = req.getParameter("status");
		
		HttpSession session = req.getSession();
		User u = (User)session.getAttribute("user");
		
		AccountDAO adao = new AccountDAOImpl();
		TranscationDAO tdao = new TranscationDAOImpl();
		
		List<Account> allAcc = adao.getAllAccounts();
		
		List<Account> userAcc = allAcc.stream().filter(a->a.getUser_id() == u.getUser_id() && a.getStatus().equalsIgnoreCase("active")).collect(Collectors.toList());
		List<Transcation> userTrans = new ArrayList<Transcation>();
		
		for(Account a : userAcc) {
			List<Transcation> li = tdao.getTranscationByAccId(a.getAcc_id());
			
			for(Transcation t : li) {
				boolean exists = false;
				for(Transcation t1 : userTrans) {
					if(t.getTrans_id() == t1.getTrans_id()) {
						exists = true;
					}
				}
				
				if(exists == false) {
					userTrans.add(t);
				}
			}
		}
		
		List<Transcation> res = userTrans;
		
		if(tId != null && !tId.trim().isEmpty()) {
			Integer id = Integer.parseInt(tId);
			res = res.stream().filter(t->t.getTrans_id() == id).collect(Collectors.toList());
		}
		if(status != null && !status.trim().isEmpty()) {
			res = res.stream().filter(t->t.getStatus().equalsIgnoreCase(status)).collect(Collectors.toList());
		}
	
		
		
		req.setAttribute("result", res);
		req.getRequestDispatcher("my_transcations.jsp").forward(req, resp);
		
		

		
	}

}
