package com.space4team.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;

public class HostUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostUpdateForm execute()");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); 
		
		HostDAO dao=new HostDAO();
		HostDTO dto=dao.gethost(id);
		
		request.setAttribute("dto", dto);

		ActionForward forward=new ActionForward();
		forward.setPath("hostupdate.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

