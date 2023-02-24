package com.space4team.notice.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.notice.db.NoticeDAO;
import com.space4team.notice.db.NoticeDTO;

public class NoticeUpdateForm implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdateForm execute()실행");
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
	
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.getNotice(num);
		
		request.setAttribute("dto", dto);
	
		ActionForward forward = new ActionForward();
		forward.setPath("community/noticeUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}