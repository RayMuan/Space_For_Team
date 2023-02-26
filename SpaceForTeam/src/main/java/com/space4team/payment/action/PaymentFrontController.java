package com.space4team.payment.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





public class PaymentFrontController extends HttpServlet{

	@Override // 알트+쉬프트+s + v  => doGet , doPost
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doGet()");
		doProcess(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doPost()");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doProcess()"); 
		
		
		System.out.println("뽑은 가상주소 : " + request.getServletPath());
		String sPath = request.getServletPath();
		
		
		Action action = null;
		ActionForward forward = null; 
		if(sPath.equals("/PaymentPro.pa")) {
			action=new PaymentPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			// board/writeForm.jsp 이동
//			forward = new ActionForward();
//			forward.setPath("payment/paymentForm.jsp");
//			forward.setRedirect(false);
			
		}
		
		// 이동
		if (forward != null) {
			if (forward.isRedirect() == true) {
				response.sendRedirect(forward.getPath());
				} else {
		// forward.isRedirect()==false
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);

						}

					}
			
			
				
			
		}//doProcess
} // PaymentFrontController
	


