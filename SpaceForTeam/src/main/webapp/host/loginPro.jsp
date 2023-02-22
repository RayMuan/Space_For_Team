
<%@page import="com.space4team.host.db.HostDTO"%>
<%@page import="com.space4team.host.db.HostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
String pass=request.getParameter("pass");


HostDAO dao=new HostDAO();
HostDTO dto=dao.hostCheck("host_email", "host_pass");

if(dto!=null){
	//아이디 비밀번호 일치
	session.setAttribute("email", email);
	session.setAttribute("password", pass);
	response.sendRedirect("../space/spaceInfo.sp");
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