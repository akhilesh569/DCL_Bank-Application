package com.bank.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bank.dao.AccountDAO;
import com.bank.dto.Account;
import com.bank.utility.Connector;



public class AccountDAOImpl implements AccountDAO {
	
    private Connection con;
	
	public AccountDAOImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void addAccount(Account a) {
		String query = "insert into accounts values(0,?,?,?,?,default,default,sysdate())";
	
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, a.getUser_id());
			ps.setInt(2, a.getBranch_id());			
			ps.setLong(3, a.getAcc_no());
			ps.setString(4, a.getAcc_type());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	
		}
		
	}



	@Override
	public void updateAccount(Account a) {
		// TODO Auto-generated method stub
		String query = "update accounts set user_id = ? , branch_id= ? ,  acc_no= ? ,acc_type = ? , balance = ? , status = ? , created_at = ? where acc_id = ?";
	
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(8, a.getAcc_id());
			ps.setInt(1, a.getUser_id());
			ps.setInt(2, a.getBranch_id());
			ps.setLong(3, a.getAcc_no());
			ps.setString(4, a.getAcc_type());
			ps.setDouble(5, a.getBalance());
		    ps.setString(6,a.getStatus());
		    ps.setString(7,a.getCreated_at());
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

	@Override
	public void deleteAccountById(Integer id) {
		  String query = "delete from accounts where acc_id = ?";

		    try {
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setInt(1, id);
		    	ps.executeUpdate();
		    } 
		    catch (SQLException e) {
		        e.printStackTrace();
		    
		    }
		}

	


	@Override
	public Account getAccountById(Integer id) {
		String query = "select * from accounts where acc_id = ?";
		Account a = null;
		try {
			PreparedStatement ps  = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				a = new Account();
				a.setAcc_id(rs.getInt("acc_id"));
				a.setUser_id(rs.getInt("user_id"));
				a.setBranch_id(rs.getInt("branch_id"));
				a.setAcc_no(rs.getLong("acc_no"));
				a.setAcc_type(rs.getString("acc_type"));
				a.setBalance(rs.getDouble("balance"));
				a.setStatus(rs.getString("status"));
				a.setCreated_at(rs.getString("created_at"));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	
		}
		return a;
	}

	@Override
	public List<Account> getAllAccounts() {
		List<Account> li = new ArrayList<>();
		Account a = null;
		String query = "select * from accounts";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				a = new Account();
				a.setAcc_id(rs.getInt("acc_id"));
				a.setUser_id(rs.getInt("user_id"));
				a.setBranch_id(rs.getInt("branch_id"));
				a.setAcc_no(rs.getLong("acc_no"));
				a.setAcc_type(rs.getString("acc_type"));
				a.setBalance(rs.getDouble("balance"));
				a.setStatus(rs.getString("status"));
				a.setCreated_at(rs.getString("created_at"));
	
				li.add(a);
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return li;
	}
	
	@Override
	public List<Account> getAccountByType(String type) {
	    List<Account> li = new ArrayList<>();
		  String query = "SELECT * FROM accounts WHERE acc_type = ?";

		    try {
		        PreparedStatement ps = con.prepareStatement(query);
		         ps.setString(1,type);

		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {

		            Account a = new Account();

		            a.setAcc_id(rs.getInt("acc_id"));
		            a.setUser_id(rs.getInt("user_id"));
		            a.setBranch_id(rs.getInt("branch_id"));
		            a.setAcc_no(rs.getLong("acc_no"));
		            a.setAcc_type(rs.getString("acc_type"));
		            a.setBalance(rs.getDouble("balance"));
		            a.setStatus(rs.getString("status"));
		            a.setCreated_at(rs.getString("created_at"));

		            li.add(a);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return li;
		}
	

	@Override
	public List<Account> getAccountByStatus(String status) {
		  List<Account> li = new ArrayList<>();

		    String query = "select * from accounts where status = ?";

		    try {
		        PreparedStatement ps = con.prepareStatement(query);

		        ps.setString(1,status);

		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {

		            Account a = new Account();

		            a.setAcc_id(rs.getInt("acc_id"));
		            a.setUser_id(rs.getInt("user_id"));
		            a.setBranch_id(rs.getInt("branch_id"));
		            a.setAcc_no(rs.getLong("acc_no"));
		            a.setAcc_type(rs.getString("acc_type"));
		            a.setBalance(rs.getDouble("balance"));
		            a.setStatus(rs.getString("status"));
		            a.setCreated_at(rs.getString("created_at"));

		            li.add(a);
		        }

		    } 
		    catch (SQLException e) {
		    	// TODO Auto-generated catch block
		        e.printStackTrace();
		    }

		    return li;
		}


}
