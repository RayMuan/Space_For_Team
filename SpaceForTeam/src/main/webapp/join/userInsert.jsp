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
        
        <script type="text/javascript" src="script/jquery-3.6.3.js"></script>
 		<script type="text/javascript">
 	$(document).ready(function(){
 		
 		var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; //@, . 필수 입력
 		var RegexName = /^[가-힣a-zA-Z]{2,12}$/; //이름 유효성 검사 2~4자 사이
 		var RegexId =  /^[a-zA-Z0-9]{3,12}$/ ; //아이디 유효성 검사 4 ~12자 사이
 		var RegexTel = /^[0-9]{8,11}$/; //전화번호 유효성 검사
 		var RegexPass= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
 		$('#join').submit(function() {
		if ($('#user_email').val()=="") {
			alert("이메일 입력하세요");
			$('#user_email').focus();
			return false;
		}else if (!RegexEmail.test($.trim($("#user_email").val()))){
				alert("이메일 형식에 맞지않습니다");
				$("#user_email").focus();
				return false;
			}
		
		if ($('#emaildup').val()=="") {
			alert("이메일 중복확인 체크해주세요");
			$('#user_email').focus();
			return false;
		}
		if ($('#emaildup').val()=="0") {
			alert("이메일이 중복됩니다. 확인해주세요.");
			$('#user_email').focus();
			return false;
		}
		
		
		if($('#user_id').val()==""){
			alert("아이디 입력하세요");
			$('#user_id').focus();
			return false;
		}else if (!RegexId.test($.trim($("#user_id").val()))){
 				alert("아이디 4~12자로 입력하세요");
 				$("#user_id").focus();
 				return false;
 			}	
		
		if ($('#iddup').val()=="") {
			alert("아이디 중복확인 체크해주세요");
			$('#user_id').focus();
			return false;
		}
		if ($('#iddup').val()=="0") {
			alert("아이디가 중복됩니다. 확인해주세요.");
			$('#user_id').focus();
			return false;
		}
		
		if ($('#user_name').val()=="") {
			alert("이름 입력하세요");
			$('#user_name').focus();
			return false;
		}else if ( !RegexName.test($.trim($("#user_name").val()))){
				alert("이름형식에 맞지않습니다");
				$("#user_name").focus();
				return false;
			}
		if ($('#user_pass').val()=="") {
			alert("비밀번호 입력하세요");
			$('#user_pass').focus();
			return false;
		}else if ( !RegexPass.test($.trim($("#user_pass").val()))){
			alert("비밀번호는 숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다");
			$("#user_pass").focus();
			return false;
			}
		if ($('#user_pass').val() != $('#user_pass1').val()) {
			alert("비밀번호가 일치하지 않습니다");
			$('#user_pass1').focus();
			return false;
		}
	
		if ($('#user_phone').val()=="") {
			alert("핸드폰번호를 입력하세요");
			$('#user_phone').focus();
			return false;
		}else if (!RegexTel.test($.trim($("#user_phone").val()))){
			alert("전화번호 형식에 맞지않습니다");
			$("#user_phone").focus();
			return false;
		}
		if ($('#user_birth').val()=="") {
			alert("생년월일을 입력하세요");
			$('#user_birth').focus();
			return false;
		}
		

		
		

		
 		});
	
		$('#button').click(function () {
			if($('#user_email').val()==""){
				alert("이메일 입력하세요");
				$('#user_email').focus();
				return false;
			}
			$.ajax({
				url : 'UserEmailCheck.us',
				data : {'email':$('#user_email').val()},
				success : function(result){
					if(result.trim()=="이메일 중복"){
						$('#button').html(result).css("color","red");
						$('#emaildup').val(0);
					}else{
						$('#button').html(result).css("color","blue");
						$('#emaildup').val(1);
					}
					
				}
			});
			
		});
		
		
		
		$('#button1').click(function () {
			if($('#user_id').val()==""){
				alert("아이디 입력하세요");
				$('#user_id').focus();
				return false;
			}
			$.ajax({
				url : 'UserIdCheck.us',
				data : {'id':$('#user_id').val()},
				success : function(result){
					if(result.trim()=="아이디 중복"){
						$('#button1').html(result).css("color","red");
						$('#iddup').val(0);
					}else{
						$('#button1').html(result).css("color","blue");	
						$('#iddup').val(1);
					}
					
				}
			});
			
			
		});
 	}); // 준비
 	
 
</script>

      
        
        
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="Join.us">회원가입</a></li>
                            <li class="nav-item"><a class="nav-link" href="UserLoginForm.us">로그인</a></li>
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
                            <div align="right" class="col pt-sm-5 pe-xl-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3 "><i al class="bi bi-people"></i></div>
                            <div align="right" class="h5"><a href="HostInsertForm.ho">HOST</a> </div>
                    </div>
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">GUEST 회원가입</h1>
                        </div>

                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                            
                            
                            
                            
                            
                            <!-- * * * * * * * * * * * * * * *-->
                                <form action="UserInsertPro.us" id="join" method="post" >
                    	    <!-- * * * * * * * * * * * * * * *-->    
                                
                                
                                
                                
                                
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_email" id="user_email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">이메일</label>
                                        <input type="hidden" name="emaildup" value="" id="emaildup">
                                    <button class="btn btn-outline-dark" id="button" type="button">중복확인</button>
                                        <div class="invalid-feedback" data-sb-feedback="email:required"></div>
                                    </div>
                                    
                                     <!-- Id input-->
                                  	 <div class="form-floating mb-3">
                                    <input class="form-control" name= "user_id" id="user_id" type="text" placeholder="a"  data-sb-validations="required" aria-describedby="button-newsletter" />
                                    <label for="id">아이디</label>
                                      <input type="hidden" name="iddup" value="" id="iddup">
                                    <button class="btn btn-outline-dark" id="button1" type="button">중복확인</button>
                                     <div class="invalid-feedback" data-sb-feedback="id:required"></div>
                               	 </div>
                               		 
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_name" id="user_name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                        <label for="name">이름</label>
                                        <div class="invalid-feedback" data-sb-feedback="name:required"></div>
                                    </div>
                                    
                                     <!-- Pass1 input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_pass" id="user_pass" type="password" placeholder="Enter your passward..." data-sb-validations="required" />
                                        <label for="pass">비밀번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="pass:required"></div>
                                    </div>
                                    
                                    <!-- Pass2 input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_pass1" id="user_pass1" type="password" placeholder="Enter your Confirm password..." data-sb-validations="required" />
                                        <label for="pass1">비밀번호 재확인</label>
                                        <div class="invalid-feedback" data-sb-feedback="pass:required"></div>
                                    </div>
                                    
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_phone" id="user_phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                        <label for="phone">핸드폰 번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="phone:required"></div>
                                    </div>
                                    
                                    <!-- birth input-->
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="user_birth" id="user_birth" type="text" placeholder="1993-01-01" data-sb-validations="required" />
                                        <label for="birth">생년월일</label>
                                        <div class="invalid-feedback" data-sb-feedback="birth:required"></div>
                                    </div>
                                    
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">Form submission successful!</div>
                                            <br />
                                        </div>
                                    </div>
                                    <input type="submit" class="btn-primary btn-lg disabled" id="submitButton" name="submit" value="회원가입" >
                                    </form>
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
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
