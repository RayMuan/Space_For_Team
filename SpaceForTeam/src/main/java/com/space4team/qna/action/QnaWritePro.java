package com.space4team.qna.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.qna.db.QnaDAO;
import com.space4team.qna.db.QnaDTO;
import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class QnaWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("QnaWritePro execute()");
			request.setCharacterEncoding("utf-8");
			
			int s_num=Integer.parseInt(request.getParameter("num"));
			int job=Integer.parseInt(request.getParameter("job"));
			int h_num=Integer.parseInt(request.getParameter("h_num"));
			System.out.println(s_num);
			
			HttpSession session=request.getSession();
			QnaDTO qdto=new QnaDTO();
			QnaDAO qdao=new QnaDAO();
				
			if(job==1) {
				String user_id=(String)session.getAttribute("id");
				session.setAttribute("id", user_id);
		
				UserDAO dao=new UserDAO();
				UserDTO dto=dao.getUserInfo(user_id);
				Timestamp q_date=new Timestamp(System.currentTimeMillis());
				String q_content=request.getParameter("q_content");
				
				System.out.println(user_id);
				
				int user_num=dto.getUser_num();
				
				qdto.setUser_num(user_num);
				qdto.setQ_content(q_content);
				qdto.setQ_date(q_date);
				qdto.setQ_s_num(s_num);
			}else {
				String host_id=(String)session.getAttribute("id");
				session.setAttribute("id", host_id);
				

				String q_recontent=request.getParameter("q_recontent");
				Timestamp q_redate=new Timestamp(System.currentTimeMillis());
				
				qdto.setQ_recontent(q_recontent);
				qdto.setQ_redate(q_redate);
				qdto.setH_num(h_num);
			}
			
			qdao.insertQna(qdto);
	
			ActionForward forward=new ActionForward();
			forward.setPath("SpaceInfoPro.sp?num="+s_num);
			forward.setRedirect(false);
			return forward;
	}
}
