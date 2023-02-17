<%@page import="com.space4team.space.db.HostDTO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <!-- 		아이콘 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Space for team</a>
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
            <!-- Header-->
      <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
               <h1 class="display-4 fw-bolder">Space for team</h1>


            </header>
<!--  버튼            -->
<div class="btn">
						<!-- 마이페이지 -->
<button class="block"><a href="jsp/good.jsp">마이페이지</a></button>
</div>
<div class="btn">
				<!-- 마이페이지-예약내역 페이지 -->
<button class="block"><a href="jsp/good.jsp">예약내역</a></button>
</div>
<div class="btn">
				<!-- 호스트 회원가입 또는 로그인 창 -->
<button class="block"><a href="jsp/good.jsp">호스트 되기</a></button>
</div>
            
            
            <!-- Features section-->
                <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">새로 들어온 공간 둘러보기</h2>
                                <p class="lead fw-normal text-muted mb-5">오직 space for team에서만 볼 수 있는 공간을 준비했어요</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
<%
SpaceDTO sdto = (SpaceDTO)request.getAttribute("sdto");
HostDTO hdto =  (HostDTO)request.getAttribute("hdto") ;                            		

%>
<!-- 공간프리뷰 1 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="jsp/good.jsp"><h5 class="card-title mb-3"><%=sdto.getS_name() %></h5></a>
            	 <p class="card-text mb-0"><%=sdto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold"><%=hdto.getH_name() %></div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
<!-- 공간프리뷰 2 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="jsp/good.jsp"><h5 class="card-title mb-3"><%=sdto.getS_name() %></h5></a>
            	 <p class="card-text mb-0"><%=sdto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold"><%=hdto.getH_name() %></div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- 공간프리뷰 3 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="jsp/good.jsp"><h5 class="card-title mb-3"><%=sdto.getS_name() %></h5></a>
            	 <p class="card-text mb-0"><%=sdto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold"><%=hdto.getH_name() %></div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
    
            </section>
            
            <!-- Features section-->
                <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">이런 공간은 어때요?</h2>
                                <p class="lead fw-normal text-muted mb-5">오직 space for team에서만 볼 수 있는 공간을 준비했어요</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">

<!-- 공간프리뷰 1 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="jsp/good.jsp"><h5 class="card-title mb-3"><%=sdto.getS_name() %></h5></a>
            	 <p class="card-text mb-0"><%=sdto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold"><%=hdto.getH_name() %></div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
<!-- 공간프리뷰 2 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="jsp/good.jsp"><h5 class="card-title mb-3"><%=sdto.getS_name() %></h5></a>
            	 <p class="card-text mb-0"><%=sdto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold"><%=hdto.getH_name() %></div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- 공간프리뷰 3 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="jsp/good.jsp"><h5 class="card-title mb-3"><%=sdto.getS_name() %></h5></a>
            	 <p class="card-text mb-0"><%=sdto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold"><%=hdto.getH_name() %></div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
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
