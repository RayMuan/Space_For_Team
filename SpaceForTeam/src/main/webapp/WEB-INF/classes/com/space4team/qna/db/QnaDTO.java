package com.space4team.qna.db;

import java.sql.Timestamp;

public class QnaDTO {
	private int q_num;
	private int user_num;
	private String q_content;
	private Timestamp q_date;
	private int h_num;
	private String q_recontent;
	private Timestamp q_redate;
	private String q_user_id;
	private String q_host_name;
	private int q_s_num;
	
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
	public int getH_num() {
		return h_num;
	}
	public void setH_num(int h_num) {
		this.h_num = h_num;
	}
	public String getQ_recontent() {
		return q_recontent;
	}
	public void setQ_recontent(String q_recontent) {
		this.q_recontent = q_recontent;
	}
	public Timestamp getQ_redate() {
		return q_redate;
	}
	public void setQ_redate(Timestamp q_redate) {
		this.q_redate = q_redate;
	}
	public String getQ_user_id() {
		return q_user_id;
	}
	public void setQ_user_id(String q_user_id) {
		this.q_user_id = q_user_id;
	}
	public String getQ_host_name() {
		return q_host_name;
	}
	public void setQ_host_name(String q_host_name) {
		this.q_host_name = q_host_name;
	}
	public int getQ_s_num() {
		return q_s_num;
	}
	public void setQ_s_num(int q_s_num) {
		this.q_s_num = q_s_num;
	}
}//class
