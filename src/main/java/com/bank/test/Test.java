package com.bank.test;

import java.util.List;

import com.bank.dao.AccountDAO;
import com.bank.dao.BranchDAO;
import com.bank.dao.TranscationDAO;
import com.bank.dao.UserDAO;
import com.bank.dao.impl.AccountDAOImpl;
import com.bank.dao.impl.BranchDAOImpl;
import com.bank.dao.impl.TranscationDAOImpl;
import com.bank.dao.impl.UserDAOImpl;
import com.bank.dto.Account;
import com.bank.dto.Branch;
import com.bank.dto.Transcation;
import com.bank.dto.User;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		UserDAO udao = new UserDAOImpl();
//		User u = new User();
//		u.setUser_name("vishnu");
//		u.setEmail("vishnu@gmail.com");
//		u.setPhone(1194523390l);
//		u.setPassword("vishu@123");
//		udao.addUser(u);
		
//		User u = udao.getUserByMail("gourish@gmail.com");
//		User u = udao.getUserByMailAndPassword("shivu@gmail.com", "shivu123");
//		System.out.println(u);
//		if(u != null) {
//			u.setPassword("shivu123");
//			u.setEmail("shivu12@gmail.com");
//			udao.updateUser(u);
//		}
		
//		List<User> li = udao.getAllUser();
//		for(User u : li) {
//			System.out.println(u);
//		}
		
//		udao.deleteUserById(3);
		
//		======================================================================
		
//		BranchDAO bdao = new BranchDAOImpl();
//		Branch b = new Branch();
//		b.setBranch_name("Udupi Branch");
//		b.setLocation("Court Road");
//		b.setCity("Udupi");
//		b.setState("Karnataka");
//		b.setIfsc_code("DCLB0UDP01");
//		bdao.addBranch(b);
		
//		Branch b = bdao.getBranchById(3);
//		if(b != null) {
//			b.setCity("Surathkal");
//			b.setIfsc_code("DCLB0MNG02");
//			bdao.updateBranch(b);
//		}
		
//		List<Branch> li = bdao.getAllBranch();
//		for(Branch b : li) {
//			System.out.println(b);
//		}
		
//		bdao.deleteBranchById(4);
		
		//==================================================================
		
//		AccountDAO adao = new AccountDAOImpl();
//		Account a = new Account();
//		
//		a.setUser_id(7);
//		a.setBranch_id(3);
//		a.setAcc_type("current");
//		a.setBalance(40000.0);
//		adao.addAccount(a);
//		
//		Account a = adao.getAccountById(1);
//		if( a!= null) {
//			a.setAcc_type("current");
//			adao.updateAccount(a);
//		}
//	
		
//		List<Account> li = adao.getAccountByType("savings");
//		for(Account a : li) {
//			System.out.println(a);
//		}
		
//		adao.deleteAccountById(2);
		
		//===================================================================================
		
//		
//		TranscationDAO tdao = new TranscationDAOImpl();
//		Transcation t = new Transcation();
//		
//		t.setAmount(1000.0);
//		t.setTrans_type("transfer");
//		t.setFrom_acc_id(3);
//		t.setTo_acc_id(1);
//		t.setStatus("failed");
//		tdao.addTranscation(t);
		
//		Transcation t = tdao.getTranscationById(2);
//		System.out.println(t);
//		if(t != null) {
//			t.setTrans_type("Net Banking");
//			tdao.updateTranscation(t);
//		}
		
//		List<Transcation> li = tdao.getTranscationByAccId(3);
//		for(Transcation t : li) {
//			System.out.println(t);
//		}
		
		
//		tdao.deleteTranscationById(1);
		
		
		
		

	}
	
	

}
