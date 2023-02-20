package com.space4team.space.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;


public class SpaceLoginPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceLoginPro execute()");
		
		// request 가져오기
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		// SpaceDAO 객체생성
		UserDAO dao=new UserDAO();
		// SpaceDTO = userCheck() 메서드호출
		UserDTO dto=dao.userCheck(email, pass);
		
		// dto != null 아이디 비밀번호 일치 세션값 생성 MemberMain.me 이동
		// 아이디 비밀번호 틀림 , 뒤로이동	
		
		ActionForward forward=null;
		if(dto!=null) {
			//아이디 비밀번호 일치
			HttpSession session=request.getSession();
			session.setAttribute("email", email);
			
			forward=new ActionForward();
			forward.setPath("SpaceInfo.sp");
			forward.setRedirect(true);
			
		} else {
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
