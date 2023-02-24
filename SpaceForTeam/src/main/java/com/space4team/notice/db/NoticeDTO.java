package com.space4team.notice.db;

import java.sql.Timestamp;

public class NoticeDTO {

	private int no_num;
	private String no_subject;
	private String no_content;
	private Timestamp no_date;
	
	public Timestamp getNo_date() {
		return no_date;
	}
	public void setNo_date(Timestamp no_date) {
		this.no_date = no_date;
	}
	public int getNo_num() {
		return no_num;
	}
	public void setNo_num(int no_num) {
		this.no_num = no_num;
	}
	public String getNo_subject() {
		return no_subject;
	}
	public void setNo_subject(String no_subject) {
		this.no_subject = no_subject;
	}
	public String getNo_content() {
		return no_content;
	}
	public void setNo_content(String no_content) {
		this.no_content = no_content;
	}
	
}
