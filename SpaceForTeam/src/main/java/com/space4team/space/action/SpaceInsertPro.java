package com.space4team.space.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.space4team.host.db.HostDAO;
import com.space4team.host.db.HostDTO;
import com.space4team.space.db.SpaceDAO;
import com.space4team.space.db.SpaceDTO;

public class SpaceInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("SpaceInsertPro execute()");
		
//		request 한글처리
//		request.setCharacterEncoding("utf-8");
		
		String uploadPath = request.getRealPath("/upload");
		System.out.println(uploadPath);
		// 3. 파일크기
		int maxSize = 10*1024*1024; // 10메가임
		// 4. 한글처리
		// "utf-8"쓸거임
		// 5. 파일이름 동일할때 파일이름 변경작업
		//new DefaultFileRenamePolicy()라는 프로그램이 cos.jar안에 있음 
		
		MultipartRequest multi = new MultipartRequest
		(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		//경로에 들어가보면 파일이 첨부되어 있음 ! 




//		request 태그이름에 해당하는 값을 가져오기 =>변수에 저장
//		id, pass, name의 변수는 jsp에서 들고감 자바로 !! 
		String name = multi.getParameter("name");
		String address = multi.getParameter("roadFullAddr");
		String bill = multi.getParameter("bill");
		String sido = multi.getParameter("siNm");
		String gungu = multi.getParameter("sggNm");
		String memo = multi.getParameter("memo");
		String max = multi.getParameter("max");
		
//		추가 => 업로드된 파일이름 정보 ("file"은 fWriteForm에 있는 첨부파일의 "file"의미)
		String file = multi.getFilesystemName("file");
		
		

		String[] option = multi.getParameterValues("option");
		String s_option = "";
  	 
		for (int i = 0; i < option.length; i++){
			s_option += option[i] + " ";
		}

//		가입날짜 => 시스템날짜
//		java.sql.Timestamp 자바내장객체 => 날짜
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		SpaceDTO dto = new SpaceDTO();
//		기억장소에 id, pass, name, date값을 저장함 
		dto.setS_name(name);
		dto.setS_address(address);
		dto.setS_bill(bill);
		dto.setS_max(max);
		dto.setS_sido(sido);
		dto.setS_gungu(gungu);
		dto.setS_memo(memo);
		dto.setS_file(file);
		dto.setS_opt(s_option);
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		HostDAO mdao = new HostDAO();
		HostDTO mdto = mdao.gethost(id);
		System.out.println(mdto.getH_id());
		
		SpaceDAO dao = new SpaceDAO();
		System.out.println("SpaceDAO 주소 : " + dao);
//		dao.insertMember(id, pass, name, date);  변수 대신 MemberDTO의 주소값을 전달할거임
		dao.insertSpace(dto, mdto);
		
//		memberLoginForm.me로 이동정보를 담아서 갈거임 
//		actionForward(이동정보를 담는 객체)를 생성함 ! 
//		여기에 setPath, setRedirect에 이동정보를 담아서 그 객체를 들고 호출한 곳으로 돌아감. return forward 
		ActionForward forward = new ActionForward();
		forward.setPath("host/hostmain.jsp");
		forward.setRedirect(true);
		
		return forward;

		
	}

}
