<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking/insertForm.jsp</title>
</head>
<body>
<!--  http://localhost:8080/Model2/MemberInsertForm.me -->
<!--  http://localhost:8080/Model2/MemberInsertPro.me -->

<h1>booking/insertForm.jsp</h1>

<form action="BookingInsertPro.bk" method="post">
예약인원 : <input type="number" name="bk_usercount" min="1"><br>
예약일 : <input type="date" name="bk_usedate"  id="currentDate" ><br>
<script type="text/javascript">
document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
</script>
시작시간 : <input type="number" name="bk_starttime" min="0" max="24"><br>
종료시간 : <input type="number" name="bk_endtime" min="0" max="24"><br>
<input type="submit" value="확인">
</form>
</body>
</html>