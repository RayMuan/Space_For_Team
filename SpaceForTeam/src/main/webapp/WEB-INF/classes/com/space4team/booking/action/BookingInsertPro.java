package com.space4team.booking.action;

import java.sql.Timestamp;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;
import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;



public class BookingInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingInsertPro execute()");
		
		request.setCharacterEncoding("utf-8");
		// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		String id = request.getParameter("id");
		BookingDAO dao = new BookingDAO();
		
		//공간번호, 유저번호, 공간 시간당가격은 space -> insertform으로 갈 때 space(공간번호)에서 받고, session(유저번호// 아이디), 시간당 가격(공간번호에서request.getParameter)로 받아와주기 
		
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);

		Timestamp date = new Timestamp(System.currentTimeMillis());
		String bk_usedate = request.getParameter("bk_usedate");
		int bk_usercount = Integer.parseInt(request.getParameter("bk_usercount"));
		int bk_starttime = Integer.parseInt(request.getParameter("bk_starttime"));
		int bk_endtime = Integer.parseInt(request.getParameter("bk_endtime"));
		int bk_usetime = bk_endtime - bk_starttime;
     	int bk_price = bk_usetime * Integer.parseInt(request.getParameter("s_bill"));
		
		BookingDTO dto = new BookingDTO();
		System.out.println("dto주머니"+ dto);

		dto.setS_num(s_num);
		dto.setUser_num(udto.getUser_num());
		dto.setBk_usercount(bk_usercount);
		dto.setBk_date(date);
		dto.setBk_price(bk_price);
		dto.setBk_usedate(bk_usedate);
		dto.setBk_starttime(bk_starttime);
		dto.setBk_endtime(bk_endtime);
		dto.setBk_usetime(bk_usetime);
		dto.setBk_price(bk_price);
		
		dao.insertBooking(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("UserMypage.us");
		forward.setRedirect(true);
		
		return forward;
	}

	
}
