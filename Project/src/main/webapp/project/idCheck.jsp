<%@page import="insert.InsertDTO"%>
<%@page import="insert.InsertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 출력 결과만 가져올 것이기 때문에 태그가 있으면 안됨
// member/idCheck.jsp?id=kim <파라미터값이 이렇게 넘어올 것임>
String id= request.getParameter("id");

// MemberDAO 객체생성
InsertDAO dao= new InsertDAO();
// getMember() 메서드 호출
// id값을 들고 갈 것
InsertDTO dto = dao.getMember(id);

// MemberDTO가 리턴 값
String result="";
// 결과를 result 변수에 담을 것
if(dto != null){
// dto가 !=null 이 아니면 아이디 있음, 아이디 중복
	result="아이디 중복";
}else{
// dto가 ==null 이면 아이디 없음, 아이디 사용 가능
	result = "아이디 사용 가능";
}
// result 출력
%>
<%=result %>


	