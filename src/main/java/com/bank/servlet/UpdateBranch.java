package com.bank.servlet;

import java.io.IOException;

import com.bank.dao.BranchDAO;
import com.bank.dao.impl.BranchDAOImpl;
import com.bank.dto.Branch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateBranch")
public class UpdateBranch extends HttpServlet{
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    BranchDAO bdao = new BranchDAOImpl();
		Branch b = bdao.getBranchById(Integer.parseInt(req.getParameter("id")));
		if(b != null) {
			b.setBranch_name(req.getParameter("name"));
			b.setCity(req.getParameter("city"));
			b.setLocation(req.getParameter("location"));
			b.setState(req.getParameter("state"));
			bdao.updateBranch(b);
			req.setAttribute("sucess", "updated sucessfully!");
			req.setAttribute("branch_id", b.getBranch_id());
			req.getRequestDispatcher("branchedit.jsp").forward(req, resp);
		}
		
}
}
