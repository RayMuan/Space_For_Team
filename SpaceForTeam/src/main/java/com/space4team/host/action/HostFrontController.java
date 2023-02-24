package com.space4team.host.action;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class HostFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostFrontController doGet()");
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostFrontController doPost()");
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostFrontController doProcess()");
		
		
		System.out.println("뽑은 가상 주소 :" +request.getServletPath());
		String sPath=request.getServletPath();
		Action action = null; 
		ActionForward forward = null; 
		
		if(sPath.equals("/HostInsertForm.ho")) {
			forward = new ActionForward(); 
			forward.setPath("join/hostInsert.jsp"); 
			forward.setRedirect(false);
		}else if(sPath.equals("/Main.ho")) {
			forward = new ActionForward();
			forward.setPath("join/main.jsp");
			forward.setRedirect(false); 
		}else if(sPath.equals("/HostInsertPro.ho")) {
			action = new HostInsertPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostIdCheck.ho")) {
			action = new HostIdCheck();
			try {
				forward= action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostEmailCheck.ho")) {
			action = new HostEmailCheck();
			try {
				forward= action.execute(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostInsertForm.us")) {
			forward = new ActionForward(); 
			forward.setPath("join/hostInsert.jsp"); 
			forward.setRedirect(false);
		}else if(sPath.equals("/Join.us")) {
			forward = new ActionForward();
			forward.setPath("join/join.jsp"); 
			forward.setRedirect(false); 
		}else if(sPath.equals("/HostInsertForm.ho")) {
			forward = new  ActionForward(); 
			forward.setPath("join/hostInsert.jsp"); 
			forward.setRedirect(false);
		}else if(sPath.equals("/HostLoginForm.ho")) {
			forward=new ActionForward();
			forward.setPath("host/hostLogin.jsp");
			forward.setRedirect(false);
		}else if(sPath.equals("/HostLoginPro.ho")) {
			action = new HostLoginPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostLogout.ho")) {
			action=new HostLogout();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(sPath.equals("/HostMypage.ho")) {
			forward=new ActionForward();
			forward.setPath("host/hostmypage.jsp");
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

