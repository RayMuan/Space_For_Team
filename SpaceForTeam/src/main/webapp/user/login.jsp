<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/login.jsp</title>
</head>
<body>
<article>
<h1>Login</h1>
<form action="UserLoginPro.us" id="join" method="post">
<fieldset>
<legend>Login Info</legend>
<label>User Email</label>
<input type="email" name="email"><br>
<label>Password</label>
<input type="password" name="pass"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
</body>
</html>