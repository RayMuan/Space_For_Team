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
        <link href="../css/styles.css" rel="stylesheet" />
        
        <script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
 		<script type="text/javascript">
 	// jQuery 준비 => 대상.함수()
 	// $ = jquery 약자
 	// ready 준비하다는 함수
	// document - html문서
 	$(document).ready(function(){
// 	alert("준비");
	// submit 버튼을 클릭했을 때 폼태그가 전송되어지면 이벤트 onsubmit()
	// form 태그의 id="join"를 찾아갈 때 #으로 찾아간다 
	// submit 버튼을 누르면 -> form 태그를 접근해서 form태그 전체를 전송
 		$('#join').submit(function() {
// 	alert("준비");
	// id가 비어있는지?? 확인하는 것 -> if문 사용
	// class = "id" 대상.함수()
		if ($('#user_email').val()=="") {
			alert("이메일 입력하세요");
			$('#user_email').focus();
			return false;
		}
		if($('#user_id').val()==""){
			alert("아이디 입력하세요");
			// 스타일시트 사용 -> 대상 지정 * 전체 , h1태그
			// id=이름 #이름, class=이름 .이름
			$('#user_id').focus();
			// return 되돌아 갈때 submit이 작용하지 않게끔 하려면 false
			// return에 false를 하지않으면 다음지정페이지로 넘어가게됨
// 태그 대상 지정해서 제어가능 $('*').css('color','red');
// 태그 대상 지정해서 제어가능 $('form').css('color','blue');
			return false;
		}
		if ($('#user_name').val()=="") {
			alert("이름 입력하세요");
			$('#user_name').focus();
			return false;
		}
		if ($('#user_pass').val()=="") {
			alert("비밀번호 입력하세요");
			$('#user_pass').focus();
			return false;
		}
		if ($('#user_pass1').val()=="") {
			alert("비밀번호 입력하세요");
			$('#user_pass1').focus();
			return false;
		}
		// 비밀번호 1과 2가 맞지않을 때 다시 되돌아가게끔
		if ($('#user_pass').val() != $('#user_pass1').val()) {
			alert("비밀번호가 일치하지 않습니다");
			$('#user_pass1').focus();
			return false;
		}
	
		if ($('#user_phone').val()=="") {
			alert("핸드폰번호를 입력하세요");
			$('#user_phone').focus();
			return false;
		}
		if ($('#user_birth').val()=="") {
			alert("생년월일을 입력하세요");
			$('#user_birth').focus();
			return false;
		}
// 		if ($('.email').val() != $('.email2').val()) {
// 			alert("이메일 틀림");
// 			$('.email2').focus();
// 			return false;
// 		}
		
		});
		// class = "dup" 를 클릭했을 때 기능동작 <ID중복체크>!
		$('#button').click(function () {
			if($('#user_id').val()==""){
				alert("아이디 입력하세요");
				$('#user_id').focus();
				return false;
			}
			// 페이지 이동없이 DB에 가서 아이디 중복체크해서 결과를 가져와서 출력
			// idCheck.jsp - 파일이 대상이 됨, 대상이 여러개면 중괄호 {}
			$.ajax({
				url : 'idCheck.jsp',
				data : {'id':$('#user_id').val()},
				// 성공적으로 결과값을 잘 들고오면 아이디 중복이랑 같은지 if문으로 확인
				success : function(result){
					// trim공백 제거
					if(result.trim()=="아이디 중복"){
						$('#button').html(result).css("color","red");
					}else{
						$('#button').html(result).css("color","blue");						
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
                            <li class="nav-item"><a class="nav-link" href="contact.html">회원가입</a></li>
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
                            <div align="right" class="h5"><a href="#">HOST</a> </div>
                    </div>
                        <div class="text-center mb-5">
                            <h1 class="fw-bolder">GUEST 회원가입</h1>
                        </div>

                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">
                            <!-- * * * * * * * * * * * * * * *-->
                                <form action="insertPro.jsp" id="join" method="post" >
                                
                                
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_email" id="user_email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                        <label for="email">이메일</label>
                                        <div class="invalid-feedback" data-sb-feedback="email:required">이메일을 입력해주세요.</div>
                                    </div>
                                     <!-- Id input-->
                              
                               	 <div class="form-control mb-3">
                                    <label for="id">아이디</label>
                                    <input class="form-control" name= "user_id" id="user_id" type="text" placeholder=""  data-sb-validations="required" aria-describedby="button-newsletter" />
                                    <button class="btn btn-outline-dark" id="button" type="button">중복확인</button>
                                     <div class="invalid-feedback" data-sb-feedback="id:required">5~12자 영문(대소문자 구분), 숫자 입력해주세요.</div>
                               	 </div>
                               		 
<!--                                     <div> -->
                                    
<!--                                     <div class="form-floating mb-3 col-9"  > -->
<!--                                         <input class="form-control " id="id" type="text" placeholder="Enter your id..." data-sb-validations="required"/> -->
<!--                                         <label for="id">아이디</label>  -->
<!--                                         <div class="invalid-feedback" data-sb-feedback="id:required">5~12자 영문(대소문자 구분), 숫자 입력해주세요.</div> -->
<!--                                     <div class="form-floating mb-3 col-3" style="float: right"> -->
<!--                                     	<input type="button" value="중복확인" class= "dup" > -->
<!--                             		</div> -->
<!--                                     </div> -->
                                    
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_name" id="user_name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                        <label for="name">이름</label>
                                        <div class="invalid-feedback" data-sb-feedback="name:required">이름을 입력해주세요.</div>
                                    </div>
                                     <!-- Pass1 input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_pass" id="user_pass" type="password" placeholder="Enter your passward..." data-sb-validations="required" />
                                        <label for="pass">비밀번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="pass:required">영문, 숫자, 특수문자 조합 8~16자리를 입력해 주세요.</div>
                                    </div>
                                    <!-- Pass2 input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_pass1" id="user_pass1" type="password" placeholder="Enter your Confirm password..." data-sb-validations="required" />
                                        <label for="pass1">비밀번호 재확인</label>
                                        <div class="invalid-feedback" data-sb-feedback="pass1:required">영문, 숫자, 특수문자 조합 8~16자리를 입력해 주세요.</div>
                                    </div>
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="user_phone" id="user_phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                        <label for="phone">핸드폰 번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="phone:required">하이픈(-)없이 입력해주세요.</div>
                                    </div>
                                    <!-- birth input-->
                                     <div class="form-floating mb-3">
                                        <input class="form-control" name="user_birth" id="user_birth" type="text" placeholder="1993-01-01" data-sb-validations="required" />
                                        <label for="birth">생년월일</label>
                                        <div class="invalid-feedback" data-sb-feedback="birth:required">생년월일을 입력해주세요.</div>
                                    </div>
                                    <!-- Submit success message-->
                                    <!---->
                                    <!-- This is what your users will see when the form-->
                                    <!-- has successfully submitted-->
                                    <div class="d-none" id="submitSuccessMessage">
                                        <div class="text-center mb-3">
                                            <div class="fw-bolder">Form submission successful!</div>
                                            <br />
                                            <a href="insertPro.jsp">이동</a>
                                        </div>
                                    </div>
                                    <!-- Submit error message-->
                                    <!-- This is what your users will see when there is-->
                                    <!-- an error submitting the form-->
                                    
                                    <!-- Submit Button-->
                                    <input type="submit" class="btn-primary btn-lg disabled" id="submitButton" value="회원가입" >
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
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>