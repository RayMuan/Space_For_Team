<%@page import="java.util.ArrayList"%>
<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="com.space4team.review.db.ReviewDTO"%>
<%@page import="com.space4team.review.db.ReviewDAO"%>
<%@page import="com.space4team.host.db.HostDTO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
    <%
    SpaceDTO sdto=(SpaceDTO)request.getAttribute("sdto");
    HostDTO hdto=(HostDTO)request.getAttribute("hdto");
    ReviewDTO redto=(ReviewDTO)request.getAttribute("redto");
    UserDTO udto=(UserDTO)request.getAttribute("udto");
	%>
        <title><%= sdto.getS_name() %></title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Space For Team</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.html">Blog Home</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">Blog Post</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.html">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.html">Portfolio Item</a></li>
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
                            <h1 class="fw-bolder">호스트 로그인</h1>
                            <p class="lead fw-normal text-muted mb-0">환영합니다! Space For Team 입니다. </p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- * * SB Forms Contact Form * *-->
                                <!-- * * * * * * * * * * * * * * *-->
                                <!-- This form is pre-integrated with SB Forms.-->
                                <!-- To make this form functional, sign up at-->
                                <!-- https://startbootstrap.com/solution/contact-forms-->
                                <!-- to get an API token!-->
                                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                                
                                <div class="text-center mb-3">
                                	<div class="login_btn">
                                <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com" class="naver" style="text-decoration:none">
                                		<div class="d-grid"><button class="btn btn-success btn-lg  active" id="submitButton" type="submit">네이버로 로그인</button></div></a>
                              		</div>
                                </div>
                                
                                <div class="text-center mb-3">
                               		<div class="login_btn">
                                <a href="https://www.daum.net/" class="kakao" style="text-decoration:none">
                                		<div class="d-grid"><button class="btn btn-warning btn-lg  active" id="submitButton" type="submit">카카오로 로그인</button></div></a>
									</div>
								</div>
								
                                <div id="naverIdLogin" style="display: none;">
								<a id="naverIdLogin_loginButton" href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com">
								<img src="/naverLogo.png" height="60"></a></div>
								
								<div id="kakaoIdLogin" style="display: none;">
								<a id="kakaoIdLogin_loginButton" href="https://www.daum.net/">
								<img src="/kakaoLogo.jpg" height="60"></a></div>
                                
                                
                       			 <p class="or">
                       			 <style>
                       			 p.or::before{
                       			 content:"------------------------------------";
                       			 }
                       			 p.or::after{
                       			 content:"-----------------------------------";
                       			 }
                       			 </style>
                                <span class="btn btn-light btn-block disabled"> 또는</span>
                                </p>    
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">Email address</label>
                                        <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                        <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                                    </div>
                                    
                                    <!-- Password input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="password" type="password" placeholder="비밀번호" data-sb-validations="required" />
                                        <label for="name">Password</label>
                                        <div class="invalid-feedback" data-sb-feedback="password:required">A password is required.</div>
                                    </div>
                                    
                                    <div class="memory_box">
                                    <p><input email="memory" type="checkbox">
                                    <label for="memory">
                                    이메일 기억하기
                                    </label></p>
                                    <a href="/auth/find/password" class="password">비밀번호 찾기</a>
                                    </div>
                                    
                                   <p class="no mem">
                                   Space For Team 회원이 아니신가요?-------------------------------
                                   <a href="/insertForm.html" class="post">회원가입</a>
                                   </p>
                                  
                                   <!-- Submit success message-->
                                    <!---->
                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">Form submission successful!</div>
                                            To activate this form, sign up at
                                            <br />
                                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!---->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                                    <!-- Submit Button-->
                                    <div class="d-grid"> <a href="https://www.daum.net/" class="login"></a>
                                    <button class="btn btn-primary btn-lg" id="login" type="submit">이메일로 로그인</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
