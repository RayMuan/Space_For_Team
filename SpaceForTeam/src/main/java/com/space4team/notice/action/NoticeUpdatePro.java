package com.space4team.notice.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.space4team.notice.db.NoticeDAO;
import com.space4team.notice.db.NoticeDTO;

public class NoticeUpdatePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeUpdatePro execute() 실행");
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNo_num(num);
		dto.setNo_subject(subject);
		dto.setNo_content(content);
		dto.setNo_date(date);
		
		NoticeDAO dao = new NoticeDAO();
		dao.updateNotice(dto);
		System.out.println("여기까지 ㅇㅋ");
		System.out.println(dto.getNo_content());
		System.out.println(dto.getNo_subject());
		
		ActionForward forward = new ActionForward();
		forward.setPath("NoticeList.no");
		forward.setRedirect(true);
		
		return forward;
	}

}
