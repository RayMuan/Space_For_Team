package com.itwillbs.host.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.guest.db.guestInsertDAO;
import com.itwillbs.guest.db.guestInsertDTO;
import com.itwillbs.host.db.hostInsertDAO;
import com.itwillbs.host.db.hostInsertDTO;

public class HostInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		// request 파라미터 가져오기
		String h_email = request.getParameter("h_email");
		String h_id = request.getParameter("h_id");
		String h_name = request.getParameter("h_name");
		String h_pass = request.getParameter("h_pass");
		String h_tel = request.getParameter("h_tel");
		String h_birth = request.getParameter("h_birth");
		
		// MemberDTO 객체 생성
		hostInsertDTO dto = new hostInsertDTO();
		System.out.println("HostInsertDTO 바구니주소 : "+ dto);
		
		// 멤버변수 파라미터 값 저장
		dto.setH_email(h_email);
		dto.setH_id(h_id);
		dto.setH_name(h_name);
		dto.setH_pass(h_pass);
		dto.setH_tel(h_tel);
		dto.setH_birth(h_birth);
		
		// MemberDAO 객체 생성
		hostInsertDAO dao=new hostInsertDAO();
		System.out.println("HostInsertDAO주소 :"+dao);

		// insertMember() 메서드 호출
		dao.insertMember(dto);
		
		// 이동 MemberLoginForm.me
		ActionForward forward = new ActionForward();
		forward.setPath("Main.ho");
		forward.setRedirect(true);
		
	
		return forward;
	}

}
