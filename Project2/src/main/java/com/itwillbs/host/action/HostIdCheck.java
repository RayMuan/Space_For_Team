package com.itwillbs.host.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.host.db.hostInsertDAO;
import com.itwillbs.host.db.hostInsertDTO;



public class HostIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.err.println("HostIdCheck execute()");
		String id= request.getParameter("id");
		// request id파라미터 가져오기
		// MemberDAO 객체 생성
		// MemberDTO dto= getMember() 메서드 호출
		// 결과값 result변수에 담기
		// dto null이 아니면 아이디 있음, 아이디 중복
		// dto null이면 아이디 없음, 아이디 사용가능
		// 자바에서 웹형태로 출력 
		
		// MemberDAO 객체생성
		hostInsertDAO dao= new hostInsertDAO();
		// getMember() 메서드 호출
		// id값을 들고 갈 것
		hostInsertDTO dto = dao.getMember(id);

		// MemberDTO가 리턴 값
		String result="";
		// 결과를 result 변수에 담을 것
		if(dto != null){
		// dto가 !=null 이 아니면 아이디 있음, 아이디 중복
			result="아이디 중복";
		}else{
		// dto가 ==null 이면 아이디 없음, 아이디 사용 가능
			result = "아이디 사용 가능";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();
	
		return null;
	}

}
