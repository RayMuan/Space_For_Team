<%@page import="com.space4team.host.db.HostDTO"%>
<%@page import="com.space4team.review.db.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.space4team.user.db.UserDAO"%>
<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<%
	SpaceDTO sdto = (SpaceDTO) request.getAttribute("sdto");
	HostDTO hdto = (HostDTO) request.getAttribute("hdto");
	ReviewDTO redto = (ReviewDTO) request.getAttribute("redto");
	ReviewDTO re_avg = (ReviewDTO) request.getAttribute("re_avg");
	ArrayList <ReviewDTO> reviewList = (ArrayList<ReviewDTO>) request.getAttribute("reviewList");
	UserDAO dao = new UserDAO();
	UserDTO udto = null;
	
	for (int i = 0; i < reviewList.size(); i++) {
		redto = reviewList.get(i);
		udto = dao.getUser(redto.getUser_num());
	%>
	<ul>
		<li><div class="ms-3 border-bottom">
				<div class="ms-3">
					<div class="fw-bold d-flex align-items-center"><%=udto.getUser_id()%><p
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
</body>