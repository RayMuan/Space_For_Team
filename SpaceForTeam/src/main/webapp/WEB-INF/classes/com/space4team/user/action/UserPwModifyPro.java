package com.space4team.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class UserPwModifyPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserPwModifyPro execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		UserDTO modifyPassDto=new UserDTO();

		modifyPassDto.setUser_id(id);
		modifyPassDto.setUser_pass(pass);
		UserDAO dao=new UserDAO();

		UserDTO dto=dao.idCheck(id);
		
		ActionForward forward=null;
		if(dto!=null) {
			dao.modifyPass(modifyPassDto);
			
			forward=new ActionForward();
			forward.setPath("UserMypage.us");
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
