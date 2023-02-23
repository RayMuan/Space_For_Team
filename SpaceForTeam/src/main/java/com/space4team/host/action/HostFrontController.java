package com.space4team.host.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.user.action.UserUpdateForm;
import com.space4team.user.action.UserUpdatePro;

public class HostFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostFrontController doGet()");
		doProcess(request, response);
	} //doGet

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostFrontController doPost()");
		doProcess(request, response);
	} //doPost
	
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HostFrontController doProcess()");
		
		System.out.println("뽑은 가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		ActionForward forward=null;
		Action action=null;
		
		if(sPath.equals("/HostInsertForm.ho")) {
			
			forward = new ActionForward();
			forward.setPath("main/main.jsp");
			forward.setRedirect(false);			
			
		} else if(sPath.equals("/HostInsertPro.ho")) {
			action = new HostInsertPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
		}
		}else if(sPath.equals("/HostLoginForm.ho")) {
			forward=new ActionForward();
			forward.setPath("host/hostLogin.html");
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
		}else if (sPath.equals("/HostIdCheck.ho")) {
			action=new HostEmailCheck();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostUpdateForm.ho")) {
			action=new HostUpdateForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostUpdatePro.ho")) {
			action=new HostUpdatePro();
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
