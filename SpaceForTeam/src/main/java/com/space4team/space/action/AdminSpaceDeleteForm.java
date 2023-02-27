package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class AdminSpaceDeleteForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("spacedeleteForm execute()실행");
		
		int num = Integer.parseInt(request.getParameter("s_num"));
		System.out.println(num);
		
		SpaceDAO dao = new SpaceDAO();
		SpaceDTO dto = dao.getSpace(num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("adminspacedelete.jsp");
		forward.setRedirect(false);
		return forward;
	}

}