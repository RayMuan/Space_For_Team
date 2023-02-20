<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link href="css/styles.css" rel="stylesheet" type="text/css">

</head>
<body>

<!-- 본문내용 -->
<article>
  <h1 class="fw-bolder">게스트 로그인</h1>
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
                                   "Space For Team 회원이 아니신가요?"
                                   <a href="/auth/signup" class="submit">회원가입</a>
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
</article>
<!-- 본문내용 -->

</div>
</body>
</html>