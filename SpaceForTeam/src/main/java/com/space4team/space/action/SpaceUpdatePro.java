package com.space4team.space.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class SpaceUpdatePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SpaceUpdatePro execute() 실행");
		
//		객체생성 (생성자에 5가지 작성해야함)
//		생성자 1. request
//			 2. 웹서버에 업로드 폴더위치 => 폴더만들어야함 (webapp에 upload라는 폴더만들거임)
			String uploadPath = request.getRealPath("/upload");
			System.out.println(uploadPath);
//			 3. 파일크기
			int maxSize = 10*1024*1024; // 10메가임
//			 4. 한글처리
//			 "utf-8"쓸거임
//			 5. 파일이름 동일할때 파일이A름 변경작업
//			new DefaultFileRenamePolicy()라는 프로그램이 cos.jar안에 있음 
			
			MultipartRequest multi = new MultipartRequest
			(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

//			s_num 임 
			int num = Integer.parseInt(multi.getParameter("num"));
			System.out.println(num);
			String name = multi.getParameter("name");
			String address = multi.getParameter("roadFullAddr");
			String bill = multi.getParameter("bill");
			String sido = multi.getParameter("siNm");
			String gungu = multi.getParameter("sggNm");
			String memo = multi.getParameter("memo");
			String max = multi.getParameter("max");
			String file = multi.getFilesystemName("file");
			if(file == null) {
				file = multi.getParameter("oldfile");
			}
			
			String[] option = multi.getParameterValues("option");
			String s_option = "";
	  	 
			for (int i = 0; i < option.length; i++){
				s_option += option[i] + " ";
			}
			
			SpaceDAO dao = new SpaceDAO();
			SpaceDTO dto = new SpaceDTO();
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			HostDAO mdao = new HostDAO();
			HostDTO mdto = mdao.gethost(id);
			System.out.println(mdto.getH_id());
			System.out.println(mdto.getH_num());
			
			dto.setS_num(num);
			dto.setS_name(name);
			dto.setS_address(address);
			dto.setS_bill(bill);
			dto.setS_sido(sido);
			dto.setS_gungu(gungu);
			dto.setS_max(max);
			dto.setS_memo(memo);
			dto.setS_file(file);
			dto.setS_option(s_option);
			
			dao.updateSpace(dto, mdto);
		

		
		ActionForward forward = new ActionForward();
		forward.setPath("SpaceList.sp");
		forward.setRedirect(true);		
		return forward;
	}

}
