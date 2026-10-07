package com.bank.dto;

public class Branch {

	private Integer branch_id;
	private String branch_name;
	private String location;
	private String city;
	private String state;
	private String ifsc_code;
	
	
	public Integer getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(Integer branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIfsc_code() {
		return ifsc_code;
	}
	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}
	
	//for testing
	@Override
	public String toString() {
		return "Branch [branch_id=" + branch_id + ", branch_name=" + branch_name + ", location=" + location + ", city="
				+ city + ", state=" + state + ", ifsc_code=" + ifsc_code + "]";
	}
	
	
	
	
}
