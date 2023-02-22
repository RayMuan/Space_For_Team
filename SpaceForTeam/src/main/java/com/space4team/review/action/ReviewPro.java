package com.space4team.review.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;

public class ReviewPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				System.out.println("ReviewPro execute()");
				
				int s_num=51;
				
				ReviewDAO redao=new ReviewDAO();				
				int pageSize=5;
				String pageNum="1";
				int currentPage=Integer.parseInt(pageNum);
				int startRow=(currentPage-1)*pageSize+1;
				int endRow = startRow+pageSize-1;
				
				ArrayList<ReviewDTO> reviewList=redao.getReviewList(s_num, startRow, pageSize);
				
				int pageBlock=10;
				int startPage=(currentPage-1)/pageBlock*pageBlock+1;
				int endPage=startPage+pageBlock-1;
				int count=redao.getReviewCount(s_num);
				int pageCount=count/pageSize+(count%pageSize==0?0:1);
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				request.setAttribute("reviewList",reviewList);
				
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startPage", startPage);
				request.setAttribute("pageBlock", pageBlock);
				request.setAttribute("endPage", endPage);
				request.setAttribute("pageCount", pageCount);
				
				ActionForward forward=new ActionForward();
				forward.setPath("space/spaceInfoAjax.jsp");
				forward.setRedirect(false);
				return forward;
	}

}
