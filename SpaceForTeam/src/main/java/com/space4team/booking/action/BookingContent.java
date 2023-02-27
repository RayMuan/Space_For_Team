package com.space4team.booking.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;
import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;



public class BookingContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingContent execute()");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); 
		System.out.println(id);
		int bk_num = Integer.parseInt(request.getParameter("num"));
		
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUserId(id);
		HostDAO hdao = new HostDAO();
		HostDTO hdto = hdao.getHostID(id);
		
		BookingDAO dao = new BookingDAO();
		BookingDTO dto = dao.getBooking(bk_num);
		
		String idcheck="";
		if(udto != null) {
			idcheck="user";
		}else {
			if(hdto.getH_id().equals("admin")) {
				idcheck ="admin";
			}else {
				idcheck="host";
			}
		}
		request.setAttribute("dto", dto);
		request.setAttribute("idcheck",idcheck);
		
		ActionForward forward = new ActionForward();
		
		if(idcheck.equals("user")) {
			forward.setPath("bookingcontent.jsp");
			forward.setRedirect(false);
		}else {
			forward.setPath("hostbookingcontent.jsp");
			forward.setRedirect(false);
		}
		
		
		
		return forward;
	}
}
