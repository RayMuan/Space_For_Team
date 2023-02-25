package com.space4team.space.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Session;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class MainPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MainPro execute()");
		request.setCharacterEncoding("utf-8");
		
		SpaceDAO dao = new SpaceDAO();
		// 한페이지당 뜨는 글 갯수 => search만 적용됨 ㅠㅠ 
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
//	      spaceList =null;
	      if(search==null) {
	         //검색어 없음
	         spaceList=dao.getSpaceList(startRow, pageSize);
	      }else {
	         // 검색어 있음
	        spaceList=dao.getSpaceList(startRow, pageSize, search);    
	      }
		
		int pageBlock = 5;
		int startPage = (currentPage -1 )/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock -1;
		int count = dao.getSpaceCount();
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
	      forward.setPath("main.jsp");
	      forward.setRedirect(false);
	      return forward;
		
		}
	}
