package com.space4team.booking.db;

import java.sql.Timestamp;

public class BookingDTO {

	private int bk_num;
	private int s_num;
//	= dto.getS_num();
	private int user_num ;
//	= dto2.getUser_num();
	private int bk_usercount;
	private Timestamp bk_date;
	private String bk_usedate;
	private int bk_starttime;
	private int bk_endtime;
	private int bk_usetime;
	private int bk_price;
	private String payment;
	private int pay_num;
	
	public int getBk_num() {
		return bk_num;
	}
	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getBk_usercount() {
		return bk_usercount;
	}
	public void setBk_usercount(int bk_usercount) {
		this.bk_usercount = bk_usercount;
	}
	public Timestamp getBk_date() {
		return bk_date;
	}
	public void setBk_date(Timestamp bk_date) {
		this.bk_date = bk_date;
	}
	public String getBk_usedate() {
		return bk_usedate;
	}
	public void setBk_usedate(String bk_usedate) {
		this.bk_usedate = bk_usedate;
	}
	public int getBk_starttime() {
		return bk_starttime;
	}
	public void setBk_starttime(int bk_starttime) {
		this.bk_starttime = bk_starttime;
	}
	public int getBk_endtime() {
		return bk_endtime;
	}
	public void setBk_endtime(int bk_endtime) {
		this.bk_endtime = bk_endtime;
	}
	public int getBk_usetime() {
		return bk_usetime;
	}
	public void setBk_usetime(int bk_usetime) {
		this.bk_usetime = bk_usetime;
	}
	public int getBk_price() {
		return bk_price;
	}
	public void setBk_price(int bk_price) {
		this.bk_price = bk_price;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	

}
