package com.space4team.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class UserUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberUpdateForm execute()");
		// 세션 객체생성
		// String id = 세션값 가져오기
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		// MemberDAO 객체생성
		UserDAO dao = new UserDAO();
		// MemberDTO dto = getMember() 메서드 호출
		UserDTO dto = dao.getUser(0);
		
		// request dto 저장
		// member/update.jsp 이동
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("user/update.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
	
}
