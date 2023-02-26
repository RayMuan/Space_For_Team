<%@page import="java.util.jar.Attributes.Name"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" >
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Small Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles6.css" rel="stylesheet" />
        
    <style>
.b {
  font-size: 3rem;
  font-weight: bold;
  text-shadow: 2px 2px 2px #b6b6b6;
}
    h1.b:after {
        content: "";
        display: block;
        width: 1200px;
        border-bottom: 1px solid #bcbcbc;
        margin: 20px 0px;
}
    h1.b{
      	font-weight: bolder;
}

	div.fw-bolder{
		margin: 10px;
}

.btn.btn-primary {
  font-weight: bold;
  margin-right: 10px;
}

	.col-lg-5 {
    flex: 0 0 auto;
    width: 98%;
}
/* 	.btn-sm, .btn-group-sm > .btn { */
/* 		margin-left: 130px; */
/* 	} */
	h6, .h6 {
    font-size: 1.3rem;
}
    </style>
        
    </head>
    <body>
<%
// session.setAttribute("id", 모든 참조형값); => 업캐스팅(자동형변환)
// 자식 = 업캐스팅된 부모(다운캐스팅 명시적으로 형변환)
String id=(String)session.getAttribute("id");

%>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">                
                    <a class="navbar-brand" href="index.html">SpaceForTeam</a> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="MainPro.sp">Home</a></li>                   
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="userloginform.jsp">Guest</a></li>
                                     <li><a class="dropdown-item" href="hostLogin.jsp">Host</a></li>
                                </ul>
                            </li>

									<li class="nav-item"><a class="nav-link" href="UserLogout.us">Logout</a></li>
									<li class="nav-item"><a class="nav-link" href="UserMypage.us">Mypage</a></li>

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
        <!-- Page Content-->
 
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
            
                <div class="col-lg-5">
                
                        <h1 class="b">Guest Mypage</h1>
                    </br>
                    </br>
                    
                    <div class="h6 fw-bolder"> ♡<%=id %>님♡ </div>
                    </br>
                    <div style="text-align:right;">
                    <a class="btn btn-primary" href="UserUpdateForm.us">회원정보수정</a>
                    <a class="btn btn-primary" href="UserPwModifyForm.us">비밀번호변경</a>
                    <a class="btn btn-primary" href="UserDeleteForm.us">회원 탈퇴</a>
                    </div>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">Space For Team</p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title" >예약내역</h2>
                            <p class="card-text">예약내역이 없습니다.</p>
                        </div>
                        <div style="text-align:center">
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="BookingList.bk">바로가기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">리뷰 내역</h2>
                            <p class="card-text">작성한 리뷰가 없습니다.</p>
                        </div>
                        <div style="text-align:center">
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">바로가기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">1:1 문의내역</h2>
                            <p class="card-text">문의내역이 없습니다.</p>
                        </div>
                        <div style="text-align:center">
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">바로가기</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
