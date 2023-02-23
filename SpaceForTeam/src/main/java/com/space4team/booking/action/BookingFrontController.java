package com.space4team.booking.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class BookingFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("BookingFrontController doGet()");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BookingFrontController doPost()");
		doProcess(request,response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BookingFrontController doProcess()");
		String sPath = request.getServletPath();
		System.out.println("뽑아낸 가상주소 :" + sPath);
		
		ActionForward forward = null;
		Action action =null;

		if(sPath.equals("/BookingInsertForm.bk")) {
<<<<<<< HEAD
			System.out.println("/BookingInsertForm.bk  booking/insertForm.jsp");
=======
			System.out.println("/BookingInsertForm.bk");
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
			forward = new ActionForward();
			forward.setPath("booking/insertForm.jsp");
			forward.setRedirect(false);

		} else if(sPath.equals("/BookingInsertPro.bk")) {
			System.out.println("/BookingInsertPro.bk");
			action = new BookingInsertPro();
			try {
				forward = action.execute(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		} else if(sPath.equals("/BookingContent.bk")) {
			System.out.println("/BookingContent.bk");
			action = new BookingContent();
			try {
				forward = action.execute(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BookingList.bk")) {
			action = new BookingList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(sPath.equals("/BookingContent.bk")) {
			action = new BookingContent();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/BookingUpdateForm.bk")) {
			action = new BookingUpdateForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(sPath.equals("/BookingUpdatePro.bk")) {
			action = new BookingUpdatePro();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}		
		} else if(sPath.equals("/BookingDeletePro.bk")) {
			action = new BookingDeletePro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		
		
		
	
		
		
		if(forward != null) {
			if(forward.isRedirect()==true) {
//				forward.isRedirect()==true
				response.sendRedirect(forward.getPath());
			}else {
//				forward.isRedirect()==false
				RequestDispatcher dispatcher=
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} // 이동정보
		
		
	} //doProcess()
	
}
