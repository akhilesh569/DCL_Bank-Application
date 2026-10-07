package com.bank.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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

@WebServlet("/Transactionsfilt")
public class TranscationFilter extends HttpServlet {
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String accno = req.getParameter("account_no");
	String status = req.getParameter("status");
	TranscationDAO tdao = new TranscationDAOImpl();
	List<Transcation> allTrans = tdao.getAllTranscation();
    allTrans = allTrans.stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing((Transcation t)->t.getTranscation_time()).reversed()).toList();

    if(accno != null && !accno.isEmpty()) {
    	Long ac = Long.parseLong(accno.trim());
    	
    	AccountDAO adao = new AccountDAOImpl();
    	List<Account> li = adao.getAllAccounts();
    	Integer id = null;
    	for(Account a : li) {
    		if(a.getAcc_no().equals(ac)) {
    			id = a.getAcc_id();
    			break;
    		}
    	}
    	
    	if(id != null) {
    		allTrans = tdao.getTranscationByAccId(id);
    	}
    	else {
    		allTrans = new ArrayList<Transcation>();
    	}
    	
    }
    
    if(status != null && !status.trim().isEmpty()) {
        allTrans = allTrans.stream()
                .filter(t -> t.getStatus().equalsIgnoreCase(status))
                .collect(Collectors.toList());
    }
    
    req.setAttribute("result", allTrans);
    req.getRequestDispatcher("viewalltransactions.jsp").forward(req, resp);
    
}
}
