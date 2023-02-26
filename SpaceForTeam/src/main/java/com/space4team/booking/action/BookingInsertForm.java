package com.space4team.booking.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class BookingInsertForm implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("bookingInsertForm execute 실행");
		
		int s_num = Integer.parseInt(request.getParameter("s_num"));
		System.out.println(s_num);
		
		SpaceDAO dao = new SpaceDAO();
		SpaceDTO dto = dao.getSpace(s_num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("bookinginsertform.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}