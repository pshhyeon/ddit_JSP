<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	StringBuffer sb = new StringBuffer();
	sb.append("이름 : " + request.getParameter("name") + "<br>");
	sb.append("주소 : " + request.getParameter("addr") + "<br>");
	sb.append("이메일 : " + request.getParameter("email") + "<br>");
	out.println(sb); 
	// toString() 메서드를 사용하지 않아도 되는 이유는? 
	//이미 sb라는 StringBuffer객체에 문자열 값을 가지고 있기 때문에 toString()을 사용하여 문자열로 변환할 필요가 없다.
%>
</body>
</html>