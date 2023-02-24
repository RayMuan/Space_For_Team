package com.space4team.host.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;

public class HostInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String h_email = request.getParameter("h_email");
		String h_id = request.getParameter("h_id");
		String h_name = request.getParameter("h_name");
		String h_pass = request.getParameter("h_pass");
		String h_phone = request.getParameter("h_phone");
		String h_birth = request.getParameter("h_birth");
		
		HostDTO dto = new HostDTO();
		System.out.println("HostDTO 바구니주소 : "+ dto);
		
		dto.setH_email(h_email);
		dto.setH_id(h_id);
		dto.setH_name(h_name);
		dto.setH_pass(h_pass);
		dto.setH_phone(h_phone);
		dto.setH_birth(h_birth);
		
		HostDAO dao=new HostDAO();
		System.out.println("HostDAO주소 :"+dao);

		dao.insertHost(dto);

		ActionForward forward = new ActionForward();
		forward.setPath("Main.ho");
		forward.setRedirect(true);
	
		return forward;
	}

}

