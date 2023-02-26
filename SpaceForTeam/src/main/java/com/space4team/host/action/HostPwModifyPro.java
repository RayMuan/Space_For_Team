package com.space4team.host.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;

public class HostPwModifyPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("HostPwModifyPro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		HostDTO modifyPassDto=new HostDTO();

		modifyPassDto.setH_id(id);
		modifyPassDto.setH_pass(pass);
		HostDAO dao=new HostDAO();

		HostDTO dto=dao.idCheck(id);
		
		ActionForward forward=null;
		if(dto!=null) {
			dao.modifyPass(modifyPassDto);
			
			forward=new ActionForward();
			forward.setPath("HostMypage.ho");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('아이디 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return forward;
	}

}
