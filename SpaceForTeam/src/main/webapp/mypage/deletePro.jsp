<%@page import="com.space4team.user.db.UserDTO"%>
<%@page import="com.space4team.user.db.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage/deletePro.jsp</title>
</head>
<body>
<h1>mypage/deletePro.jsp</h1>
<%
String id=request.getParameter("id"); 
String pass=request.getParameter("pass");
UserDAO dao=new UserDAO();
UserDTO dto=dao.userCheck(id, pass);

if(dto != null){
	dao.deleteUser(id);
    session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
    
%>
<script type="text/javascript">
    alert("탈퇴되었습니다.");
    response.sendRedirect("member/login.jsp");
    </script>

<%    
 // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
}else{
%>
<script type="text/javascript">
    alert("비밀번호가 맞지 않습니다.");
    history.go(-1);
</script>
<%
} 
%>
</body>
</html>