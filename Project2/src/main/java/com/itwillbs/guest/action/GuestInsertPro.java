package com.itwillbs.guest.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.guest.db.guestInsertDAO;
import com.itwillbs.guest.db.guestInsertDTO;

public class GuestInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		// request 파라미터 가져오기
		String user_email = request.getParameter("user_email");
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_pass = request.getParameter("user_pass");
		String user_phone = request.getParameter("user_phone");
		String user_birth = request.getParameter("user_birth");
		
		// MemberDTO 객체 생성
		guestInsertDTO dto = new guestInsertDTO();
		System.out.println("GuestInsertDTO 바구니주소 : "+ dto);
		
		// 멤버변수 파라미터 값 저장
		dto.setUser_email(user_email);
		dto.setUser_id(user_id);
		dto.setUser_name(user_name);
		dto.setUser_pass(user_pass);
		dto.setUser_phone(user_phone);
		dto.setUser_birth(user_birth);
		
		// MemberDAO 객체 생성
		guestInsertDAO dao=new guestInsertDAO();
		System.out.println("GuestInsertDAO주소 :"+dao);

		// insertMember() 메서드 호출
		dao.insertMember(dto);
		
		// 이동 MemberLoginForm.me
		ActionForward forward = new ActionForward();
		forward.setPath("Main.gu");
		forward.setRedirect(true);
		
	
		return forward;
	}

}
