<%@page import="com.space4team.booking.db.BookingDTO"%>
<%@page import="com.mysql.cj.sasl.ScramSha1SaslClient"%>
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
                    <a class="navbar-brand" href="index.jsp">Space for team</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="loginForm.jsp">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="insertForm.jsp">회원가입</a></li>
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
                            <h1 class="fw-bolder">공간예약수정</h1>
                            <%
                            BookingDTO dto = (BookingDTO)request.getAttribute("dto");
                           %>
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
	document.fr.submit();
 }
 </script>

<tr><td colspan ="2"><input type="submit" value="예약수정"></td></tr>
 
                                <form action="BookingUpdatePro.bk" method="post" name="fr">
    								<input type ="hidden" name ="num" id="uc" value="<%=dto.getBk_num() %>">
    								<div class="form-floating mb-3">
                                        <input class="form-control" type="number" name ="bk_usercount" value="<%=dto.getBk_usercount() %>"min="1" max="20" />
                                        <label for="bk_usercount">예약인원</label>       
                                    </div>
                                    
    								<div class="form-floating mb-3">
                                        <input class="form-control" type="date" id="date" name ="bk_usedate" value="<%=dto.getBk_usedate() %>" />
                                        <label for="bk_usercount">예약일</label>  
                                    	<script type="text/javascript">
                        					var now_utc = Date.now()
                        					var timeOff = new Date().getTimezoneOffset()*60000;
                        					var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
                        					document.getElementById("date").setAttribute("min", today);
										</script>     
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="number" id="st" name ="bk_starttime" value="<%=dto.getBk_starttime() %>" min="1" max="24" />
                                        <label for="bk_usercount">시작시간</label>       
                                    </div>
                                    
                                    <div class="form-floating mb-3">
                                        <input class="form-control" type="number" id="et" name ="bk_endtime" value="<%=dto.getBk_endtime() %>" min="1" max="24"/>
                                        <label for="bk_usercount">종료시간</label>       
                                    </div>
                                
                                  
                                    <div id="d"></div>  
                                  <!-- Submit Button-->
<!--                                     <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">공간예약</button></div> -->
                              <div class="d-grid">
                              <input type="submit" class="btn btn-primary btn-lg" value ="예약수정" ></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
                    <div class="row gx-5 row-cols-2 row-cols-lg-4 py-5">
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-chat-dots"></i></div>
                            <div class="h5 mb-2">Chat with us</div>
                            <p class="text-muted mb-0">Chat live with one of our support specialists.</p>
                        </div>
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
                            <div class="h5">Ask the community</div>
                            <p class="text-muted mb-0">Explore our community forums and communicate with other users.</p>
                        </div>
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-question-circle"></i></div>
                            <div class="h5">Support center</div>
                            <p class="text-muted mb-0">Browse FAQ's and support articles to find solutions.</p>
                        </div>
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-telephone"></i></div>
                            <div class="h5">Call us</div>
                            <p class="text-muted mb-0">Call us during normal business hours at (555) 892-9403.</p>
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
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
