<%@page import="insert.InsertDAO"%>
<%@page import="insert.InsertDTO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String user_email = request.getParameter("user_email");
String user_id = request.getParameter("user_id");
String user_name = request.getParameter("user_name");
String user_pass = request.getParameter("user_pass");
String user_pass1 = request.getParameter("user_pass1");
String user_phone = request.getParameter("user_phone");
String user_birth = request.getParameter("user_birth");


InsertDTO dto = new InsertDTO();

dto.setUser_email(user_email);
dto.setUser_id(user_id);
dto.setUser_name(user_name);
dto.setUser_pass(user_pass);
dto.setUser_pass1(user_pass1);
dto.setUser_phone(user_phone);
dto.setUser_birth(user_birth);

InsertDAO dao=new InsertDAO();

dao.insertMember(dto);


response.sendRedirect("loginForm.jsp");
%>