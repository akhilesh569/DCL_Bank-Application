package com.bank.servlet;

import java.io.IOException;
import java.util.List;

import com.bank.dao.BranchDAO;
import com.bank.dao.impl.BranchDAOImpl;
import com.bank.dto.Branch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addBranch")
public class AddBranch extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	BranchDAO bdao = new BranchDAOImpl();
	Branch b = new Branch();
	b.setBranch_name(req.getParameter("name"));
	b.setCity(req.getParameter("city"));
	b.setLocation(req.getParameter("location"));
	b.setState(req.getParameter("state"));
	
	List<Branch> li = bdao.getAllBranch();
	
	String ifsc = "";
	
	if(li.isEmpty()) {
		ifsc="DCLB0001001";
	}
	else {
		Branch last = li.get(li.size()-1);
		String lastIfsc = last.getIfsc_code();
		int num = Integer.parseInt(lastIfsc.substring(4));
		num++;
		ifsc="DCLB"+String.format("%07d", num);
	}
	
	b.setIfsc_code(ifsc);
	bdao.addBranch(b);
	resp.sendRedirect("branch.jsp");
			
  }
}
