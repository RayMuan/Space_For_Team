package com.space4team.space.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;



public class UserPro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserPro execute()");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		int job = (Integer)session.getAttribute("job");
		System.out.println("job="+job);
		
		
		System.out.println("login한 id값: "+id);
		
		
		SpaceDAO dao = new SpaceDAO();
		int pageSize =9;
		String pageNum = request.getParameter("pageNum");
		String search=request.getParameter("search");
		 
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		System.out.println("startRow "+startRow);
		
		 ArrayList<SpaceDTO> spaceList = null;
	      if(search==null) {
	         //검색어 없음
	         spaceList=dao.getSpaceList(startRow, pageSize);
	      }else {
	         // 검색어 있음
	        spaceList=dao.getSpaceList(startRow, pageSize, search);    
	      }
		
		int pageBlock = 3;
		int startPage = (currentPage -1 )/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		
		int count = 0;
		if(search==null) {
			count=dao.getSpaceCount();
		}else {
			count=dao.getSpaceCount(search);
		}
		System.out.println("count"+count);
		
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("pagecount"+pageCount);
		
		String idcheck = "";
				
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		
		HostDAO hdao = new HostDAO();
		HostDTO hdto = hdao.gethost(id);
		
		if(udto != null) {
			idcheck = "user";
			
		}else {
			idcheck = "host";
		}
		
		request.setAttribute("idcheck", idcheck);

	      request.setAttribute("search", search);
	      request.setAttribute("spaceList", spaceList);
	      request.setAttribute("currentPage", currentPage);
	      request.setAttribute("startPage", startPage);
	      request.setAttribute("pageBlock", pageBlock);
	      request.setAttribute("endPage", endPage);
	      request.setAttribute("pageCount", pageCount);

	     
		
		ActionForward forward=new ActionForward();
		forward.setPath("usermain.jsp");
		forward.setRedirect(false);
		return forward;
			
	}

}
