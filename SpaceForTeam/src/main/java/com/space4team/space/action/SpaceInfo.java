package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class SpaceInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceInfo execute()");
		int s_num=1;
//				Integer.parseInt(request.getParameter("s_num"));
		
		SpaceDAO dao=new SpaceDAO();
		SpaceDTO dto=dao.getSpace(s_num);
		
		
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("space/info.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
