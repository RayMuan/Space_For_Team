<%@page import="com.space4team.notice.db.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
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
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                            <h1 class="fw-bolder">공지사항 작성하기</h1> 
                        </div>
                        
                        <% NoticeDTO dto=(NoticeDTO)request.getAttribute("dto");%>
  
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <form action = "NoticeUpdatePro.no" data-sb-form-api-token="API_TOKEN">
                                <input type="hidden" name="num" value="<%=dto.getNo_num()%>">    
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="subject" value="<%=dto.getNo_subject() %>" type="text" placeholder="Enter title..." required/>
                                        <label for="name">제목</label>
                                    </div>
                                    <!-- Message input-->
                                    <div class="form-floating mb-3">
                                        <textarea class="form-control" name="content" type="text" placeholder="Enter your message here..." style="height: 10rem" required"><%=dto.getNo_content().trim() %></textarea>
                                        <label for="message">내용</label>
                                    </div>

                                    <!-- Submit Button-->
                                    <div class="d-grid">
                                    <input class="btn btn-primary btn-lg" href="#scroll-target" type="submit" value="등록하기">
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>