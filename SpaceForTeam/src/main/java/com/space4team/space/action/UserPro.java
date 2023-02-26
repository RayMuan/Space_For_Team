package com.space4team.space.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;



public class UserPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserPro execute()");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// 공통 페이지에서 유저/호스트 나누는 코드
		session.setAttribute("job", 0);
		
		SpaceDAO dao = new SpaceDAO();
		int pageSize = 9;
		String pageNum = request.getParameter("pageNum");
		String search=request.getParameter("search");
		 
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
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
		
		int count=0;
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
