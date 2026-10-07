package com.bank.dto;

public class Transcation {

	private Integer trans_id;
	private String transcation_date;
	private String transcation_time;
	private Double amount;
	private String status;
	private String trans_type;
	private Integer from_acc_id;
	private Integer to_acc_id;
	private String mode_of_transcation;
	
	
	public Integer getTrans_id() {
		return trans_id;
	}
	public void setTrans_id(Integer trans_id) {
		this.trans_id = trans_id;
	}
	public String getTranscation_date() {
		return transcation_date;
	}
	public void setTranscation_date(String transcation_date) {
		this.transcation_date = transcation_date;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTrans_type() {
		return trans_type;
	}
	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}
	public Integer getFrom_acc_id() {
		return from_acc_id;
	}
	public void setFrom_acc_id(Integer from_acc_id) {
		this.from_acc_id = from_acc_id;
	}
	public Integer getTo_acc_id() {
		return to_acc_id;
	}
	public void setTo_acc_id(Integer to_acc_id) {
		this.to_acc_id = to_acc_id;
	}
	public String getTranscation_time() {
		return transcation_time;
	}
	public void setTranscation_time(String transcation_time) {
		this.transcation_time = transcation_time;
	}
	
	public String getMode_of_transcation() {
		return mode_of_transcation;
	}
	public void setMode_of_transcation(String mode_of_transcation) {
		this.mode_of_transcation = mode_of_transcation;
	}
	
	
	//for testing
	@Override
	public String toString() {
		return "Transcation [trans_id=" + trans_id + ", transcation_date=" + transcation_date + ", transcation_time="
				+ transcation_time + ", amount=" + amount + ", status=" + status + ", trans_type=" + trans_type
				+ ", from_acc_id=" + from_acc_id + ", to_acc_id=" + to_acc_id + "]";
	}
	
	
}
