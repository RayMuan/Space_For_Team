package com.space4team.host.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;

public class HostUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostUpdatePro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");  
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		
		HostDTO updateDto=new HostDTO();
		updateDto.setH_id(id);
		updateDto.setH_pass(pass);
		updateDto.setH_name(name);
		updateDto.setH_email(email);
		updateDto.setH_phone(phone);
		updateDto.setH_birth(birth);
		
		HostDAO dao=new HostDAO();
		HostDTO dto=dao.userCheck(id, pass);

		ActionForward forward=null;
		if(dto!=null){
			dao.updateHost(updateDto); 
			// 	=> main.jsp 이동
			forward=new ActionForward();
			forward.setPath("HostMypage.ho");
			forward.setRedirect(true);
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();

			forward=null;
		}
		return forward;
	}

}
