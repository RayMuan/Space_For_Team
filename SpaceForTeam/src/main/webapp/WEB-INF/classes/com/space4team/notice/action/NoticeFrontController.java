package com.space4team.notice.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeFronController doGet()");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeFrontController doPost()");
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("NoticeFrontController doProcess()");


		String sPath = request.getServletPath();
		System.out.println("뽑은 가상주소 : " + request.getServletPath());
		
		Action action = null;
		ActionForward forward = null;
		
		if(sPath.equals("/NoticeWriteForm.no")) {
			
			forward = new ActionForward();
			forward.setPath("community/noticewrite.jsp");
			forward.setRedirect(false);
		
		
		} else if(sPath.equals("/NoticeWritePro.no")) {
			
			action = new NoticeWritePro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			} else if(sPath.equals("/NoticeList.no")) {
			
				System.out.println("/NoticeList.no 까지 호출함 ");
				action = new NoticeList();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			} else if (sPath.equals("/NoticeDelete.no")) {
				System.out.println("noticeDeletePro.no 실행");
				action = new NoticeDelete();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			} else if(sPath.equals("/NoticeUpdateForm.no")) {
				System.out.println("noticeUpdateForm 실행");
				action = new NoticeUpdateForm();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			else if(sPath.equals("/NoticeUpdatePro.no")) {
				System.out.println("noticeUpdatePro 실행");
				action = new NoticeUpdatePro();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
//		forward(이동정보 담은 객체에 뭔가 있다면 ! == 이동정보가 있다면 )
		if(forward != null) {
//			이동방식 비교
			if(forward.isRedirect() == true) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
//				request, response정보를 들고감! 
				dispatcher.forward(request, response);}
			} // if(forward != null) 괄호 

	}	// doProcess()
} 	// class{}