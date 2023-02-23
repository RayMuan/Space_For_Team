package com.space4team.booking.action;

import javax.servlet.http.HttpServletResponse;

//<<<<<<< HEAD

import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;
=======
import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;


//>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git

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
