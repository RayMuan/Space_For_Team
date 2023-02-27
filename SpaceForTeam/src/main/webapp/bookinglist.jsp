<%@page import="com.space4team.space.db.SpaceDAO"%>
<%@page import="com.space4team.user.db.UserDAO"%>
<%@page import="com.space4team.booking.db.BookingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content />
	<meta name="author" content />
	<title>Space for team</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />

	<!-- 추가 css -->

<style type="text/css">
body {
  font-family: Arial, sans-serif;
  font-size: 16px;
  color: #333;
}

table {
  border-collapse: collapse;
  width: 60%;
  margin: auto; /* 가운데 정렬 */
  border: 2px solid #ccc;
  margin-top: 300px;
}

th, td {
  padding: 8px;
  text-align: center;
  border: 1px solid #ccc;
}

a {
  color: #333;
  text-decoration: none;
}

.paging a {
  display: inline-block;
  margin-right: 10px;
  padding: 5px;
  border: 1px solid #ccc;
  color: #333;
  text-decoration: none;
}

.paging a.active {
  background-color: #ccc;
  color: #fff;
}


th {
  background-color: #f2f2f2;
}
</style>
</head>
<body>
	 <!-- Navigation-->
             <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">                
                    <a class="navbar-brand" href="index.html">SpaceForTeam</a> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="MainPro.sp">Home</a></li>                   
                            <li class="nav-item"><a class="nav-link" href="UserInsertForm.us">Join</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="UserLoginForm.us">Guest</a></li>
                                     <li><a class="dropdown-item" href="HostLoginForm.ho">Host</a></li>
                                </ul>
                            </li>   
                             <%
								String id=(String)session.getAttribute("id");
								if(id!=null){
									%>
									<li class="nav-item"><a class="nav-link" href="UserLogout.us">Logout</a></li>
										<li class="nav-item"><a class="nav-link" href="UserMypage.us">Mypage</a></li>
									<%
										}
									%>
                             <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Community</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="NoticeList.no">Notice</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
<main>
<% 
UserDAO udao = new UserDAO();
SpaceDAO sdao = new SpaceDAO();

ArrayList<BookingDTO> bookingList =(ArrayList<BookingDTO>) request.getAttribute("bookingList");
int currentPage = (Integer)request.getAttribute("currentPage");
int	startPage = (Integer)request.getAttribute("startPage");
int	pageBlock = (Integer)request.getAttribute("pageBlock");
int	endPage = (Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");

%>
<section class="py-5">
<div class="container px-5">
<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
<div class="text-center mb-5">
<h1 class="fw-bolder pb-2">예약 내역</h1>
<table class="row-cols-auto m-auto" border ="1">
<tr><td>예약번호</td><td>사용날짜</td><td>사용인원</td><td>시작시간</td><td>종료시간</td><td>사용시간</td><td>합계가격</td></tr>
<%
// 	글쓴이 세션값이 일치하면 자기자신이 쓴 글(글수정, 글삭제 보이기)
for(int i=0 ; i<bookingList.size();i++){
//	배열접근, 배열한칸에 내용 가져오기 => BoardDTO 저장 => 출력
	BookingDTO dto=bookingList.get(i);
	if(id!=null){
		if(id.equals(udao.getUserID(dto.getUser_num()))){
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
		}if(id.equals(sdao.getHostID(dto.getS_num()))){
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
</div>
<div class="text-center">
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
</div>
</div>
</div>
</section>
</main>
<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
	<div class="container px-5">
		<div class="row align-items-center justify-content-between flex-column flex-sm-row">
			<div class="col-auto"><div class="small m-0 text-white">spaceforteam</div></div>
			<div class="col-auto"></div>
	</div>
</div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>