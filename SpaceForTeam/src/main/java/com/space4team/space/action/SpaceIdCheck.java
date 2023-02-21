package com.space4team.space.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;


public class SpaceIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceIdCheck execute()");
		
				String email=request.getParameter("email");
				UserDAO dao=new UserDAO();
				UserDTO dto=dao.getUser(1);
				String result="";
				
				if(dto!=null) {
					result="아이디 중복";
				}else {
					result="아이디 사용가능";
				}
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println(result);
				out.close();
				return null;
	}

}
