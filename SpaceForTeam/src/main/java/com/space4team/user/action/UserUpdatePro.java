package com.space4team.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class UserUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserUpdatePro execute()");
		
		
		request.setCharacterEncoding("utf-8");
		
		String user_email=request.getParameter("user_email");
		String user_id=request.getParameter("user_id");
		String user_pass=request.getParameter("user_pass");
		String user_name=request.getParameter("user_name");
		String user_phone=request.getParameter("user_phone");
		String user_birth=request.getParameter("user_birth");
		
		// 수정할 내용을 바구니 객체생성 => 바구니에 저장
		UserDTO updateDto=new UserDTO();
		updateDto.setUser_email(user_email);
		updateDto.setUser_id(user_id);
		updateDto.setUser_pass(user_pass);
		updateDto.setUser_name(user_name);
		updateDto.setUser_phone(user_phone);
		updateDto.setUser_birth(user_birth);
		
		
		 
		UserDAO dao=new UserDAO();
		// MemberDTO dto = userCheck(id,pass) 메서드 호출
		UserDTO dto=dao.userCheck(0, user_pass);
		// 아이디 비밀번호 일치 dto!=null =>  dao.updateMember(updateDto) 메서드 호출
		//												  => MemberMain.me 이동
		// 아이디 비밀번호 틀림 dto==null => 아이디 비밀번호 틀림
		ActionForward forward=null;
		if(dto!=null) {
			dao.updateUser(updateDto);
			forward=new ActionForward();
			forward.setPath("../original/index.html");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}
	
}
