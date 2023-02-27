<%@page import="com.space4team.space.db.SpaceDAO"%>
<%@page import="com.space4team.user.db.UserDAO"%>
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
UserDAO dao = new UserDAO();
SpaceDAO dao2 = new SpaceDAO();

ArrayList<BookingDTO> bookingList =(ArrayList<BookingDTO>) request.getAttribute("bookingList");
int currentPage = (Integer)request.getAttribute("currentPage");
int	startPage = (Integer)request.getAttribute("startPage");
int	pageBlock = (Integer)request.getAttribute("pageBlock");
int	endPage = (Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");

%>
<table border ="1">
<tr><td>예약번호</td><td>사용날짜</td><td>사용인원</td><td>시작시간</td><td>종료시간</td><td>사용시간</td><td>합계가격</td></tr>
<%


// 	글쓴이 세션값이 일치하면 자기자신이 쓴 글(글수정, 글삭제 보이기)

			for(int i=0 ; i<bookingList.size();i++){
//			 	배열접근, 배열한칸에 내용 가져오기 => BoardDTO 저장 => 출력
			BookingDTO dto=bookingList.get(i);
			if(id!=null){
				if(id.equals(dao.getUserID(dto.getUser_num()))){
	%>
	
<!-- 	글제목을 눌렀을 때 글내용으로 하이퍼링크 -->
<tr><td><a href="BookingContent.bk?num=<%=dto.getBk_num() %>"><%=dto.getBk_num() %></a></td>     
	<td><%=dto.getBk_usedate() %></td>
	<td><%=dto.getBk_usercount() %></td>
	<td><%=dto.getBk_starttime() %>시</td>
	<td><%=dto.getBk_endtime() %>시</td>
	<td><%=dto.getBk_usetime() %>시간</td>
	<td><%=dto.getBk_price() %></td></tr>
	<%
			}if(id.equals("admin")){
				%>
				
				<!-- 	글제목을 눌렀을 때 글내용으로 하이퍼링크 -->
<tr><td><a href="BookingContent.bk?num=<%=dto.getBk_num() %>"><%=dto.getBk_num() %></a></td>     
	<td><%=dto.getBk_usedate() %></td>
	<td><%=dto.getBk_usercount() %></td>
	<td><%=dto.getBk_starttime() %>시</td>
	<td><%=dto.getBk_endtime() %>시</td>
	<td><%=dto.getBk_usetime() %>시간</td>
	<td><%=dto.getBk_price() %></td></tr>
					<%
			}if(id.equals(dao2.getHostID(dto.getS_num()))){
								%>
								
								<!-- 	글제목을 눌렀을 때 글내용으로 하이퍼링크 -->
<tr><td><a href="BookingContent.bk?num=<%=dto.getBk_num() %>"><%=dto.getBk_num() %></a></td>     
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
<%
if(currentPage>1){
	%>
<a href="BookingList.bk?pageNum=<%=currentPage -1 %>">[1페이지 이전]</a>
	<% 
}

// 10페이지 이전 (블록단위)
if(startPage > pageBlock){
	%>
<a href="BookingList.bk?pageNum=<%=startPage - pageBlock %>">[10페이지 이전]</a>
	<% 
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="BookingList.bk?pageNum=<%=i %>"><%=i %></a>
	<%
}		
// 다음 페이지(전체페이지수보다 작을 때) 가기 (+1p)
if(currentPage < pageCount){
	%>
<a href="BookingList.bk?pageNum=<%=currentPage +1 %>">[1페이지 다음]</a>
	<% 
}
// 10페이지 이후(블록단위)
if(endPage < pageCount){
	%>
<a href="BookingList.bk?pageNum=<%=startPage + pageBlock %>">[10페이지 다음]</a>
	<% 
}
%>

</body>
</html>