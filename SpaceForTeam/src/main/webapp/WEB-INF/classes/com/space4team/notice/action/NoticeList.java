package com.space4team.notice.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.notice.db.NoticeDAO;
import com.space4team.notice.db.NoticeDTO;

public class NoticeList implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeList execute() 실행");
		
		NoticeDAO dao = new NoticeDAO();

		String id = "";
		HttpSession session = request.getSession();
		id = (String)session.getAttribute("id");
		System.out.println(id);

		
//		String pageNum = request.getParameter("pageNum"); // pageNum값 받ㅇㅏ옴
//		int currentPage = Integer.parseInt(pageNum);
//		int pageSize = 3; 
//		int startRow = (currentPage-1) * pageSize + 1 ;
//		int endRow = startRow + pageSize-1;
		
		ArrayList<NoticeDTO> noticeList = dao.getNoticeList();
		
		request.setAttribute("noticeList", noticeList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("noticemain.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
