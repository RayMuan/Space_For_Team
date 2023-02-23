package com.space4team.space.action;

import java.util.ArrayList;

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


public class SpaceInfoPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceInfo execute()");
		int s_num=51;
//		 Integer.parseInt(request.getParameter("s_num"));
		request.setAttribute("s_num", s_num);
		int user_num=1;
		request.setAttribute("user_num", user_num);
//		Integer.parseInt(request.getParameter("s_num"));
		SpaceDAO sdao=new SpaceDAO();
		SpaceDTO sdto=sdao.getSpace(s_num);

		HostDTO hdao=new HostDAO();
		HostDTO hdto=hdao.getHost(sdto.getH_num());
		
		UserDAO udao=new UserDAO();
		UserDTO udto=udao.getUser(user_num);
		
		ReviewDAO redao=new ReviewDAO();
		ReviewDTO redto=redao.getReview(s_num);
		ReviewDTO re_avg=redao.getRe_avg(s_num);
		

		//review
		System.out.println("ReviewPro()");
		//page
		int pageSize=5;
		String pageNum="1";
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow = startRow+pageSize-1;
		
		ArrayList<ReviewDTO> reviewList=redao.getReviewList(s_num, startRow, pageSize);

		
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int reCount=redao.getReviewCount(s_num);
		int rePageCount=reCount/pageSize+(reCount%pageSize==0?0:1);
		if(endPage > rePageCount){
			endPage = rePageCount;
		}
		

		
		// setAttribute dto
		request.setAttribute("sdto", sdto);
		request.setAttribute("hdto", hdto);

		request.setAttribute("redto", redto);

		request.setAttribute("udto", udto);
		request.setAttribute("redto", redto);
		request.setAttribute("re_avg", re_avg);
		
		// setAttribute page
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		
		// setAttribute review
		request.setAttribute("reviewList",reviewList);
		request.setAttribute("pageCount", rePageCount);
		
		ActionForward forward=new ActionForward();
		forward.setPath("space/spaceInfo.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
