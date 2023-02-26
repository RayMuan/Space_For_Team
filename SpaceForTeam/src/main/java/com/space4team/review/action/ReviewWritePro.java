package com.space4team.review.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class ReviewWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("ReviewWritePro execute()");
			request.setCharacterEncoding("utf-8");

			int s_num=Integer.parseInt(request.getParameter("num"));
			System.out.println(s_num);

						
			ReviewDTO redto=new ReviewDTO();
			HttpSession session=request.getSession();
				
			if("user_id" != null) {
				String user_id=(String)session.getAttribute("user_id");
				session.setAttribute("user_id", user_id);
				UserDAO dao=new UserDAO();
				System.out.println(user_id);
				UserDTO dto=dao.getUserInfo(user_id);
				
				int user_num=dto.getUser_num();
				int re_point=Integer.parseInt(request.getParameter("re_point"));
				
				redto.setUser_num(user_num);
				redto.setRe_point(re_point);
			}
				
			String re_content=request.getParameter("re_content");
			redto.setRe_content(re_content);
				
			Timestamp re_date=new Timestamp(System.currentTimeMillis());
			redto.setRe_date(re_date);
			redto.setS_num(s_num);

			ReviewDAO redao=new ReviewDAO();
			redao.insertReview(redto);
				
				
			ActionForward forward=new ActionForward();
			forward.setPath("SpaceInfoPro.sp");
			forward.setRedirect(false);
			return forward;
	}

}
