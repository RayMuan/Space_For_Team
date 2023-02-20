package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class SpaceInfoPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceInfo execute()");
		int s_num=51;
//				Integer.parseInt(request.getParameter("s_num"));
		SpaceDAO sdao=new SpaceDAO();
		SpaceDTO sdto=sdao.getSpace(s_num);

		HostDAO hdao=new HostDAO();
		HostDTO hdto=hdao.getHost(sdto.getH_num());
		
		ReviewDAO redao=new ReviewDAO();
		ReviewDTO redto=redao.getReview(s_num);
		ReviewDTO re_avg=redao.getRe_avg(s_num);
		

		
		// setAttribute
		request.setAttribute("sdto", sdto);
		request.setAttribute("hdto", hdto);
		request.setAttribute("redto", redto);
		request.setAttribute("re_avg", re_avg);

		ActionForward forward=new ActionForward();
		forward.setPath("/ReviewPro.re");
		forward.setRedirect(false);
		return forward;
	}

}

