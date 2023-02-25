package com.space4team.notice.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.notice.db.NoticeDAO;
import com.space4team.notice.db.NoticeDTO;

public class NoticeWritePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeWritePro execute() 실행");
		
		request.setCharacterEncoding("utf-8");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNo_subject(subject);
		dto.setNo_content(content);
		dto.setNo_date(date);
		
		NoticeDAO dao = new NoticeDAO();
		dao.insertNotice(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("NoticeList.no");
		forward.setRedirect(true);
		
		return forward;
	}

}
