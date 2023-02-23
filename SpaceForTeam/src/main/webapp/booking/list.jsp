
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
String id = (String)session.getAttribute("id");

<% 
ArrayList<BookingDTO> bookingList =(ArrayList<BookingDTO>) request.getAttribute("boardList");

	
	int currentPage = (Integer)request.getAttribute("currentPage");
	int	startPage = (Integer)request.getAttribute("startPage");
	int	pageBlock = (Integer)request.getAttribute("pageBlock");
	int	endPage = (Integer)request.getAttribute("endPage");
	int pageCount =(Integer)request.getAttribute("pageCount");


			

%>

<table border ="1">
<tr><td>예약번호</td><td>사용날짜</td><td>사용인원</td><td>시작시간</td><td>종료시간</td><td>사용시간</td><td>합계가격</td></tr>
<%

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
%>
</table>
<%
// // 한 화면에 보여줄 페이지 개수 설정
// int pageBlock = 10;
// // 시작하는 페이지번호 구하기
// // currentPage와      pageBlock을 startPage 통해 밑의 계산식을 완성
// // 	 1 ~ 10 -1 (0-9)      10        1      =>  0*10 + 1
// //  11 ~ 20 -1 (10-19)    10        11     =>  1*10 + 1
// //  21 ~ 30 -1 (20-29)    10        21     =>  2*10 + 1
// int startPage = (currentPage-1)/pageBlock * pageBlock + 1;  
// // 끝나는 페이지번호 구하기
// // startPage pageBlock => endPage
// //	   1        10    =>   1+10-1 
// //	  11		10    =>  11+10-1	
// //	  21		10    =>  21+10-1	
// int endPage = startPage + pageBlock - 1;
// // endPage = 10(1+10-1) 전체페이지(pageCount)는 2밖에 존재하지 않음
// // int pageCount = 2; (수동)
// // 전체페이지(pageCourt 구하기)
// // 전체글의 개수 count(13개) / 한페이지의 글 갯수 10개 = 1 + 0.3(나머지가 있는 경우 1p추가)
// // int count = 13; 
// int count = dao.getBoardCount();
// // 전체글의 갯수를 구할 때는 sql문으로 select count() from board
// // 리턴값은 int getBoardCount() 매서드 정의

// int pageCount = count/pageSize + (count%pageSize==0?0:1); // 삼항연산자
// if (endPage > pageCount){
// 	endPage = pageCount;
// }

// 이전 페이지(2~부터) 가기  (-1p)
if(currentPage>1){
	%>
<%-- <a href="BoardList.bo?pageNum=<%=currentPage -1 %>">[1페이지 이전]</a> --%>
	<% 
}

// 10페이지 이전 (블록단위)
if(startPage > pageBlock){
	%>
<a href="BoardList.bo?pageNum=<%=startPage - pageBlock %>">[10페이지 이전]</a>
	<% 
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="BoardList.bo?pageNum=<%=i %>"><%=i %></a>
	<%
}		
// 다음 페이지(전체페이지수보다 작을 때) 가기 (+1p)
if(currentPage < pageCount){
	%>
<%-- <a href="BoardList.bo?pageNum=<%=currentPage +1 %>">[1페이지 다음]</a> --%>
	<% 
}
// 10페이지 이후(블록단위)
if(endPage < pageCount){
	%>
<a href="BoardList.bo?pageNum=<%=startPage + pageBlock %>">[10페이지 다음]</a>
	<% 
}

%>

<!-- 화면 아래의 1,2,3을 수동으로 만든 것  -->
<!-- <a href = "list.jsp?pageNum=1">1</a>    -->
<!-- http://localhost:8080/webProject/board/list.jsp?pageNum=1 으로 이동-->
<!-- <a href = "list.jsp?pageNum=2">2</a>   -->
<!-- http://localhost:8080/webProject/board/list.jsp?pageNum=2 으로 이동-->
<!-- <a href = "list.jsp?pageNum=3">3</a>   -->
<!-- http://localhost:8080/webProject/board/list.jsp?pageNum=3 으로 이동-->

</body>
</html>