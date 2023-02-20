<%@page import="com.space4team.space.db.UserDAO"%>
<%@page import="com.space4team.space.db.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// space/loginPro.jsp
// 폼에서 입력한 내용을 서버에 전달하면 request내장객체 저장
// request에 저장된 email,pass 파라미터값을 가져와서 변수 저장
String email=request.getParameter("email");
String pass=request.getParameter("pass");

//  SpaceDAO 객체생성
HostDAO dao=new HostDAO();
// 리턴받은값을 저장하는 변수 SpaceDTO dto = userCheck(email,pass) 메서드호출
HostDTO dto=dao.userCheck(email, pass);
// dto null 아니면  아이디 비밀번호 일치 => 페이지 상관없이 값을 유지 세션값생성
//                                 => "이름",값  "id",id
//                                 => main폴더 main.jsp 이동
// dto null 이면 아이디 비밀번호 틀림 => 자바스크립트 "아이디 비밀번호 틀림"
//                                            뒤로이동 
if(dto!=null){
	//아이디 비밀번호 일치
	session.setAttribute("email", email);
	response.sendRedirect("../index.html");
}else{
	//아이디 비밀번호 틀림
%>
    <script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
    </script>
    <%
}
%>