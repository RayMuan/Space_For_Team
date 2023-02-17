package com.space4team.booking.db;

import java.sql.Timestamp;

public class BookingDTO {
	private int bk_num;
	private int s_num;
	private int user_num;
	private int bk_usercount;
	private Timestamp bk_date;
	private int bk_price;
	private int bk_usedate;
	private int bk_starttime;
	private int bk_endtime;
	
	// get set
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
	public int getBk_price() {
		return bk_price;
	}
	public void setBk_price(int bk_price) {
		this.bk_price = bk_price;
	}
	public int getBk_usedate() {
		return bk_usedate;
	}
	public void setBk_usedate(int bk_usedate) {
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
	
	

}
