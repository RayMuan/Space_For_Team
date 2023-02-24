package com.space4team.space.action;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.db.HostDAO;
import com.space4team.space.db.HostDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class HostPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostPro execute()");
		
		// int s_num=request.getParameter("s_name");
		int s_num=1;
		
		SpaceDAO sdao = new  SpaceDAO();
		SpaceDTO sdto = sdao.getSpace(s_num);
		request.setAttribute("sdto", sdto);
		
		HostDAO hdao = new HostDAO();
		HostDTO hdto = hdao.getHost(s_num);
		request.setAttribute("hdto", hdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("jsp/host.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
