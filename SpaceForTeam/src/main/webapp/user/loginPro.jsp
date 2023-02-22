
<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="com.space4team.user.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
String pass=request.getParameter("pass");


UserDAO dao=new UserDAO();
UserDTO dto=dao.userCheck("user_email", "user_pass");

if(dto!=null){
	//아이디 비밀번호 일치
	session.setAttribute("email", email);
	session.setAttribute("pass", pass);
	response.sendRedirect("../original/index.html");
}else{
	//아이디 비밀번호 틀림
    %>
    <script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
    </script>
    <%
}
%>