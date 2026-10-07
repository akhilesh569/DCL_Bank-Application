package com.bank.dto;

public class Account {
    
	   private Integer acc_id;
	   private Integer user_id;
	   private Integer branch_id;
	   private Long acc_no;
	   private String acc_type;
	   private Double balance;
	   private String status;
	   private String created_at;
	   
	   
	   public Integer getAcc_id() {
		return acc_id;
	   }
	   public void setAcc_id(Integer acc_id) {
		this.acc_id = acc_id;
	   }
	   public Integer getUser_id() {
		return user_id;
	   }
	   public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	   }
	   public Integer getBranch_id() {
		return branch_id;
	   }
	   public void setBranch_id(Integer branch_id) {
		this.branch_id = branch_id;
	   }
	   public Long getAcc_no() {
		return acc_no;
	   }
	   public void setAcc_no(Long acc_no) {
		this.acc_no = acc_no;
	   }
	   public String getAcc_type() {
		return acc_type;
	   }
	   public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	   }
	   public Double getBalance() {
		return balance;
	   }
	   public void setBalance(Double balance) {
		this.balance = balance;
	   }
	   public String getStatus() {
		return status;
	   }
	   public void setStatus(String status) {
		this.status = status;
	   }
	   public String getCreated_at() {
		return created_at;
	   }
	   public void setCreated_at(String created_at) {
		this.created_at = created_at;
	   }
	   
	   
	   //for testing 
	   @Override
	   public String toString() {
		return "Account [acc_id=" + acc_id + ", user_id=" + user_id + ", branch_id=" + branch_id + ", acc_no=" + acc_no
				+ ", acc_type=" + acc_type + ", balance=" + balance + ", status=" + status + ", created_at=" + created_at
				+ "]";
	   }
	   
}
