package com.space4team.space.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.action.ActionForward;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;


public class SpaceInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
System.out.println("SpaceInsertPro execute()");
		
//		request 한글처리
		request.setCharacterEncoding("utf-8");
//		request 태그이름에 해당하는 값을 가져오기 =>변수에 저장
//		id, pass, name의 변수는 jsp에서 들고감 자바로 !! 
		String S_name = request.getParameter("name");
		String S_address = request.getParameter("address");
		String S_bill = request.getParameter("bill");
		String S_sido = request.getParameter("sido");
		String S_sigungu = request.getParameter("gungu");
		String S_memo = request.getParameter("memo");
		

//		가입날짜 => 시스템날짜
//		java.sql.Timestamp 자바내장객체 => 날짜
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		SpaceDTO dto = new SpaceDTO();
//		기억장소에 id, pass, name, date값을 저장함 
		dto.setS_name(S_name);
		dto.setS_address(S_address);
		dto.setS_bill(S_bill);
		dto.setS_sido(S_sido);
		dto.setS_sigungu(S_sigungu);
		dto.setS_memo(S_memo);
		
		SpaceDAO dao = new SpaceDAO();
		System.out.println("SpaceDAO 주소 : " + dao);
//		dao.insertMember(id, pass, name, date);  변수 대신 MemberDTO의 주소값을 전달할거임
		dao.insertSpace(dto);
		
//		memberLoginForm.me로 이동정보를 담아서 갈거임 
//		actionForward(이동정보를 담는 객체)를 생성함 ! 
//		여기에 setPath, setRedirect에 이동정보를 담아서 그 객체를 들고 호출한 곳으로 돌아감. return forward 
		ActionForward forward = new ActionForward();
		forward.setPath("main.html");
		forward.setRedirect(true);
		
		return forward;

		
	}

}
