package com.space4team.review.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.review.db.ReviewDAO;
import com.space4team.review.db.ReviewDTO;
import com.space4team.user.db.UserDAO;
import com.space4team.user.db.UserDTO;

public class ReviewJson implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ReviewJson execute()");
		ReviewDAO redao=new ReviewDAO();
		UserDAO udao = new UserDAO();
		HostDAO hdao = new HostDAO();
		int s_num=Integer.parseInt(request.getParameter("s_num"));
		
		ArrayList<ReviewDTO> ReviewList=redao.getReviewList(s_num, 1, 5);
		
		JSONArray arr=new JSONArray();
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
		for(int i=0; i<ReviewList.size(); i++) {
			ReviewDTO redto= ReviewList.get(i);
			UserDTO udto = udao.getUser(redto.getUser_num());
			HostDTO hdto = hdao.getHost(s_num);
			
			//한개의 글 오브젝트가 dto 역할
			JSONObject object=new JSONObject();
			object.put("user_id", udto.getUser_id());
			object.put("re_date", dateFormat.format(redto.getRe_date()));
			object.put("re_point", redto.getRe_point());
			object.put("re_content", redto.getRe_content());
			object.put("re_content", redto.getRe_content());
			object.put("h_name", hdto.getH_name());
			object.put("re_reply", dateFormat.format(redto.getRe_reply()));
			
			// 배열 한칸에 저장
			arr.add(object);
		}
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(arr);
			out.close();
			return null;
	}
}
