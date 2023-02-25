package com.space4team.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;


public class UserIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.err.println("UserIdCheck execute()");
		String id= request.getParameter("id");
		UserDAO dao= new UserDAO();
		UserDTO dto = dao.getUserId(id);
		String result="";
		if(dto != null){
			result="아이디 중복";
		}else{
			result = "아이디 사용 가능";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();
	
		return null;
	}

}
