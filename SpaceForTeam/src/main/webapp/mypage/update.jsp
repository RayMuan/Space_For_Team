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
        <title>Modern Business - Start Bootstrap Template</title>
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
                    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
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
                            <h1 class="fw-bolder">회원정보수정</h1>
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
<%
UserDTO dto=(UserDTO)request.getAttribute("dto");
String id=(String)session.getAttribute("id");
%>
                                <form action="UserUpdatePro.us" id="join" method="post">
                                    <!-- ID input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="user_id" type="text" name="id" value="<%=id%>" readonly data-sb-validations="required" />
                                        <label for="id"><i class="bi bi-star-fill text-warning"></i> 아이디</label>
                                        <div class="invalid-feedback" data-sb-feedback="user_id:required">5~12자 영문(대소문자 구분), 숫자 입력해주세요.</div>
                                    </div>
                                    <!-- Pass input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="user_pass" type="pass"  name="pass" value="<%=dto.getUser_pass()%>" readonly data-sb-validations="required" />
                                        <label for="pass"> <i class="bi bi-star-fill text-warning"></i> 비밀번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="user_pass:required">영문, 숫자, 특수문자 조합 8~16자리를 입력해 주세요.</div>
                                    </div>
                                    <!-- Name input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="user_name" type="text" name="name" value="<%=dto.getUser_name()%>" data-sb-validations="required" />
                                        <label for="name"> <i class="bi bi-star-fill text-warning"></i> 이름</label>
                                        <div class="invalid-feedback" data-sb-feedback="user_name:required">A name is required.</div>
                                    </div>
                                    <!-- Email address input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="user_email" type="email" name="email" value="<%=dto.getUser_email()%>"data-sb-validations="required,email" />
                                        <label for="email"><i class="bi bi-star-fill text-warning"></i> 이메일</label>
                                        <div class="invalid-feedback" data-sb-feedback="user_email:required">이메일을 입력해주세요.</div>
                                    </div>
                                    <!-- Phone number input-->
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="user_phone" type="tel" name="phone" value="<%=dto.getUser_phone()%>" data-sb-validations="required" />
                                        <label for="phone"><i class="bi bi-star-fill text-warning"></i> 전화번호</label>
                                        <div class="invalid-feedback" data-sb-feedback="user_phone:required">(-)없이 입력해주세요.</div>
                                    </div>
                                    <!-- birth input-->
                                     <div class="form-floating mb-3">
                                        <input class="form-control" id="user_birth" type="text" name="birth" value="<%=dto.getUser_birth()%>" data-sb-validations="required" />
                                        <label for="birth"><i class="bi bi-star-fill text-warning"></i> 생년월일</label>
                                        <div class="invalid-feedback" data-sb-feedback="user_birth:required">생년월일을 입력해주세요.</div>
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
									<input class="btn btn-primary btn-lg" href="#scroll-target" type="submit" value="변경완료">
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
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
