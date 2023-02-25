package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.space.db.SpaceDAO;

public class SpaceInsertForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceInsertForm execute 실행");
		
		SpaceDAO dao = new SpaceDAO();

		System.out.println("구한 num값");
		System.out.println(dao.getSpaceNumber(0));
		int num = dao.getSpaceNumber(0);
		
		request.setAttribute("num", num);
		
		ActionForward forward = new ActionForward();
		forward.setPath("spaceinsertform.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}