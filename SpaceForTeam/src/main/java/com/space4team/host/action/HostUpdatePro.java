package com.space4team.host.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class HostUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostUpdatePro execute()");
		
		
		request.setCharacterEncoding("utf-8");
		
		String h_email=request.getParameter("h_email");
		String h_id=request.getParameter("h_id");
		String h_pass=request.getParameter("h_pass");
		String h_name=request.getParameter("h_name");
		String h_phone=request.getParameter("h_phone");
		String h_birth=request.getParameter("h_birth");
		
		// 수정할 내용을 바구니 객체생성 => 바구니에 저장
		HostDTO updateDto=new HostDTO();
		updateDto.setH_email(h_email);
		updateDto.setH_id(h_id);
		updateDto.setH_pass(h_pass);
		updateDto.setH_name(h_name);
		updateDto.setH_phone(h_phone);
		updateDto.setH_birth(h_birth);
		
		
		 
		HostDAO dao=new HostDAO();
		// MemberDTO dto = userCheck(id,pass) 메서드 호출
		HostDTO dto=dao.hostCheck(0, h_pass);
		// 아이디 비밀번호 일치 dto!=null =>  dao.updateMember(updateDto) 메서드 호출
		//												  => MemberMain.me 이동
		// 아이디 비밀번호 틀림 dto==null => 아이디 비밀번호 틀림
		ActionForward forward=null;
		if(dto!=null) {
			dao.updateHost(updateDto);
			forward=new ActionForward();
			forward.setPath("spaceInfo.sp");
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
