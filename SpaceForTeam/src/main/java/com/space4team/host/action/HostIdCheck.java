package com.space4team.host.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;



public class HostIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostIdCheck execute()");
		
				String email=request.getParameter("email");
				HostDAO dao=new HostDAO();
				HostDTO dto=dao.getHost(1);
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
