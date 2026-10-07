package com.bank.servlet;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import com.bank.dao.AccountDAO;
import com.bank.dao.TranscationDAO;
import com.bank.dao.impl.AccountDAOImpl;
import com.bank.dao.impl.TranscationDAOImpl;
import com.bank.dto.Transcation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/filterPassbook")
public class FilterPassbook extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		String type = req.getParameter("type");
		Integer id = Integer.parseInt(req.getParameter("accId"));
		
		AccountDAO adao = new AccountDAOImpl();
		TranscationDAO tdao = new TranscationDAOImpl();
		
		List<Transcation> userTrans = tdao.getTranscationByAccId(id);
		userTrans = userTrans.stream().sorted(Comparator.comparing((Transcation t)->t.getTranscation_date()).thenComparing((Transcation t)->t.getTranscation_time())).collect(Collectors.toList());
		
		if(start != null && !start.trim().isEmpty()) {
			userTrans = userTrans.stream().filter(t->t.getTranscation_date().compareTo(start) >= 0).collect(Collectors.toList());
		}
		if(end != null && !end.trim().isEmpty()) {
			userTrans = userTrans.stream().filter(t->t.getTranscation_date().compareTo(end) <= 0).collect(Collectors.toList());
		}
		if(type != null && !type.trim().isEmpty()) {
			userTrans = userTrans.stream().filter(t->t.getTrans_type().equalsIgnoreCase(type)).collect(Collectors.toList());
		}
		
		req.setAttribute("filter", userTrans);
		req.setAttribute("account", adao.getAccountById(id));
		req.getRequestDispatcher("passbook.jsp").forward(req, resp);
		
	}

}
