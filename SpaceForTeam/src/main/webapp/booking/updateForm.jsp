<%@page import="com.space4team.booking.db.BookingDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateForm.jsp</title>
</head>
<body>
<%
// num값 파라미터값으로 가져오기
// int num = Integer.parseInt(request.getParameter("num"));
// BoardDAO객체생성
// BoardDAO dao = new BoardDAO();
// // BoardDTO dto = dao.getBoard(num)매서드 호출
// BoardDTO dto = dao.getBoard(num);

BookingDTO dto = (BookingDTO)request.getAttribute("dto");
%>


<h1>글수정</h1>
<form action = "BookingUpdatePro.bk" method = "post">
<!-- num값을 가지고 가야 업데이트 작업이 가능 
지금처럼 hidden으로 가져가도 되고 밑에 표에 넣어서 가져가도 됨 -->
<input type ="hidden" name ="num" value="<%=dto.getBk_num() %>">
<table border = "1">
<tr><td>예약일자</td>
    <td><input type="date" name ="bk_usedate" value="<%=dto.getBk_usedate() %>"></td></tr>
<tr><td>사용인원수</td>
    <td><input type="number" name ="bk_usercount" value="<%=dto.getBk_usercount() %>"></td></tr>
<tr><td>시작시간</td>
    <td><input type="number" name ="bk_starttime" value="<%=dto.getBk_starttime() %>"></td></tr>
 <tr><td>종료시간</td>
    <td><input type="number" name ="bk_endtime" value="<%=dto.getBk_endtime() %>"></td></tr>
<tr><td colspan ="2"><input type="submit" value="예약수정"></td></tr>
</table>
</form>
</body>
</html>