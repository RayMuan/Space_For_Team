package com.space4team.host.action;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;


public class HostLoginPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostLoginPro execute()");
		
		// request 가져오기.
		String h_id=request.getParameter("h_id");
		String h_pass=request.getParameter("h_pass");
		
		// SpaceDAO 객체생성
		HostDAO dao=new HostDAO();
		// SpaceDTO = hostCheck() 메서드호출.
		HostDTO dto=dao.hostCheck(h_id, h_pass);
		
		// dto != null 아이디 비밀번호 일치 세션값 생성 MemberMain.me 이동
		// 아이디 비밀번호 틀림 , 뒤로이동	
		
		ActionForward forward=null;
		if(dto!=null) {
			//아이디 비밀번호 일치
			HttpSession session=request.getSession();
			session.setAttribute("id", h_id);
			
			forward=new ActionForward();
			forward.setPath("HostPro.sp");
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
