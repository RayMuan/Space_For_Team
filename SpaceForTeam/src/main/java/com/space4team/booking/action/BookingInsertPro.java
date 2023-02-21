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
		
		BookingDAO dao = new BookingDAO();
		dao.insertBooking(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("index/index.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
}
