package com.space4team.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.review.db.ReviewDAO;

public class ReviewDeletePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewDeletePro execute()");
		request.setCharacterEncoding("UTF-8");
		int re_num = Integer.parseInt(request.getParameter("re_num"));
		System.out.println(re_num);
		
		ReviewDAO redao = new ReviewDAO();
		redao.deleteReview(re_num);
		
		ActionForward forward = new ActionForward ();
		forward.setPath("SpaceInfoPro.sp");
		forward.setRedirect(true);
		
		return forward;
	}
}
