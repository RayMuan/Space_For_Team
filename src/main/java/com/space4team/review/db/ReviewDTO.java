package com.space4team.review.db;

import java.sql.Timestamp;

public class ReviewDTO {
	private int re_num;
	private int user_num;
	private String re_subject;
	private String re_content;
	private Timestamp re_date;
	private int re_point;
	private int s_num;
	private String re_reply;
	private double re_avg;
	private String re_max;
	
	public String getRe_max() {
		return re_max;
	}
	public void setRe_max(String re_max) {
		this.re_max = re_max;
	}
	//get set
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getRe_subject() {
		return re_subject;
	}
	public void setRe_subject(String re_subject) {
		this.re_subject = re_subject;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public int getRe_point() {
		return re_point;
	}
	public void setRe_point(int re_point) {
		this.re_point = re_point;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getRe_reply() {
		return re_reply;
	}
	public void setRe_reply(String re_reply) {
		this.re_reply = re_reply;
	}
	public double getRe_avg() {
		return re_avg;
	}
	public void setRe_avg(double re_avg) {
		this.re_avg = re_avg;
	}
	
}//class
