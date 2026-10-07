package com.bank.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bank.dao.UserDAO;
import com.bank.dto.User;
import com.bank.utility.Connector;

public class UserDAOImpl implements UserDAO {
	
	private Connection con;
	
	public UserDAOImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		String query = "insert into user values(0,?,?,?,?,?,sysdate())";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getUser_name());
			ps.setString(2, u.getEmail());
			ps.setLong(3, u.getPhone());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getRole());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void updateUser(User u) {
		// TODO Auto-generated method stub
		String query = "update user set user_name=?,email=?,phone=?,password=?,role=?,registered_at=? where user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getUser_name());
			ps.setString(2, u.getEmail());
			ps.setLong(3, u.getPhone());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getRole());
			ps.setString(6, u.getRegistered_date());
			ps.setInt(7, u.getUser_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		String query = "delete from user where user_id = ?";
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
	public User getUserByMailAndPassword(String mail, String password) {
		// TODO Auto-generated method stub
		String query = "select * from user where email = ? and password = ?";
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setUser_name(rs.getString("user_name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setRegistered_date(rs.getString("registered_at"));	
			}
//			else {
//				System.out.println("not exist");
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public User getUserByMail(String mail) {
		// TODO Auto-generated method stub
		String query = "select * from user where email = ?";
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, mail);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setUser_name(rs.getString("user_name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setRegistered_date(rs.getString("registered_at"));	
			}
//			else {
//				System.out.println("not exist");
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<User> getAllUser() {
		String query = "select * from user";
		List<User> li = new ArrayList<User>();
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setUser_name(rs.getString("user_name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setRegistered_date(rs.getString("registered_at"));
				li.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public User getUserById(Integer id) {
		String query = "select * from user where user_id = ?";
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setUser_name(rs.getString("user_name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setRegistered_date(rs.getString("registered_at"));	
			}
//			else {
//				System.out.println("not exist");
//			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

}
