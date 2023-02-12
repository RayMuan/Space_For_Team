<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking / bookingInsertForm </title>
</head>
<body>
<h1> booking / bookingInsertForm</h1>

<!-- http://localhost:8080/Project_test/booking/bookingInsertForm.jsp -->

<fieldset>
 <label>사용할 날짜</label>
<input type="date" name="date" min="2023-02-09" max="9999-12-31" step="1" value="2023-02-09"><br>
<label></label>사용할 시간</label> 
<input type="time" name="time"><br>


<form action="MemberInsertPro.me" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
<input type="submit" value="희원가입" >
</form>
</fieldset>

  
</body>
</html>