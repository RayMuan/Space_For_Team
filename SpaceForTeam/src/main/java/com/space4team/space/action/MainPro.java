package com.space4team.space.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Session;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class MainPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainPro execute()");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			session.setAttribute("job", 0);
		}

		
		SpaceDAO dao = new SpaceDAO();
		int pageSize = 9;
		String pageNum = request.getParameter("pageNum");
		String search=request.getParameter("search");
		
		String s_sido=request.getParameter("s_sido");
		
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		 ArrayList<SpaceDTO> spaceList = null;
//	      spaceList =null;
	      if(search==null) {
	         //검색어 없음
	         spaceList=dao.getSpaceList(startRow, pageSize);
	      }else {
	         // 검색어 있음
	        spaceList=dao.getSpaceList(startRow, pageSize, search, s_sido);   
	      }
		
		int pageBlock = 5;
		int startPage = (currentPage -1 )/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		
		int count = 0;
		if(search==null) {
			count=dao.getSpaceCount();
		}else {
			count=dao.getSpaceCount(search, s_sido);
		}
		
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("pagecount"+pageCount);

	      // request 가져온 데이터 담기
	      request.setAttribute("search", search);
	      request.setAttribute("spaceList", spaceList);
	      request.setAttribute("currentPage", currentPage);
	      request.setAttribute("startPage", startPage);
	      request.setAttribute("pageBlock", pageBlock);
	      request.setAttribute("endPage", endPage);
	      request.setAttribute("pageCount", pageCount);

	      System.out.println("count"+count);
	      
	      
	      
	      ActionForward forward=new ActionForward();
	      forward.setPath("usermain.jsp");
	      forward.setRedirect(false);
	      return forward;
		
		}
	}
