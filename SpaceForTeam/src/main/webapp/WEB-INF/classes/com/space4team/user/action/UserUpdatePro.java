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
		
		String id=request.getParameter("id");  
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		
		UserDTO updateDto=new UserDTO();
		updateDto.setUser_id(id);
		updateDto.setUser_pass(pass);
		updateDto.setUser_name(name);
		updateDto.setUser_email(email);
		updateDto.setUser_phone(phone);
		updateDto.setUser_birth(birth);
		
		UserDAO dao=new UserDAO();
		UserDTO dto=dao.userCheck(id, pass);

		ActionForward forward=null;
		if(dto!=null){
			dao.updateUser(updateDto);
			// 	=> main.jsp 이동
			forward=new ActionForward();
			forward.setPath("UserMypage.us");
			forward.setRedirect(true);
		}else{
		//데이터 없으면 false => 아이디 비밀번호 틀림
		//=> script   "아이디 비밀번호 틀림" 뒤로이동
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
