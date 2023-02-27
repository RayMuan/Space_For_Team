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
			HttpSession session=request.getSession();
			
			
			int s_num=Integer.parseInt(request.getParameter("s_num"));
			String id=(String)session.getAttribute("id");
			int job=(Integer)session.getAttribute("job");
			
			QnaDTO qdto=new QnaDTO();
	
			if(job==1) {
				UserDAO dao=new UserDAO();
				UserDTO dto=dao.getUserInfo(id);

				int user_num=dto.getUser_num();
				String q_content=request.getParameter("q_content");
				Timestamp q_date=new Timestamp(System.currentTimeMillis());
				
				qdto.setQ_s_num(s_num);
				qdto.setUser_num(user_num);
				qdto.setQ_content(q_content);
				qdto.setQ_date(q_date);
			}else if(job==2) {
				// host

				String q_recontent=request.getParameter("q_recontent");

				qdto.setQ_recontent(q_recontent);
			}
			
			QnaDAO qdao=new QnaDAO();
			qdao.insertQna(qdto);
			
			ActionForward forward=new ActionForward();
			forward.setPath("SpaceInfoPro.sp?s_num="+s_num);
			forward.setRedirect(false);
			return forward;
	}
}
