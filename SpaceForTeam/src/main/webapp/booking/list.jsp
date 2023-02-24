
<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="com.space4team.booking.db.BookingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>

<% 
String id = (String)session.getAttribute("id");
UserDTO dto2= new UserDTO();

if(id != null){
// 	글쓴이 세션값이 일치하면 자기자신이 쓴 글(글수정, 글삭제 보이기)
		if(id.equals(dto2.getUser_id())){
%>
<table border ="1">
<tr><td>예약번호</td><td>사용날짜</td><td>사용인원</td><td>시작시간</td><td>종료시간</td><td>사용시간</td><td>합계가격</td></tr>
<%
ArrayList<BookingDTO> bookingList =(ArrayList<BookingDTO>) request.getAttribute("boardList");

for(int i=0 ; i<bookingList.size();i++){
// 	배열접근, 배열한칸에 내용 가져오기 => BoardDTO 저장 => 출력
BookingDTO dto=bookingList.get(i);
	%>
	
<!-- 	글제목을 눌렀을 때 글내용으로 하이퍼링크 -->
<tr><td><a href="BookingContent.bk?num=<%=dto.getBk_num() %>"></a></td>
	<td><%=dto.getBk_usedate() %></td>
	<td><%=dto.getBk_usercount() %></td>
	<td><%=dto.getBk_starttime() %>시</td>
	<td><%=dto.getBk_endtime() %>시</td>
	<td><%=dto.getBk_usetime() %>시간</td>
	<td><%=dto.getBk_price() %></td></tr>
	<%
	}
	}
}
%>
</table>


</body>
</html>