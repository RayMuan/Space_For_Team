package com.space4team.user.db;

public class UserDTO {
	private int user_num;
	private String Suser_email;
	private String user_id;
	private String user_name;
	private String user_pass;
	private String user_phone;
	private String user_birth;
	private String user_pass1;
	
	// get set
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getSuser_email() {
		return Suser_email;
	}
	public void setSuser_email(String suser_email) {
		Suser_email = suser_email;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_pass1() {
		return user_pass1;
	}
	public void setUser_pass1(String user_pass1) {
		this.user_pass1 = user_pass1;
	}
}//class
