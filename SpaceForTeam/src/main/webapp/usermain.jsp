<%@page import="java.util.ArrayList"%>
<%@page import="com.space4team.space.db.SpaceDAO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SpaceForTeam - search your space !</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles1.css?after" rel="stylesheet" />
        <!-- 		아이콘 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

<body class="d-flex flex-column h-100">
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
//                             	String id = "";
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
            <!-- Header-->
      <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
               <h1 class="display-4 fw-bolder">Space For Team</h1>
  
		<%
             ArrayList<SpaceDTO> spaceList = (ArrayList<SpaceDTO>)request.getAttribute("spaceList");
      
             int currentPage = (Integer)request.getAttribute("currentPage");
             int startPage = (Integer)request.getAttribute("startPage");
             int pageBlock = (Integer)request.getAttribute("pageBlock");
             int endPage = (Integer)request.getAttribute("endPage");
             int pageCount = (Integer)request.getAttribute("pageCount");
            
             String search=(String)request.getAttribute("search");

            	 %>                 
<!-- 검색창 -->
<form action="UserPro.sp" method="post">
    <div class="searchmain">
       <input type="text" name="search" class="form-control" placeholder="공간명으로 찾아보세요" style="text-align:left; width:550px; height:35px;" >
    </div>

<div class="ser-main" >
       <button type="submit" value="search" class="form-control" style="text-align:left; width:40px; height:35px;"><i class="fa-solid fa-magnifying-glass"></i></button>  
	</div> 
</form>


            </header>
            <!-- Features section-->
                <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">공간 둘러보기</h2>
                                <p class="lead fw-normal text-muted mb-5">space for team에서 볼 수 있는 공간을 준비했어요</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
            
	<%
	for (int i = 0; i<spaceList.size(); i++){
		SpaceDTO dto = spaceList.get(i);
	%>            		
<!-- 공간프리뷰 1	 -->
<div class="col-lg-4 mb-5">
  
    <div class="card h-100 shadow border-0" style="cursor: pointer;" onclick="location.href='SpaceInfoPro.sp?s_num=<%=dto.getS_num()%>'">
        <img class="card-img-top" src=<%=dto.getS_file() %> alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2"><%=dto.getS_num() %></div>
           
           		 <div class="text-decoration-none link-dark stretched-link" style="cursor: pointer;" ><h5 class="card-title mb-3"><%=dto.getS_name() %></h5></div>
            	 <p class="card-text mb-0"><%=dto.getS_memo() %></p>
        	</div>
        	
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">                    
				<div class="d-flex align-items-center" style="font-weight: bold; font-size: 15px;">
					<%=dto.getS_bill() %> 원  
					
				</div>
                             <div class="small">
                                   
                                   <div class="text-muted">
      <div class="fw-bold">
      <i class="fa-solid fa-map-location-dot"> <%=dto.getS_sido() %></i> |
      <i class="fa-solid fa-user fa-sm"> 최대 <%=dto.getS_max() %></i> |     
      <i class="fa-solid fa-comment fa-sm">개</i>
     							 </div>
                             </div> 
                           </div>
                       </div>
<%--          <input type="button" name="detail" value="상세페이지" onclick="location.href='SpaceInfoPro.sp?num<%=dto.getS_num()%>'"> --%>
         
<%--          <%if(id!=null){ --%>
<%-- 				%> --%>
<%-- 	 <input type="button" name="write" value="예약하기" onclick="location.href='BookingInsertForm.bk?s_num=<%=dto.getS_num()%>'">  --%>
<%-- 				<% --%>

<%-- 				%> --%>

                   		
                   </div>
               </div>
           </div>
	<%
	}
	%> 		
 <div class="page">        
<%
if(search == null){
   //    검색어 없을때,, 
      //5페이지 이전
      if(startPage > pageBlock){
         %>
      <a href="UserPro.sp?pageNum=<%=startPage-pageBlock%>">이전</a>
         <%
      }
      for(int i=startPage;i<=endPage;i++){
         %>
         <a href="UserPro.sp?pageNum=<%=i%>"><%=i %></a> 
         <%
      }
      //5페이지 다음
      if(endPage < pageCount){
         %>
      <a href="UserPro.sp?pageNum=<%=startPage+pageBlock%>">다음</a>
         <%
      }
      }else {
   //    검색어 있을때,,
      //5페이지 이전
      if(startPage > pageBlock){
         %>
      <a href="UserPro.sp?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">이전</a>
         <%
      }
      for(int i=startPage;i<=endPage;i++){
         %>
         <a href="UserPro.sp?pageNum=<%=i%>&search=<%=search%>"><%=i %></a> 
         <%
      }
      //5페이지 다음
      if(endPage < pageCount){
         %>
      <a href="UserPro.sp?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">다음</a>
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
    </body>
</html>
