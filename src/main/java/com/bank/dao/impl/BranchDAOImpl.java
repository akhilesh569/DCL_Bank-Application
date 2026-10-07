package com.bank.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bank.dao.BranchDAO;
import com.bank.dto.Branch;
import com.bank.utility.Connector;

public class BranchDAOImpl implements BranchDAO {
	
	private Connection con;
	
	public BranchDAOImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void addBranch(Branch b) {
		// TODO Auto-generated method stub
		String query = "insert into branch values(0,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, b.getBranch_name());
			ps.setString(2, b.getLocation());
			ps.setString(3, b.getCity());
			ps.setString(4, b.getState());
			ps.setString(5, b.getIfsc_code());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void updateBranch(Branch b) {
		// TODO Auto-generated method stub
		String query = "update branch set branch_name=?,location=?,city=?,state=?,ifsc_code=? where branch_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, b.getBranch_name());
			ps.setString(2, b.getLocation());
			ps.setString(3, b.getCity());
			ps.setString(4, b.getState());
			ps.setString(5, b.getIfsc_code());
			ps.setInt(6, b.getBranch_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void deleteBranchById(Integer id) {
		// TODO Auto-generated method stub
		String query = "delete from branch where branch_id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Branch getBranchById(Integer id) {
		// TODO Auto-generated method stub
		String query = "select * from branch where branch_id = ?";
		Branch b = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				b = new Branch();
				b.setBranch_id(rs.getInt("branch_id"));
				b.setBranch_name(rs.getString("branch_name"));
				b.setLocation(rs.getString("location"));
				b.setCity(rs.getString("city"));
				b.setState(rs.getString("state"));
				b.setIfsc_code(rs.getString("ifsc_code"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public List<Branch> getAllBranch() {
		String query = "select * from branch";
		List<Branch> li = new ArrayList<Branch>();
		Branch b = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new Branch();
				b.setBranch_id(rs.getInt("branch_id"));
				b.setBranch_name(rs.getString("branch_name"));
				b.setLocation(rs.getString("location"));
				b.setCity(rs.getString("city"));
				b.setState(rs.getString("state"));
				b.setIfsc_code(rs.getString("ifsc_code"));
				li.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

}
