<%@page import="com.space4team.user.db.UserDAO"%>
<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<h1>member/updatePro.jsp</h1>
<%
//폼에서 입력한 내용이 서버에 전달 => request 내장객체에 저장
//request 한글처리
request.setCharacterEncoding("utf-8");
// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장(id, pass, name)
String id=request.getParameter("id");  
String pass=request.getParameter("pass");
String name=request.getParameter("name");
// 수정할 내용을 바구니 객체생성 => 바구니에 저장
UserDTO updateDto=new UserDTO();
updateDto.setUser_id(id);
updateDto.setUser_pass(pass);
updateDto.setUser_name(name);

// MemberDAO 객체생성
UserDAO dao=new UserDAO();
// MemberDTO dto = userCheck(id,pass) 메서드호출
UserDTO dto=dao.userCheck(id, pass);
// 아이디 비밀번호 일치 => 바구니 주소를 가져오기
// 아이디 비밀번호 틀림 => 빈 바구니 주소 가져오기
if(dto!=null){
	// 리턴값없음 updateMember(MemberDTO updateDto) 메서드정의
	// dao.updateMember(updateDto) 메서드호출 
	dao.updateUser(updateDto);
	// 	=> main.jsp 이동
	response.sendRedirect("mypage.jsp");
}else{
//데이터 없으면 false => 아이디 비밀번호 틀림
//=> script   "아이디 비밀번호 틀림" 뒤로이동
 %>
 <script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
 </script>
 <%
}
%>
</body>
</html>