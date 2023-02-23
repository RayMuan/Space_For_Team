<%@page import="com.space4team.qna.db.QnaDTO"%>
<%@page import="com.space4team.user.db.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="com.space4team.review.db.ReviewDTO"%>
<%@page import="com.space4team.review.db.ReviewDAO"%>
<%@page import="com.space4team.host.db.HostDTO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<%
int s_num=Integer.parseInt(request.getParameter("s_num"));
// (int)session.getAttribute("s_num");

SpaceDTO sdto = (SpaceDTO) request.getAttribute("sdto");
HostDTO hdto = (HostDTO) request.getAttribute("hdto");
ReviewDTO redto = (ReviewDTO) request.getAttribute("redto");
ReviewDTO re_avg = (ReviewDTO) request.getAttribute("re_avg");
%>
<title><%=sdto.getS_name()%></title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- 추가 js -->
<script type="text/javascript">


</script>
<!-- 추가 css -->
<style>
ul {
	list-style: none;
}
</style>
</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="index.html">Start Bootstrap</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
						<li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
						<li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="blog-home.html">Blog
										Home</a></li>
								<li><a class="dropdown-item" href="blog-post.html">Blog
										Post</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
							href="#" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">Portfolio</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
								<li><a class="dropdown-item" href="portfolio-overview.html">Portfolio
										Overview</a></li>
								<li><a class="dropdown-item" href="portfolio-item.html">Portfolio
										Item</a></li>
							</ul></li>
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
								<h1 class="fw-bolder mb-1"><%=sdto.getS_name()%></h1>
							</header>
							<!-- 본문 사진 -->
							<figure class="mb-4">
								<img class="img-fluid rounded"
									src="https://dummyimage.com/900x400/ced4da/6c757d.jpg"
									alt="..." />
							</figure>
						</article>
						
						<div class="card bg-light">
							<div class="col p-2">
							<ul class="btn-toolbar m-0 p-0">
                            <li class="col-lg-6 text-center" id="review">
                            <a class="button fs-4 text-black text-decoration-none" href="javascript:void(0)" id="review">리뷰</a>
                            </li>
                            <li class="col-lg-6 text-center border-start">
                            <a class="button fs-4 text-black text-decoration-none" href="#" id="qna">QnA</a>
                            </li>
                        	</ul>
							</div>
							
							<%
							ArrayList<ReviewDTO> reviewList = (ArrayList<ReviewDTO>) request.getAttribute("reviewList");
							%>
						<!-- 리뷰 -->
						<div id="reviewList">
								<div class="card-body">
								<div class="row gx-5">
									<!-- Comment form-->
									<form class="mb-4 col" action="ReviewWritePro.re" method="post">
										<textarea class="form-control col-10"  name="content" rows="3"
											placeholder="Join the discussion and leave a comment!"></textarea>
											<input type="submit" class="btn btn-secondary btn-lg px-4 col-2" value="리뷰 달기">
									</form>
									</div>
									<ul>
										<%
										for (int i = 0; i < reviewList.size(); i++) { redto =
										reviewList.get(i);
										%>
										<li>
											<div class="ms-3 border-bottom">
												<div class="ms-3">
													<div class="fw-bold d-flex align-items-center"><%=redto.getRe_user_id() %><p
															class="fst-italic fw-noaml mb-0 ms-3 fw-light fs-6"><%=redto.getRe_date()%></p>
													</div>
													<div><%=redto.getRe_point()%></div>
													<%=redto.getRe_content()%>
												</div>
												<!-- Child comment 1-->
												<div class="ms-3">
													<div class="d-flex mt-3 mb-4 ">
														<div class="ms-3 p-sm-4 bg-dark bg-opacity-25 col-5">
															<div class="fw-bold d-flex align-items-center"><%=hdto.getH_name()%><p
																	class="fst-italic fw-noaml mb-0 ms-3 fw-light fs-6"><%=redto.getRe_date()%></p>
															</div>
															<%=redto.getRe_reply()%>
														</div>
													</div>
												</div>
											</div>
										</li>
										<%
										}
										%>
									</ul>

									<div class="d-flex mb-4" id="reviewList">
									</div>
								</div>
							</div>
						<!-- 	QnA		-->
						</div>
					</div>
					
					
					
					
					<!-- 상세 정보 -->
					<div class="col-lg-3">
						<section class="mb-5 pt-4">
							<h2 class="fw-bolder mb-2 mt-5">평점</h2>
							<p class="fs-1 mb-4"><%=re_avg.getRe_avg() %></p>
							<a class="btn btn-primary btn-lg px-4 me-sm-3" href="">예약하기</a>
							<h3 class="fw-bolder mb-2 mt-5">기본 옵션</h3>
							<div></div>
							<h3 class="fw-bolder mb-2 mt-5">위치</h3>
							<div class="col-lg-12 mb-5">
								<div class="card h-100 border">
									<img class="card-img-top"
										src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
									<div class="card-body p-4">
										<p class="card-text mb-0"><%=sdto.getS_sido()%><%=sdto.getS_sigungu()%><%=sdto.getS_address()%></p>
									</div>
								</div>
							</div>

							<div class="col-lg-12 mb-5">
								<div class="card h-100 border">
									<div class="card-body p-4">
										<h5 class="card-title mb-3">공지사항</h5>
										<p class="card-text mb-0"><%=sdto.getS_memo()%></p>
									</div>
									<div class="card-footer p-3 bg-light border-top">
										<div class="fw-bold me-sm-3"><%=hdto.getH_name()%></div>
										<div class="fw-nomal"><%=hdto.getH_phone()%></div>
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
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2022</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
