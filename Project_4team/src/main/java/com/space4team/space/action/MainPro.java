package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.db.HostDAO;
import com.space4team.space.db.HostDTO;
import com.space4team.space.db.ReviewDAO;
import com.space4team.space.db.ReviewDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class MainPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainPro execute()");
		
		// int s_num=request.getParameter("s_name");
		int s_num = 1;
		SpaceDAO sdao = new SpaceDAO();
		SpaceDTO sdto = sdao.getSpace(s_num);
		request.setAttribute("sdto", sdto);
		
		HostDAO hdao = new HostDAO();
		HostDTO hdto = hdao.getHost(s_num);
		request.setAttribute("hdto", hdto);
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO rdto = rdao.getReview(s_num);
		request.setAttribute("rdto", rdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("jsp/main.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
