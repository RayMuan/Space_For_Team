<%@page import="java.util.ArrayList"%>

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
        <link href="css_main/styles.css" rel="stylesheet" />
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

 </div>
 </div>

            </header>
            
            
            <!--  버튼            -->
<div class="btn">
<button class="block"><a href="user.jsp">공간등록</a></button>
</div>
<div class="btn">
<button class="block"><a href="user.jsp">공간관리</a></button>
</div>
<div class="btn">
<button class="block"><a href="user.jsp">게스트 전환</a></button>
</div>
<%
String id=(String)session.getAttribute("id");
// 로그인페이지있으면 켜서 해보기
// if(id == null){
// 	response.sendRedirect("MainPro.sp");
// }

%>           
            <!-- Features section-->
                <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">나의 공간</h2>
                                <p class="lead fw-normal text-muted mb-5">안녕하세요<%=id %>호스트님! <br>등록한 공간을 보여드릴께요 </p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
<%
             ArrayList<SpaceDTO> spaceList = (ArrayList<SpaceDTO>)request.getAttribute("spaceList");
      
             int currentPage = (Integer)request.getAttribute("currentPage");
             int startPage = (Integer)request.getAttribute("startPage");
             int pageBlock = (Integer)request.getAttribute("pageBlock");
             int endPage = (Integer)request.getAttribute("endPage");
             int pageCount = (Integer)request.getAttribute("pageCount");
            
            	 %>         
            	  <%
             	for (int i = 0; i<spaceList.size(); i++){
             		SpaceDTO dto = spaceList.get(i);
             		%>
           <!-- 공간프리뷰 1 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2"></div>
           		                                                                                        <!-- 여기에 공간상세페이지 링크걸기! -->
           		 <div class="text-decoration-none link-dark stretched-link" style="cursor: pointer;" onclick="location.href='main.jsp';" ><h5 class="card-title mb-3"><%=dto.getS_name() %></h5></div>
            	 <p class="card-text mb-0"><%=dto.getS_memo() %></p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
                            <div class="small">
	<div class="fw-bold"></div>
		<button class="button1"><a href="host.jsp">수정</a></button>
		<button class="button2"><a href="host.jsp">삭제</a></button>
 		<a href="host.jsp" class="notification">
  			<span>리뷰 답글 달기</span>
  			<span class="badge">3</span>
		</a>
</div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>         
<%
   }
%>
 <div class="page">        
<%
if(id != null){
      if(startPage > pageBlock){
         %>
      <a href="HostPro.sp?pageNum=<%=startPage-pageBlock%>">이전</a>
         <%
      }
      for(int i=startPage;i<=endPage;i++){
         %>
         <a href="HostPro.sp?pageNum=<%=i%>"><%=i %></a> 
         <%
      }
    
      if(endPage < pageCount){
         %>
      <a href="HostPro.sp?pageNum=<%=startPage+pageBlock%>">다음</a>
         <%
      }
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
