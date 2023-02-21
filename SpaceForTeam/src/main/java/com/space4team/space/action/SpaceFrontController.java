package com.space4team.space.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SpaceFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SpaceFrontController doGet()");
		doProcess(request, response);
	} //doGet

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SpaceFrontController doPost()");
		doProcess(request, response);
	} //doPost
	
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SpaceFrontController doProcess()");
		
		System.out.println("뽑은 가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		ActionForward forward=null;
		Action action=null;
		
		if(sPath.equals("/SpaceInfoPro.sp")) {
			action=new SpaceInfoPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/SpaceLoginForm.sp")) {
			forward=new ActionForward();
			forward.setPath("space/login.jsp");
			forward.setRedirect(false);
		}else if(sPath.equals("/SpaceLoginPro.sp")) {
			action = new SpaceLoginPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/SpaceLogout.sp")) {
			action=new SpaceLogout();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (sPath.equals("/SpaceIdCheck.sp")) {
			action=new SpaceIdCheck();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		// 연결
		if(forward != null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
		
	}// doProcess
	
}// class
