package com.space4team.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class UserUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("UserUpdateForm execute()");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); 
		
		UserDAO dao=new UserDAO();
		UserDTO dto=dao.getUser(id);
		
		request.setAttribute("dto", dto);

		ActionForward forward=new ActionForward();
		forward.setPath("userupdate.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
