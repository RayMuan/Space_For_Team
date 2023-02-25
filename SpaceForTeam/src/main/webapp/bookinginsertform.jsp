
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@page import="com.mysql.cj.Session"%>
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
                            <h1 class="fw-bolder">공간예약등록</h1>
                            
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                           

 <script type="text/javascript">

 function fun(){
	if(document.fr.uc.value==""){
		document.getElementById("d").innerHTML="<h5>예약인원을 설정해주세요</h5>";
	document.fr.uc.focus();
	return;
	}
	if(document.fr.date.value==""){
		document.getElementById("d").innerHTML="<h5>예약일을 선택해주세요</h5>";
	document.fr.date.focus();
	return;
	}
	if(document.fr.st.value==""){
		document.getElementById("d").innerHTML="<h5>시작시간을 선택해주세요</h5>";
	document.fr.st.focus();
	return;
	}
	if(document.fr.et.value==""){
		document.getElementById("d").innerHTML="<h5>종료시간을 선택해주세요</h5>";
	document.fr.et.focus();
	return;
	}
	if(parseInt(document.getElementById("st").value) > parseInt(document.getElementById("et").value)){
		document.getElementById("d").innerHTML="<h5>종료시간은 시작시간 앞일 수 없습니다</h5>";
	document.fr.et.focus();
	return;
	}
	
	document.fr.submit();
 }
 
 
 </script>
 <%

SpaceDTO dto = (SpaceDTO)request.getAttribute("dto");
 %>
                <form action="BookingInsertPro.bk" method="post" id="bookingForm" name="fr">
    
    				<div class="form-floating mb-3">
                            <input id="s_num" name="s_num" type="hidden" value="<%=dto.getS_num()%>">  
                                               
                    </div>
    				<div class="form-floating mb-3">
                            <input class="form-control" id="s_bill" name="s_bill" type="hidden" data-sb-validations="required" />                      
                    </div>
                    
                    <div class="form-floating mb-3">
                            <input class="form-control" id="id" name="id" type="hidden" data-sb-validations="required" />                      
                    </div>
                    <div>
                   <i class="bi bi-star-fill text-warning"></i>
                   <label for="hostnumber">게스트 <b> <%=id %>님,</b> 예약정보를 입력해주세요</label><br>
                   </div><br>
                    
                    <div>
                    <i class="bi bi-star-fill text-warning"></i>
                    <label for="phone">공간번호 : <b><%=dto.getS_num() %></b></label>
                    </div><br>
					
					<div>
                   <i class="bi bi-star-fill text-warning"></i>
                   <label for="phone">공간이름 : <b><%=dto.getS_name() %></b></label>
                   </div><br>
                    <div class="form-floating mb-3">
                            <input class="form-control" id="uc" name="bk_usercount" type="number" data-sb-validations="required" min="1" max="20"/>
                            <label for="bk_usercount"><i class="bi bi-star-fill text-warning"></i>예약인원</label>       
                    </div>
                    <div class="form-floating mb-3">
                             <input class="form-control"  id="date" name="bk_usedate" type="date"/>
                             <label for="bk_usedate"><i class="bi bi-star-fill text-warning"></i>예약일</label>
                        <script type="text/javascript">
                        var now_utc = Date.now()
                        var timeOff = new Date().getTimezoneOffset()*60000;
                        var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
                        document.getElementById("date").setAttribute("min", today);
						</script>
                    </div>
                    <div class="form-floating mb-3">
                             <input class="form-control" id ="st" name="bk_starttime" type="number" min="0" max="24" data-sb-validations="required" />
                             <label for="bk_starttime"><i class="bi bi-star-fill text-warning"></i>시작시간</label>
                    </div>
                    <div class="form-floating mb-3">
                             <input class="form-control" id="et" name="bk_endtime" type="number"  min="0" max="24"data-sb-validations="required" />
                             <label for="bk_endtime"><i class="bi bi-star-fill text-warning"></i>종료시간</label>                            
                    </div>   
                    
                    
                    <div id="d"></div>  
                                  <!-- Submit Button-->
<!--                                     <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">공간예약</button></div> -->
                    <div class="d-grid">
                              <input type="button" class="btn btn-primary btn-lg" value ="공간예약" onclick="fun()"></div>
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
