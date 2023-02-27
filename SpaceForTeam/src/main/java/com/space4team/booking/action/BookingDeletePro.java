package com.space4team.booking.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.booking.db.BookingDAO;





public class BookingDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingDeletepro execute()");
		
		request.setCharacterEncoding("utf-8");
		int bk_num = Integer.parseInt(request.getParameter("num"));
		
		BookingDAO dao = new BookingDAO();
		dao.deleteBooking(bk_num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("BookingList.bk");
		forward.setRedirect(true);
		return forward;
	}

}
