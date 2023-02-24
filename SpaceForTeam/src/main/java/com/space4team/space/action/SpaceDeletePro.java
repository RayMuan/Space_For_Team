package com.space4team.space.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.space.action.ActionForward;
import com.space4team.space.db.SpaceDAO;

public class SpaceDeletePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceDeletePro execute()실행");
		
		String uploadPath = request.getRealPath("/upload");
		System.out.println(uploadPath);
		int maxSize = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest
				(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		 
		int num = Integer.parseInt(multi.getParameter("num"));
		System.out.println(num);
		
		String id=multi.getParameter("id");
		String pass = multi.getParameter("pass");
		
		HostDAO mdao = new HostDAO();
		HostDTO mdto = mdao.userCheck(id, pass);
		
		SpaceDAO dao = new SpaceDAO();
		ActionForward forward = null;
		
		
		
		if(mdto!=null) {
			//아이디 비밀번호 일치
			dao.deleteSpace(num);
			
			forward = new ActionForward();
			forward.setPath("SpaceList.sp");
			forward.setRedirect(true);
			
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			
		}return forward;
		
	}


}