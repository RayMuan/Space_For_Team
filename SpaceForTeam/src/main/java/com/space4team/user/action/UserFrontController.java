package com.space4team.user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserFrontController doGet()");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserFrontController doPost()");
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserFrontController doProcess()");
		
		
		System.out.println("뽑은 가상 주소 :" +request.getServletPath());
		String sPath=request.getServletPath();
		Action action = null; 
		ActionForward forward = null;
		
		
		if(sPath.equals("/UserInsertForm.us")) {
			forward = new ActionForward(); 
			forward.setPath("join/userInsert.jsp");
			forward.setRedirect(false);
		}else if(sPath.equals("/UserInsertPro.us")) {
			action = new UserInsertPro();
			try {
				forward= action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/UserIdCheck.us")) {
			action = new UserIdCheck();
			try {
				forward= action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/UserEmailCheck.us")) {
			action = new UserEmailCheck();
			try {
				forward= action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/Join.us")) {
			forward = new ActionForward(); 
			forward.setPath("join/join.jsp"); 
			forward.setRedirect(false); 
		
		}else if(sPath.equals("/UserLoginForm.us")) {
			forward=new ActionForward();
			forward.setPath("user/contact.jsp");
			forward.setRedirect(false);
		
		}else if(sPath.equals("/UserLoginPro.us")) {
			action = new UserLoginPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/UserLogout.us")) {
			action=new UserLogout();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/GuestMain.us")) {
			forward=new ActionForward();
			forward.setPath("join/guest_main.jsp");
			forward.setRedirect(false);
		}else if(sPath.equals("/Main.us")) {
			forward=new ActionForward();
			forward.setPath("join/main.jsp");
			forward.setRedirect(false);
		}
	
		
		
		
		
		
				
		if(forward != null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = 
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}//doProcess

}//class
//>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
