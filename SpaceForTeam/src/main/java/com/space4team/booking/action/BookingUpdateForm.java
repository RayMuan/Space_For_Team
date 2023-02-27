package com.space4team.booking.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;





public class BookingUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingUpdateForm execute()");
		
		int bk_num = Integer.parseInt(request.getParameter("num"));
		
		BookingDAO dao = new BookingDAO();
		BookingDTO dto = dao.getBooking(bk_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("bookingupdateform.jsp");
		forward.setRedirect(false);
		
		return forward;

	}

	
}
