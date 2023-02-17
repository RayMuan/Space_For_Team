<%@page import="com.itwillbs.host.db.hostInsertDAO"%>
<%@page import="com.itwillbs.host.db.hostInsertDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String h_email = request.getParameter("h_email");
String h_id = request.getParameter("h_id");
String h_name = request.getParameter("h_name");
String h_pass = request.getParameter("h_pass");
String h_phone = request.getParameter("h_phone");
String h_birth = request.getParameter("h_birth");


hostInsertDTO dto = new hostInsertDTO();

dto.setH_email(h_email);
dto.setH_id(h_id);
dto.setH_name(h_name);
dto.setH_pass(h_pass);
dto.setH_phone(h_phone);
dto.setH_birth(h_birth);

hostInsertDAO dao=new hostInsertDAO();

dao.insertMember(dto);


response.sendRedirect("loginForm.jsp");
%>