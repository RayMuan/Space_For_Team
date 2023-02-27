<%@page import="com.space4team.user.db.UserDTO"%>
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
        <link href="css/styles.css" rel="stylesheet" />
   <style type="text/css">
    .btn-primary {
    color: #fff;
    background-color: #808080;
    border-color: #808080;
}
form {
  background-color: #f7f7f7;
  padding: 20px;
  font-family: Arial, sans-serif;
  margin: 20px auto;
  max-width: 400px;
}

form label {
  font-weight: bold;
}

form input[type="text"],
form input[type="email"],
form input[type="tel"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 4px;
  border: none;
  border-bottom: 1px solid #ddd;
  font-size: 16px;
}

form input[type="submit"],
form input[type="button"]
 {
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
  margin-top: 20px;
}
    </style> 
<script type="text/javascript" src="script/jquery-3.6.3.js"></script>        
    <script type="text/javascript">
 	// jQurery 준비 => 대상.함수()
 	$(document).ready(function(){

		//submit 버튼을 클릭했을때 이벤트 onsubmit()
		// id="pass_modify" 폼태그 표시 => 전송
		$('#pass_modify').submit(function(){
			
			if($('#pass').val()==""){
				alert("비밀번호 입력하세요");
				$('#pass').focus();
				return false;
			}
			if($('#pass2').val()==""){
				alert("비밀번호 재확인 입력하세요");
				$('#pass2').focus();
				return false;
			}
			
			if($('#pass').val() != $('#pass2').val()){
				alert("비밀번호가 일치하지 않습니다.");
				$('#pass2').focus();
				return false;
			}
		});
	});
    </script>
        
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
             <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">                
                    <a class="navbar-brand" href="MainPro.sp">SpaceForTeam</a> 
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="MainPro.sp">Home</a></li>                   
                            <li class="nav-item"><a class="nav-link" href="join.jsp">Join</a></li>
                            <li class="nav-item">
                            <%   
//                             String id = "";
							String id=(String)session.getAttribute("id");
                            if(id!=null){
                            	%>
                            	<a class="nav-link" ><%=id %> 님</a>
                            <%
                            }
                            %>
                            </li>
                            <%if(id==null){
                            	%>
                            	<li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="userloginform.jsp">Guest</a></li>
                                     <li><a class="dropdown-item" href="hostLogin.jsp">Host</a></li>
                                </ul>
                                <%
                                }
                                %>
                            </li>
                            
                            <%
                           	
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
                            <h1 class="fw-bolder">:: 비밀번호변경 ::</h1>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                             
<%
UserDTO dto=(UserDTO)request.getAttribute("dto");

%>
                                <form action="UserPwModifyPro.us" name="passForm" id="pass_modify" method="post" onsubmit="return checkValue()">
                                    <!-- ID input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="user_id" type="text" name="id" value="<%=id%>" readonly />
                                        <label for="id"><i class="bi bi-star-fill text-warning"></i> 아이디</label>
                                    </div>
                                    <!-- Pass input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="pass" type="password"  name="pass" />
                                        <label for="pass"> <i class="bi bi-star-fill text-warning"></i>새 비밀번호</label>
                                    </div>
                                    
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="pass2" type="password"  name="pass2" />
                                        <label for="pass"> <i class="bi bi-star-fill text-warning"></i>비밀번호 확인</label>
                                    </div>
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
                                    <!-- This is what your users will see when there is-->
                                    <!-- Submit Button-->
<!--                                     <div class="d-grid"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">변경완료</button></div> -->
									<div style="text-align:center">
									<input class="btn btn-primary btn-lg" type="button" value="취소" onclick="javascript:window.location='UserMain.us'">
									<input class="btn btn-primary btn-lg" href="#scroll-target" type="submit" value="변경">
									</div>
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
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
