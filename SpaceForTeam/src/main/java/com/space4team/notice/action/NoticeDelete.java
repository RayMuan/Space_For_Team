package com.space4team.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.notice.db.NoticeDAO;

public class NoticeDelete implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDElete execute 실행");
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		
		NoticeDAO dao = new NoticeDAO();
		dao.deleteNotice(num);
		
		ActionForward forward = new ActionForward ();
		forward.setPath("NoticeList.no");
		forward.setRedirect(true);
		
		return forward;
	}
}