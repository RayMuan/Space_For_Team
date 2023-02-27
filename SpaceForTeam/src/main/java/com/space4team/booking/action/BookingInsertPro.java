package com.space4team.booking.action;

import java.sql.Timestamp;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;



public class BookingInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingInsertPro execute()");
		
		request.setCharacterEncoding("utf-8");
		// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		
		//공간번호, 유저번호, 공간 시간당가격은 space -> insertform으로 갈 때 space(공간번호)에서 받고, session(유저번호// 아이디), 시간당 가격(공간번호에서request.getParameter)로 받아와주기 
		
		
		int s_num=Integer.parseInt(request.getParameter("s_num"));
		System.out.println(s_num);
		int user_num= Integer.parseInt(request.getParameter("user_num"));
		System.out.println(user_num);
		int bk_usercount = Integer.parseInt(request.getParameter("bk_usercount"));
		System.out.println(bk_usercount);
		Timestamp bk_date = new Timestamp(System.currentTimeMillis());
		System.out.println(bk_date);
//		int bk_price= 10000;
		String bk_usedate = request.getParameter("bk_usedate");
		System.out.println(bk_usedate);
		int bk_starttime = Integer.parseInt(request.getParameter("bk_starttime"));
		System.out.println(bk_starttime);
		int bk_endtime = Integer.parseInt(request.getParameter("bk_endtime"));
		System.out.println(bk_endtime);
		int bk_usetime = bk_endtime - bk_starttime;
		System.out.println(bk_usetime);
		int bk_price = Integer.parseInt(request.getParameter("s_bill")) * bk_usetime;
		System.out.println(bk_price);
		
		BookingDTO dto = new BookingDTO();
		System.out.println("dto주머니"+ dto);

		dto.setS_num(s_num);
		dto.setUser_num(user_num);
		dto.setBk_usercount(bk_usercount);
		dto.setBk_date(bk_date);
		dto.setBk_price(bk_price);
		dto.setBk_usedate(bk_usedate);
		dto.setBk_starttime(bk_starttime);
		dto.setBk_endtime(bk_endtime);
		dto.setBk_usetime(bk_usetime);
		
		BookingDAO dao = new BookingDAO();
		dao.insertBooking(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("UserMypage.us");
		forward.setRedirect(true);
		
		return forward;
	}

	
}
