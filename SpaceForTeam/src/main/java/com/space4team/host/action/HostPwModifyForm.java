package com.space4team.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;

public class HostPwModifyForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		HostDAO dao=new HostDAO();
		HostDTO dto=dao.getHost(id);
		
		request.setAttribute("dto", dto);
				
		ActionForward forward=new ActionForward();
		forward.setPath("hostpwmodify.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
