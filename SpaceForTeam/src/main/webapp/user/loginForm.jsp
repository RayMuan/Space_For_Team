<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
<h1>user/loginForm.jsp</h1>
<form action="loginPro.jsp" method="post">
이메일 : <input type="email" name="email"><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="Login">
<input type="reset" value="Reset">
</form>
</body>
</html>