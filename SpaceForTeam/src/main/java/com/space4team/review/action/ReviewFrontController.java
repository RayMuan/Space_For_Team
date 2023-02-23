package com.space4team.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.space4team.space.action.SpaceInfoPro;



public class ReviewFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewFrontController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewFrontController doPost()");
		doProcess(request, response);		
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReviewFrontController doProcess()");
		
		System.out.println("뽑은 가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		ActionForward forward=null;
		Action action=null;
		
		if(sPath.equals("/ReviewWritePro.re")) {
			action=new ReviewWritePro();
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
