package com.space4team.payment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;

public class PaymentPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PaymentPro execute()");
		
		
		
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		
		int bk_num = Integer.parseInt(request.getParameter("num"));
		System.out.println(bk_num);
		
		BookingDAO dao = new BookingDAO(); // db연결
		
		dao.updateBooking(bk_num); //
		
		BookingDTO dto = dao.getBooking(bk_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward= new ActionForward();
		
		forward.setPath("payment/paymentdone.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
