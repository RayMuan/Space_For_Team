package com.space4team.review.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class ReviewWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("ReviewWritePro execute()");
			request.setCharacterEncoding("utf-8");
			HttpSession session=request.getSession();
			
			int s_num=Integer.parseInt(request.getParameter("s_num"));
			String id=(String)session.getAttribute("id");
			int job=(Integer)session.getAttribute("job");

						
			ReviewDTO redto=new ReviewDTO();
			
			if(job == 1) {
				// user
				UserDAO dao=new UserDAO();
				UserDTO dto=dao.getUserInfo(id);
				
				int user_num=dto.getUser_num();
				String re_content=request.getParameter("re_content");
				Timestamp re_date=new Timestamp(System.currentTimeMillis());
				int re_point=Integer.parseInt(request.getParameter("re_point"));
				
				redto.setS_num(s_num);
				redto.setUser_num(user_num);
				redto.setRe_content(re_content);
				redto.setRe_date(re_date);
				redto.setRe_point(re_point);
			}else if( job==2 ) {
				//host
				String re_reply=request.getParameter("re_reply");
				redto.setRe_reply(re_reply);
				
			}
			ReviewDAO redao=new ReviewDAO();
			redao.insertReview(redto);
			System.out.println("ReviewWritePro s_num="+s_num);
			System.out.println("ReviewWritePro id="+s_num);
			System.out.println("ReviewWritePro job="+job);
				
				
			ActionForward forward=new ActionForward();
			forward.setPath("SpaceInfoPro.sp");
			forward.setRedirect(false);
			return forward;
	}

}
