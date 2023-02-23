package com.space4team.booking.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.booking.db.BookingDAO;
import com.space4team.booking.db.BookingDTO;



public class BookingUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BookingUpdatePro execute()");
		
//		<tr><td>예약일자</td>
//	    <td><input type="date" name ="bk_usedate" value="<%=dto.getBk_usedate() %>"></td></tr>
//	<tr><td>사용인원수</td>
//	    <td><input type="number" name ="bk_usercount" value="<%=dto.getBk_usercount() %>"></td></tr>
//	<tr><td>시작시간</td>
//	    <td><input type="number" name ="bk_starttime" value="<%=dto.getBk_starttime() %>"></td></tr>
//	 <tr><td>종료시간</td>
//	    <td><input type="number" name ="bk_endtime" value="<%=dto.getBk_endtime() %>"></td></tr>
		
		request.setCharacterEncoding("utf-8");
		String bk_usedate = request.getParameter("bk_usedate");
		int bk_usercount = Integer.parseInt("bk_usercount");
		int bk_starttime = Integer.parseInt("bk_starttime");
		int bk_endtime = Integer.parseInt("bk_endtime");
		

		// BookingDTO 객체생성 + 바구니생성(set매서드)
		BookingDTO dto = new BookingDTO();
		dto.setBk_usedate(bk_usedate);
		dto.setBk_usercount(bk_usercount);
		dto.setBk_starttime(bk_starttime);
		dto.setBk_endtime(bk_endtime);
		// BookingDTO 객체생성
		BookingDAO dao = new BookingDAO();
		// 리턴할형 없음 updateBooking(BookingDTO dto) 매서드 정의
		// dao.updateBooking(dto)
		dao.updateBooking(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("BookingList.bk");
		forward.setRedirect(true);
		return forward;
	}
		

}
