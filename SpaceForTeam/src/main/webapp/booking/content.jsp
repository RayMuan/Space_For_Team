<%@page import="com.space4team.booking.db.BookingDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking/content.jsp</title>
</head>
<body>
<% 
String id = (String)session.getAttribute("id");

BookingDTO dto = (BookingDTO)request.getAttribute("dto");

%>
<h1>[로그인 : <%=id %>]</h1>
<table border="1">
<tr><td>예약번호</td><td><%=dto.getBk_num() %></td></tr>
<tr><td>유저번호</td><td><%=dto.getUser_num() %></td></tr>
<tr><td>공간번호</td><td><%=dto.getS_num() %></td></tr>
<tr><td>예약인원</td><td><%=dto.getBk_usercount() %></td></tr>
<tr><td>예약날짜</td><td><%=dto.getBk_date() %></td></tr>
<tr><td>가격</td><td><%=dto.getBk_price() %></td></tr>
<tr><td>사용일</td><td><%=dto.getBk_usedate() %></td></tr>
<tr><td>시작시간</td><td><%=dto.getBk_starttime() %></td></tr>
<tr><td>종료시간</td><td><%=dto.getBk_endtime() %></td></tr>
<tr><td colspan="2">
<!-- <input type= "button" value="글목록" onclick = "location.href = 'list.jsp'"> -->

<%
// 로그인 => 세션값 존재

if(id != null){
	//글쓴이 세션값이 일치하면 자기자신이 쓴 글(글수정, 글삭제 보이기)
	
	//여기가 
		if(id.equals(dto.getUser_num())){
%>

<input type= "button" value="예약수정" 
 onclick = "location.href='BookingUpdateForm.bk?num=<%=dto.getBk_num() %>'">
<input type= "button" value="예약삭제" 
 onclick = "location.href='BookingDeleteForm.bk?num=<%=dto.getBk_num() %>'">
<%
//예약삭제는 따로 form이 없고 클릭시 경고 뜨는 방향으로 해결
		}
}
%>

</table>
</body>
</html>