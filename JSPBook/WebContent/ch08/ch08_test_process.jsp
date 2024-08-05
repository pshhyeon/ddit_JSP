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
		request.setCharacterEncoding("utf-8");
		String quest1 = request.getParameter("quest1");
		String quest2 = request.getParameter("quest2");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String phone = request.getParameter("mem_phone");
	%>
	
	<p>quest1 = <%=quest1 %></p>
	<p>quest2 = <%=quest2 %></p>
	<p>mem_id = <%=mem_id %></p>
	<p>mem_pw = <%=mem_pw %></p>
	<p>mem_name = <%=mem_name %></p>
	<p>phone = <%=phone %></p>
	
</body>
</html>