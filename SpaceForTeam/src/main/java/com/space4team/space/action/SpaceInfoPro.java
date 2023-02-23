package com.space4team.space.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.qna.db.QnaDAO;
import com.space4team.qna.db.QnaDTO;
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
		
<<<<<<< HEAD
		QnaDAO qdao=new QnaDAO();
		QnaDTO qdto=qdao.getQna(s_num);

=======

>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
		//review
		//review page
		System.out.println("ReviewPro()");
		int re_pageSize=10;
		String re_pageNum="1";
		int re_currentPage=Integer.parseInt(re_pageNum);
		int re_startRow=(re_currentPage-1)*re_pageSize+1;
		int re_endRow = re_startRow+re_pageSize-1;
		
<<<<<<< HEAD
		ArrayList<ReviewDTO> reviewList=redao.getReviewList(s_num, re_startRow, re_pageSize);
=======
		ArrayList<ReviewDTO> reviewList=redao.getReviewList(s_num, startRow, pageSize);

>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
		
		int re_pageBlock=10;
		int re_startPage=(re_currentPage-1)/re_pageBlock*re_pageBlock+1;
		int re_endPage=re_startPage+re_pageBlock-1;
		int re_count=redao.getReviewCount(s_num);
		int re_pageCount=re_count/re_pageSize+(re_count%re_pageSize==0?0:1);
		if(re_endPage > re_pageCount){
			re_endPage = re_pageCount;
		}

		//qna
		//qna page
		System.out.println("QnaPro()");
		int q_pageSize=3;
		String q_pageNum="1";
		int q_currentPage=Integer.parseInt(q_pageNum);
		int q_startRow=(q_currentPage-1)*q_pageSize+1;
		int q_endRow = q_startRow+q_pageSize-1;
		
		ArrayList<QnaDTO> qnaList=qdao.getQnaList(s_num, q_startRow, q_pageSize);
		
		int q_pageBlock=10;
		int q_startPage=(q_currentPage-1)/q_pageBlock*q_pageBlock+1;
		int q_endPage=q_startPage+q_pageBlock-1;
		int q_count=qdao.getQnaCount(s_num);
		int q_pageCount=q_count/q_pageSize+(q_count%q_pageSize==0?0:1);
		if(q_endPage > q_pageCount){
			q_endPage = q_pageCount;
		}
		

		
		// setAttribute dto
		request.setAttribute("sdto", sdto);
		request.setAttribute("hdto", hdto);

		request.setAttribute("redto", redto);

		request.setAttribute("udto", udto);
		request.setAttribute("redto", redto);
		request.setAttribute("qdto", qdto);
		request.setAttribute("re_avg", re_avg);
		
		// setAttribute re_page
		request.setAttribute("re_currentPage", re_currentPage);
		request.setAttribute("re_startPage", re_startPage);
		request.setAttribute("pageBlock", re_pageBlock);
		request.setAttribute("endPage", re_endPage);
		
		// setAttribute q_page
		request.setAttribute("q_currentPage", q_currentPage);
		request.setAttribute("q_startPage", q_startPage);
		request.setAttribute("q_pageBlock", q_pageBlock);
		request.setAttribute("q_endPage", q_endPage);
		
		// setAttribute review
		request.setAttribute("reviewList",reviewList);
<<<<<<< HEAD
		request.setAttribute("re_pageCount", re_pageCount);

		// setAttribute qna
		request.setAttribute("qnaList",qnaList);
		request.setAttribute("q_pageCount", q_pageCount);
		
=======
		request.setAttribute("pageCount", rePageCount);
		
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
		ActionForward forward=new ActionForward();
		forward.setPath("space/spaceInfo.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
