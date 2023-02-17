package com.itwillbs.Booking.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.itwillbs.Booking.db.BookingDAO;
import com.itwillbs.Booking.db.BookingDTO;

public class BookingContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingContent execute()");
		int bk_num = Integer.parseInt(request.getParameter("bk_num"));
		
		BookingDAO dao = new BookingDAO();
		BookingDTO dto = dao.getBooking(bk_num);
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("booking/content.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
	}
