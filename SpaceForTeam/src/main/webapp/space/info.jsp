<%@page import="com.space4team.db.SpaceDAO"%>
<%@page import="com.space4team.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
    <%
    SpaceDTO dto=(SpaceDTO)request.getAttribute("dto");
	%>
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
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1"><%=dto.getS_name() %></h1>
                                    <!-- Post meta content-->
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">스터디룸</a>
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!">세미나룸</a>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                                <!-- Post content-->
                                
                            </article>
                            <!-- Comments section-->
                            <section>
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <!-- Comment form-->
                                        <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
                                        <!-- Comment with nested comments-->
                                        <div class="d-flex mb-4">
                                            <!-- Parent comment-->
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold d-flex align-items-center">게스트 1<p class="fst-italic fw-noaml mb-0 ms-3 fw-light fs-6">2022-02-07</p></div>
                                                <div>★★★★☆</div>
                                                If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                                <!-- Child comment 1-->
                                                <div class="d-flex mt-4">
                                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                    <div class="ms-3">
                                                        <div class="fw-bold d-flex align-items-center">호스트 <p class="fst-italic fw-noaml mb-0 ms-3 fw-light fs-6">2022-02-08</p></div>
                                                        And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single comment-->
                                        <div class="d-flex">
                                            <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                            <div class="ms-3">
                                                <div class="fw-bold d-flex align-items-center">게스트2<p class="fst-italic fw-noaml mb-0 ms-3 fw-light fs-6">2022-02-07</p></div>
                                                <div>★★★★☆</div>
                                                When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        
                        <div class="col-lg-3">
						<section class="mb-5">
							<h2 class="fw-bolder mb-2 mt-5">평점</h2>
							<p class="fs-1 mb-4">4.5</p>

							<h3 class="fw-bolder mb-2 mt-5">기본 옵션</h3>
							<div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-layout-split"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-p-square"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-wifi"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-cup-straw"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-badge-wc"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-plug"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-thermometer-sun"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-thermometer-snow"></i>
								</div>

								<h3 class="fw-bolder mb-2 mt-5">선택 옵션</h3>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-file-lock2"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-printer"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-projector"></i>
								</div>
								<div
									class="feature bg-dark bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-laptop"></i>
								</div>
							</div>

							<h3 class="fw-bolder mb-2 mt-5">위치</h3>
							<div class="col-lg-12 mb-5">
								<div class="card h-100 border">
									<img class="card-img-top"
										src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
									<div class="card-body p-4">
										<p class="card-text mb-0">부산광역시 부산진구<br><%=dto.getS_address() %></p>
									</div>
								</div>
							</div>

							<div class="col-lg-12 mb-5">
								<div class="card h-100 border">
									<div class="card-body p-4">
										<h5 class="card-title mb-3">공지사항</h5>
										<p class="card-text mb-0">메모 내용 좀 길게 적어야 줄나눔이 보일 것 같은데
											어게한담. 엔터를 넣으면 어떻게 될까. 충격 엔터 안먹음 . 당연...한가? db로 넣으면 다를지도.</p>
									</div>
									<div class="card-footer p-3 bg-light border-top">
										<div class="d-flex align-items-end justify-content-between">
											<div class="d-flex align-items-center">
												<div class="fw-bold me-sm-3">호스트</div>
												<div class="fw-nomal">010-0111-0111</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
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
