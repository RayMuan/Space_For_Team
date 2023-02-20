<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project/jdbcTest.jsp</title>
</head>
<body>
<%

//1단계 driver 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

//2단계 db연결
String dbUrl="jdbc:mysql://db.itwillbs.dev:3306/class1_221020_team4";
String dbUser="class1_221020_team4";
String dbPass="1234";
//con에 연결정보를 저장하는 작업
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
%>
연결성공 <%=con %>
</body>
</html>