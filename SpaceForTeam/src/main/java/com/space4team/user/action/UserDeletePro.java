package com.space4team.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class UserDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				String id=request.getParameter("id"); 
				String pass=request.getParameter("pass");
				UserDAO dao=new UserDAO();
				UserDTO dto=dao.userCheck(id, pass);
				ActionForward forward=null;
				
				if(dto!=null) {
					dao.deleteUser(id);
					System.out.println("끝!");
					forward=new ActionForward();
					forward.setPath("UserLoginForm.us");
					forward.setRedirect(true);
				}else{
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
