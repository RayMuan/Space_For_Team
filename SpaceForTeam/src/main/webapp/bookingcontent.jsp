<%@page import="com.space4team.booking.db.BookingDTO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@page import="com.space4team.host.db.HostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">	
	<head>
       <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
         <title>SpaceForTeam - search your space !</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles3.css" rel="stylesheet" />
          <script src="script/jquery-3.6.3.js"></script>
      <script type="text/javascript" src="script/jquery-3.6.3.js">  </script>
      <script language="javascript">
    
    </script> 
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
                       <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">                
                    <a class="navbar-brand" href="index.html">SpaceForTeam</a> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="MainPro.sp">Home</a></li>                   
                            <li class="nav-item"><a class="nav-link" href="join.jsp">Join</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="userloginform.jsp">Guest</a></li>
                                     <li><a class="dropdown-item" href="hostLogin.jsp">Host</a></li>
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
            <!-- Page content-->
              <% 
    

      BookingDTO dto = (BookingDTO)request.getAttribute("dto");

      %>
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><p>&#x1F3E0</p></div>
                            <h1 class="fw-bolder">예약 상세내역</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">    
                           
                                <form action="SpaceUpdatePro.sp" name="form" method = "post" enctype="multipart/form-data">
                            		<input type="hidden" name="num" value="<%=dto.getS_num()%>">
                            		<input type="hidden" name="num" value="<%=dto.getS_num() %>">
                            		<div>
                                    	 <i class="bi bi-star-fill text-warning"></i>
                                        <label for="hostnumber">게스트<b> <%=id %>님,</b> 예약 상세내역입니다. 확인후 <code>결제</code>를 진행해주세요. </label><br>
                                    </div><br>
                            		 
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_num() %>"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약번호</label>
                                    </div>
									
									 <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getS_num() %>"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>공간번호</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_usercount() %>명"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약인원</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_date() %>"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약날짜</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_price() %>원"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>가격</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_usedate() %>"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>사용일</label>
                                    </div>
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_starttime() %>시"  readonly>
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>시작시간</label>
                                    </div>
                                    
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="siNm"  id="siNm" type="text" value="<%=dto.getBk_endtime() %>시"  readonly>
                                        <label for="sido"><i class="bi bi-star-fill text-warning"></i>종료시간</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="sggNm" id="sggNm" type="text" value="<%=dto.getBk_usetime() %>시간" readonly>
                                        <label for="gungu"><i class="bi bi-star-fill text-warning"></i>사용시간</label>
                                    </div>
                       					</div>
                                      
                                  
                                    </div>
                                  
                                    <br><br>
                                    <!-- Submit Button-->
                                    <div style="text-align:center">
                                    <input class="btn btn-primary btn-lg" type= "button" value="예약수정" 
									 onclick = "location.href='BookingUpdateForm.bk?num=<%=dto.getBk_num() %>'">
									<input class="btn btn-primary btn-lg" type= "button" value="예약삭제" 
									 onclick = "location.href='BookingDeletePro.bk?num=<%=dto.getBk_num() %>'">
									<input class="btn btn-primary btn-lg" type= "button" value="결제" 
									onclick = "location.href='payment.jsp?num=<%=dto.getBk_num() %>&totalPrice=<%=dto.getBk_price()%>'">
                                     <input class="btn btn-primary btn-lg" type= "button" value="뒤로가기" 
									 onclick = "location.href='BookingList.bk'">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
                   <div class="row gx-5 row-cols-2 row-cols-lg-4 py-5 justify-content-center">
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
<!--                           h5태그 찾아서 text-align : center했음 -->
                            <div class="h5">공지사항/자주하는질문</div>
                            <p class="text-muted mb-0"><a href="NoticeList.no">게시판 바로가기</a></p>
                        </div>
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-telephone"></i></div>
                            <div class="h5">Call us</div>
                            <p class="text-muted mb-0">상담가능시간</p>
                            <p class="text-muted mb-0">09:00 - 17:00</p>
                            <p class="text-muted mb-0">☎ 010-1234-5678</p>
                        </div>
                    </div>
            </section>
        </main>
        <!-- Footer-->
               <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">spaceforteam</div></div>
                    <div class="col-auto">     
                    </div>
                </div>
            </div>
        </footer>
 <script>
 
    </script> 
    </body>
</html> 