package com.space4team.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class Mypage implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Mypage execute 실행"); 
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("login한 id값: "+id);
		
		String idcheck = "";
		
		
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		
		HostDAO hdao = new HostDAO();
		HostDTO hdto = new HostDTO();
		
		System.out.println("hdtoget한 아이디"+hdto.getH_id());
		if(udto != null) {
			idcheck = "user";
			
		}else {
			hdto = hdao.getHostID(id);
			if (hdto.getH_id() .equals("admin")) {
				idcheck = "admin";
				
			}else {
				idcheck = "host";
			}	
		}
		System.out.println(idcheck);
		request.setAttribute("idcheck", idcheck);
		
		ActionForward forward=new ActionForward();
		forward.setPath("usermypage.jsp");
		forward.setRedirect(false);

		return forward;
	}
}
