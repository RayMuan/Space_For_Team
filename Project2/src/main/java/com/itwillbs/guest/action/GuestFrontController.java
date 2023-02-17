package com.itwillbs.guest.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class GuestFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestFrontController doGet()");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestFrontController doPost()");
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GuestFrontController doProcess()");
		
		
		//---------------------------------------------------------------------
		// 주소 뽑아오기 
		System.out.println("뽑은 가상 주소 :" +request.getServletPath());
		String sPath=request.getServletPath();
		//---------------------------------------------------------------------
		// 가상주소 매핑(비교)
		Action action = null; // 처리할 틀 준비
		ActionForward forward = null; // 이동할 공간 저장
		com.itwillbs.host.action.ActionForward forward1 = null; // 이동할 공간 저장
		
		
		if(sPath.equals("/GuestInsertForm.gu")) {
			// member/join.jsp 이동
			forward = new ActionForward(); //이동할 값 저장
			forward.setPath("guestInsert.jsp"); // 경로 지정
			forward.setRedirect(false); // forward 방식으로 이동 = false
		}else if(sPath.equals("/GuestInsertPro.gu")) {
			action = new GuestInsertPro();// (부모=자식)
			// try는 db작업시만 필요 (자바파일 객체생성)
			try {
				forward= action.execute(request, response); // 이동할 경로 받아오기
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/GuestIdCheck.gu")) {
			action = new GuestIdCheck();// (부모=자식)
			try {
				forward= action.execute(request, response); // 이동할 경로 받아오기
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/Main.gu")) {
			forward = new ActionForward(); //이동할 값 저장
			forward.setPath("project/main.jsp"); // 경로 지정
			forward.setRedirect(false); // forward 방식으로 이동 = false
		}else if(sPath.equals("/HostInsertForm.ho")) {
			// member/join.jsp 이동
			forward1 = new com.itwillbs.host.action.ActionForward(); //이동할 값 저장
			forward1.setPath("hostInsert.jsp"); // 경로 지정
			forward1.setRedirect(false); // forward 방식으로 이동 = false
		}else if(sPath.equals("/Join.gu")) {
			forward = new ActionForward(); //이동할 값 저장
			forward.setPath("join.jsp"); // 경로 지정
			forward.setRedirect(false); // forward 방식으로 이동 = false
		}
		
				
		//---------------------------------------------------------------------
		// 주소 이동
		// 주소값이 있으면 이동 (forward가 주소값)
		if(forward != null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());// sPath에 담아옴
			}else {
				// forward.isRedirect()==false이면
				RequestDispatcher dispatcher = 
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response); // F이면 // forward.getPath()는 이동방식, 주소가안바뀌면서 이동하겠다
			}
		}
		
		
		
		
		
	}//doProcess

}//class
