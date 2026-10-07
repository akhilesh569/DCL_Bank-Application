package com.bank.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.bank.dao.AccountDAO;
import com.bank.dao.TranscationDAO;
import com.bank.dto.Account;
import com.bank.dto.Transcation;
import com.bank.utility.Connector;

public class TranscationDAOImpl implements TranscationDAO {
	
	private Connection con;
	
	public TranscationDAOImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void addTranscation(Transcation t) {
		// TODO Auto-generated method stub
      String query="insert into transcations values(0,sysdate(),?,?,?,?,?,sysdate(),?)";
	 try{ 	 
	  PreparedStatement ps=con.prepareStatement(query);
	  ps.setDouble(1, t.getAmount());
	  ps.setString(2, t.getStatus());
	  ps.setString(3, t.getTrans_type());
	  if(t.getFrom_acc_id() == null) {
		    ps.setNull(4, Types.INTEGER);
		}
		else {
		    ps.setInt(4, t.getFrom_acc_id());
		}
	  if(t.getTo_acc_id() == null) {
		    ps.setNull(5, Types.INTEGER);
		}
		else {
		    ps.setInt(5, t.getTo_acc_id());
		}
	  ps.setString(6, t.getMode_of_transcation());
	  ps.executeUpdate();
	} catch(SQLException e1){
		e1.printStackTrace();
	}
}
	@Override
	public void updateTranscation(Transcation t) {
		// TODO Auto-generated method stub
		String query="update transcations set transcation_date=?,amount=?,status=?,trans_type=?,from_acc_id=?,to_acc_id=?,transcation_time=?,mode_of_transcation=? where trans_id=?";
		try{
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, t.getTranscation_date());
        ps.setDouble(2, t.getAmount());
		ps.setString(3, t.getStatus());
		ps.setString(4, t.getTrans_type());
		ps.setInt(5, t.getFrom_acc_id());
		ps.setInt(6, t.getTo_acc_id());
		ps.setString(7, t.getTranscation_time());
		ps.setString(8, t.getMode_of_transcation());
		ps.setInt(9, t.getTrans_id());
		ps.executeUpdate();

	} catch(SQLException e){
		e.printStackTrace();
	}
	}

	@Override
	public void deleteTranscationById(Integer id) {
		// TODO Auto-generated method stub
		String query="delete from transcations where trans_id=?";
		try{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public Transcation getTranscationById(Integer id) {
		// TODO Auto-generated method stub
		String query="select * from transcations where trans_id=?";
		Transcation t=null;
		try{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				t=new Transcation();
				t.setTrans_id(rs.getInt("trans_id"));
				t.setTranscation_date(rs.getString("transcation_date"));
				t.setAmount(rs.getDouble("amount"));
				t.setStatus(rs.getString("status"));
				t.setTrans_type(rs.getString("trans_type"));
				t.setFrom_acc_id(rs.getInt("from_acc_id"));
				t.setTo_acc_id(rs.getInt("to_acc_id"));
				t.setTranscation_time(rs.getString("transcation_time"));
				t.setMode_of_transcation(rs.getString("mode_of_transcation"));

			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return t;
	}

	@Override
	public List<Transcation> getAllTranscation() {
		// TODO Auto-generated method stub
		List<Transcation> tl=new ArrayList<>();
		String query="select * from transcations";
		Transcation t=null;
		try{
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				t=new Transcation();
				t.setTrans_id(rs.getInt("trans_id"));
				t.setTranscation_date(rs.getString("transcation_date"));
				t.setAmount(rs.getDouble("amount"));
				t.setStatus(rs.getString("status"));
				t.setTrans_type(rs.getString("trans_type"));
				t.setFrom_acc_id(rs.getInt("from_acc_id"));
				t.setTo_acc_id(rs.getInt("to_acc_id"));
				t.setTranscation_time(rs.getString("transcation_time"));
				t.setMode_of_transcation(rs.getString("mode_of_transcation"));
				tl.add(t);

			}
		}catch(SQLException e){
			e.printStackTrace();
		

		}
		return tl;
	}

	@Override
	public List<Transcation> getTranscationByAccId(Integer id) {
		// TODO Auto-generated method stub
		List<Transcation> tl=new ArrayList<>();
		String query="select * from transcations where from_acc_id=? or to_acc_id=?";
		Transcation t=null;
		try{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setInt(2, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				t=new Transcation();
				t.setTrans_id(rs.getInt("trans_id"));
				t.setTranscation_date(rs.getString("transcation_date"));
				t.setAmount(rs.getDouble("amount"));
				t.setStatus(rs.getString("status"));
				t.setTrans_type(rs.getString("trans_type"));
				t.setFrom_acc_id(rs.getInt("from_acc_id"));
				t.setTo_acc_id(rs.getInt("to_acc_id"));
				t.setTranscation_time(rs.getString("transcation_time"));
				t.setMode_of_transcation(rs.getString("mode_of_transcation"));
				tl.add(t);
			}
		}catch(SQLException e){
			e.printStackTrace();
		
		}
		return tl;
	}

}
