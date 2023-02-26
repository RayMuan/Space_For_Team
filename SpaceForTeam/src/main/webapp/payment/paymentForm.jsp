<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="payment.jsp" method="post">
<!-- <input type="hidden" name="num" value="num">     -->
<%-- <input type="hidden" name="totalPrice" value="<%=dto.gettotalprice()%>">     --%>
 
<input type="text" name="num">num <br>
<input type="number" name="totalPrice">totalPrice<br>
<input type="submit" name="submit" value="결제요청">

</form>
</body>
</html>