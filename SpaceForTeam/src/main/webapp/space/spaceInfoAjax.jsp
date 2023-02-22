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
<!-- 추가 jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
    $("#reviewButton").click(function() {
        $.ajax({
            url : "review.jsp",
            success : function(result) {
                if (result) {
                    alert("완료");
                $("#reviewList").html(result);
                } else {
                    alert("전송된 값 없음");
                }
            },
            error: function() {
                alert("에러 발생");
            }
            }
        });
    });
});
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
	
		<div class="card bg-light">
							<div class="col p-2">
							<a href="#" id="reviewButton">리뷰</a>
							<a class="button fs-4 text-black text-decoration-none" href="#none">QnA</a>
							</div>
						<!-- 리뷰 -->
						<div>
								<div class="card-body">
									<!-- Comment form-->
									<form class="mb-4">
										<textarea class="form-control" rows="3"
											placeholder="Join the discussion and leave a comment!"></textarea>
									</form>
									<div class="d-flex mb-4" id="reviwList">
										<!-- Parent comment-->
									</div>
								</div>
							</div>
						<!-- 	QnA		-->
						</div>
					
	</main>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
