package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class SpaceInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceInfo execute()");
		int s_num=1;
//				Integer.parseInt(request.getParameter("s_num"));
		
		SpaceDAO sdao=new SpaceDAO();
		SpaceDTO sdto=sdao.getSpace(s_num);

		HostDAO hdao=new HostDAO();
		HostDTO hdto=hdao.getHost(sdto.getH_num());
		
		ReviewDAO redao=new ReviewDAO();
		ReviewDTO redto=redao.getInfoReview(s_num);
		
		UserDAO udao=new UserDAO();
		UserDTO udto=udao.getInfoUser(redto.getS_num());
		
		request.setAttribute("sdto", sdto);
		request.setAttribute("hdto", hdto);
		request.setAttribute("redto", redto);
		request.setAttribute("udto", udto);
		
		
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("space/info.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
