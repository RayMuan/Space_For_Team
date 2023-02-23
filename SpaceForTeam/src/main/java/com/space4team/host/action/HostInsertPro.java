package com.space4team.host.action;

<<<<<<< HEAD
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;


public class HostInsertPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("﻿HostInsertPro execute()");
		
		
		request.setCharacterEncoding("utf-8");
		
		String h_id=request.getParameter("h_id");
		String h_email=request.getParameter("h_email");
		String h_name=request.getParameter("h_name");
		String h_pass=request.getParameter("h_pass");
		String h_phone=request.getParameter("h_phone");
		String h_birth=request.getParameter("h_birth");
		
		
		//가입날짜 => 시스템 날짜 
		// java.sql.Timestamp 자바내장객체 => 날짜 
		Timestamp date=new Timestamp(System.currentTimeMillis());
		
		HostDTO dto=new HostDTO();
		System.out.println("MemberDTO 바구니 주소 : "+dto);
		// => 기억장소에 id, pass, name, date 값을 저장
		dto.setH_num(0);
		dto.setH_id(h_id);
		dto.setH_email(h_email);
		dto.setH_name(h_name);
		dto.setH_pass(h_pass);
		dto.setH_phone(h_phone);
		dto.setH_birth(h_birth);
		
		
		HostDAO dao=new HostDAO();
		System.out.println("HostDAO 주소 : "+dao);
		// dao.insertUser(id, pass, name, date);
//		dao.insertUser(dto);
		
		// MemberLoginForm.me 주소변경되면서 이동정보 저장
		ActionForward forward=new ActionForward();
		forward.setPath("HostLoginForm.ho");
		forward.setRedirect(true);
		
		return forward;
	}	
}
=======

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
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
