package com.bank.dto;

public class User {

	private Integer user_id;
	private String user_name;
	private String email;
	private Long phone;
	private String password;
	private String role;
	private String registered_date;
	
	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(String registered_date) {
		this.registered_date = registered_date;
	}
	
	
	//for testing
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", email=" + email + ", phone=" + phone
				+ ", role=" + role + ", registered_date=" + registered_date + "]";
	}
	
	
}
