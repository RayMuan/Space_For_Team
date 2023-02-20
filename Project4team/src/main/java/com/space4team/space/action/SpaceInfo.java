package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class SpaceInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		UserDAO dao=new UserDAO();
		UserDTO dto=dao.getMember(id);
		
		// dto 정보 들고가기
		request.setAttribute("dto", dto);
		
		// member/info.jsp 주소 변경없이(false) 이동
		ActionForward forward=new ActionForward();
		forward.setPath("space/info.jsp");
		forward.setRedirect(false);
		return forward;

	}

}
