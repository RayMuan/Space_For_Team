package com.space4team.qna.db;

import java.sql.Timestamp;

public class QnaDTO {
	private int q_num;
	private int user_num;
	private String q_subject;
	private String q_content;
	private Timestamp q_date;
	private String q_pass;
	private int h_num;
	private String q_resubject;
	private String q_recontent;
	private int q_yesno; 
	private Timestamp q_redate;
	
	//get set
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Timestamp getQ_date() {
		return q_date;
	}
	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}
	public String getQ_pass() {
		return q_pass;
	}
	public void setQ_pass(String q_pass) {
		this.q_pass = q_pass;
	}
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public String getQ_resubject() {
		return q_resubject;
	}
	public void setQ_resubject(String q_resubject) {
		this.q_resubject = q_resubject;
	}
	public String getQ_recontent() {
		return q_recontent;
	}
	public void setQ_recontent(String q_recontent) {
		this.q_recontent = q_recontent;
	}
	public int getQ_yesno() {
		return q_yesno;
	}
	public void setQ_yesno(int q_yesno) {
		this.q_yesno = q_yesno;
	}
	public Timestamp getQ_redate() {
		return q_redate;
	}
	public void setQ_redate(Timestamp q_redate) {
		this.q_redate = q_redate;
	}
}//class
