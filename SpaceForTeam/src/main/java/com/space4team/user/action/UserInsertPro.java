package com.space4team.user.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;


public class UserInsertPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("﻿UserInsertPro execute()");
		
		
		request.setCharacterEncoding("utf-8");
		
		String user_id=request.getParameter("user_id");
		String user_email=request.getParameter("user_email");
		String user_name=request.getParameter("user_name");
		String user_pass=request.getParameter("user_pass");
		String user_phone=request.getParameter("user_phone");
		String user_birth=request.getParameter("user_bith");
		
		//가입날짜 => 시스템 날짜 
		// java.sql.Timestamp 자바내장객체 => 날짜 
		Timestamp date=new Timestamp(System.currentTimeMillis());
		
		UserDTO dto=new UserDTO();
		System.out.println("UserDTO 바구니 주소 : "+dto);
		// => 기억장소에 id, pass, name, date 값을 저장
		dto.setUser_id(user_id);
		dto.setUser_email(user_email);
		dto.setUser_name(user_name);
		dto.setUser_pass(user_pass);
		dto.setUser_phone(user_phone);
		dto.setUser_birth(user_birth);
		
		
		UserDAO dao=new UserDAO();
		System.out.println("UserDAO 주소 : "+dao);
		// dao.insertUser(id, pass, name, date);
		dao.insertUser(dto);
		
		// MemberLoginForm.me 주소변경되면서 이동정보 저장
		ActionForward forward=new ActionForward();
		forward.setPath("UserLoginForm.us");
		forward.setRedirect(true);
		
		return forward;
	}	
}