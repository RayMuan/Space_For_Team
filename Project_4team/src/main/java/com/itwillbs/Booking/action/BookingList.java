package com.itwillbs.Booking.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.Booking.db.BookingDAO;
import com.itwillbs.Booking.db.BookingDTO;


public class BookingList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingList execute()");
		
		request.setCharacterEncoding("utf-8");
		
		BookingDAO dao = new BookingDAO();
		// 한 페이지에 보여줄 글의 갯수(10개로 설정)
		int pageSize = 10;
		// 한 페이지 번호 가져오기 => 페이지번호가 없으면 1p로 설정
		// 페이지번호가 존재시 그 페이지로 이동하도록 하이퍼링크 설정(표 밑에)
		// http://localhost:8080/webProject/board/list.jsp
		String pageNum = request.getParameter("pageNum");

		if(pageNum==null){
			//페이지번호가 없으면 1페이지로 설정
			pageNum = "1";
		}

		// pageNum을 int형으로
		int currentPage = Integer.parseInt(pageNum);

		int startRow  = (currentPage-1) * pageSize + 1;

		int endRow = startRow + pageSize - 1; 

		// ArrayList<BoardDTO> boardList = dao.getBoardList() 매서드호출
		ArrayList<BookingDTO> bookingList = dao.getBookingList(pageSize,startRow);
		
		
		// 한 화면에 보여줄 페이지 개수 설정
		int pageBlock = 10;
		// 시작하는 페이지번호 구하기

		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;  
		// 끝나는 페이지번호 구하기
	
		int endPage = startPage + pageBlock - 1;

		int count = dao.getBookingCount();

		int pageCount = count/pageSize + (count%pageSize==0?0:1); // 삼항연산자
		if (endPage > pageCount){
			endPage = pageCount;
		}
	
		// request 가져온 데이터담기
		
		request.setAttribute("bookingList", bookingList);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);

		
		
		// 이동
		ActionForward forward = new ActionForward();
			forward.setPath("booking/list.jsp");
			forward.setRedirect(false);
		
		return forward;
		
	
	}

}
