package com.space4team.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HostLogout implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostLogout execute()");
		
		// 세션 초기화
		HttpSession session=request.getSession();
		session.invalidate();
		
		// 이동 SpaceMain.me
		ActionForward forward = new ActionForward();
		forward.setPath("Main.ho");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
