package com.space4team.booking.action;

import java.sql.Timestamp;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import com.itwillbs.Booking.db.BookingDAO;
import com.itwillbs.Booking.db.BookingDTO;

public class BookingInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingInsertPro execute()");
		
		request.setCharacterEncoding("utf-8");
		// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		
		
		int s_num=1;
		int user_num=1;
		int bk_usercount = Integer.parseInt(request.getParameter("bk_usercount"));
		Timestamp bk_date = new Timestamp(System.currentTimeMillis());
		int bk_price= 10000;
		String bk_usedate = request.getParameter("bk_usedate");
		int bk_starttime = Integer.parseInt(request.getParameter("bk_starttime"));
		int bk_endtime = Integer.parseInt(request.getParameter("bk_endtime"));
		
		
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
=======
import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;



public class BookingInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingInsertPro execute()");
		
		request.setCharacterEncoding("utf-8");
		// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		
		//공간번호, 유저번호, 공간 시간당가격은 space -> insertform으로 갈 때 space(공간번호)에서 받고, session(유저번호// 아이디), 시간당 가격(공간번호에서request.getParameter)로 받아와주기 
		
		
		int s_num=1;
		int user_num=1;
		int bk_usercount = Integer.parseInt(request.getParameter("bk_usercount"));
		Timestamp bk_date = new Timestamp(System.currentTimeMillis());
		int bk_price= 10000;
		String bk_usedate = request.getParameter("bk_usedate");
		int bk_starttime = Integer.parseInt(request.getParameter("bk_starttime"));
		int bk_endtime = Integer.parseInt(request.getParameter("bk_endtime"));
		int bk_usetime = bk_endtime - bk_starttime;
//		int bk_price = Integer.parseInt(dto.getS_bill()) * bk_usetime;
		
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
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
		
		BookingDAO dao = new BookingDAO();
		dao.insertBooking(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("index/index.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
}
