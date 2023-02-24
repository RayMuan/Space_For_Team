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
		
<<<<<<< HEAD
		if(sPath.equals("/SpaceInfoPro.sp")) {
			
=======
		if(sPath.equals("/SpaceInfo.sp")) {
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
			action=new SpaceInfoPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
<<<<<<< HEAD
		
		} else if(sPath.equals("/SpaceInsertForm.sp")) {
			System.out.println("spaceinsertForm.sp 실행전");
			
			action = new SpaceInsertForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}  else if(sPath.equals("/SpaceInsertPro.sp")) {
			System.out.println("spaceInsertPRo.sp 실행");
			
			action = new SpaceInsertPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		
		} else if(sPath.equals("/SpaceList.sp")) {
			
			action = new SpaceList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if(sPath.equals("/SpaceUpdateForm.sp")) {
			
			action = new SpaceUpdateForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if(sPath.equals("/SpaceUpdatePro.sp")) {
			System.out.println("spaceupdatepro 실행");
			
			action = new SpaceUpdatePro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(sPath.equals("/SpaceDeleteForm.sp")) {
			System.out.println("spacedelteform 까지옴");
			
			action = new SpaceDeleteForm();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(sPath.equals("/SpaceDeletePro.sp")) {
			
			action = new SpaceDeletePro();
			try {
				forward = action.execute(request, response);
=======
		}else if(sPath.equals("/MainPro.sp")) {
			action=new MainPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/UserPro.sp")) {
			action=new UserPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/HostPro.sp")) {
			action=new HostPro();
			try {
				forward=action.execute(request, response);
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git
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