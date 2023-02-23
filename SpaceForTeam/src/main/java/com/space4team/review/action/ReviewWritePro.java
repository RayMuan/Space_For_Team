package com.space4team.review.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;

public class ReviewWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("ReviewWritePro execute()");
				request.setCharacterEncoding("utf-8");
				
				int user_num=1;
				int s_num=51;
				
				int re_point=Integer.parseInt(request.getParameter("re_point"));
				String re_content=request.getParameter("re_content");
				Timestamp re_date=new Timestamp(System.currentTimeMillis());
				
				ReviewDTO redto=new ReviewDTO();
				redto.setUser_num(user_num);
				redto.setRe_content(re_content);
				redto.setRe_date(re_date);
				redto.setRe_point(re_point);
				redto.setS_num(s_num);
				
				ReviewDAO redao=new ReviewDAO();
				redao.insertReview(redto);
				
				
				ActionForward forward=new ActionForward();
				forward.setPath("SpaceInfo.sp");
				forward.setRedirect(false);
				return forward;
	}

}
