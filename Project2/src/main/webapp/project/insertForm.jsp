<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project/insertForm.jsp</title>
 
 
</head>
<body>
<article>
<h1>회원가입</h1>
<form action="guestInsertPro.jsp" id="join" method="post">
<fieldset>
<legend>회원가입</legend>
<!-- <label>회원번호</label> -->
<!-- <input type="text" name="user_num"><br> -->
<label>이메일</label>
<input type="email" name="user_email"><br>
<label>아이디</label>
<input type="text" name="user_id">
<input type="button" value="id check" class="dup"><br>
<label></label>
<div class="divresult">아이디 중복체크 결과</div>
<label>닉네임</label>
<input type="text" name="user_name"><br>
<label>비밀번호</label>
<input type="password" name="user_pass"><br>
<label>비밀번호 확인</label>
<input type="password" name="user_pass1"><br>
<label>핸드폰 번호</label>
<input type="text" name="user_phone"><br>
<label>생년월일</label>
<input type="text" name="user_birth"><br>
</fieldset>
<input type="submit" value="회원가입">
<input type="reset" value="취소">
</form>
</article>
</body>
</html>