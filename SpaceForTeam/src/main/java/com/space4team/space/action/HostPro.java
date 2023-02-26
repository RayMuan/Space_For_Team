package com.space4team.space.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class HostPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HostPro execute()");
		SpaceDAO dao = new SpaceDAO();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String pass = (String)session.getAttribute("pass");
		
		HostDAO hdao = new HostDAO();
		HostDTO hdto = hdao.getHost(id);
	
		
		int pageSize = 3;
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum ==null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		ArrayList<SpaceDTO> spaceList = dao.getSpaceList(startRow, pageSize ,hdto);
		
		int pageBlock = 3;
		int startPage = (currentPage -1 )/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		int count = dao.getSpaceCount(hdto);
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		request.setAttribute("spaceList", spaceList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
	
		
		ActionForward forward = new ActionForward();
		forward.setPath("hostmain.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
