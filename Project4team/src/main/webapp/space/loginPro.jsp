<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro.jsp</title>
</head>
<body>
<h1>loginPro.jsp</h1>
<%
String email = request.getParameter("email");
String pass = request.getParameter("pass");
%>
폼에서 입력한 이메일 : <%=email%><br>
폼에서 입력한 비밀번호 : <%=pass %><br>
<%
String dbId="admin";
String dbPass="p123";
%>
데이터베이스에서 입력한 아이디 : <%=dbId %><br>
데이터베이스에서 입력한 비밀번호 : <%=dbPass %><br>
<%
// 문자열 비교  문자열.equals(문자열)
if(email.equals(dbId)  &&  pass.equals(dbPass)) {
	out.println("아이디 비밀번호 일치");
	session.setAttribute("email", email);
	
	response.sendRedirect("loginMain.jsp");
} else {
	out.println("아이디 비밀번호 불일치");
	%>
	<script type="text/javascript">
			alert("아이디 비밀번호 불일치");
			history.back();
	</script>
	<%
}
%>
</body>
</html>