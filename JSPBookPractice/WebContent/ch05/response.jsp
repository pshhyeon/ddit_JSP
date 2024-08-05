<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% response.setIntHeader("refresh", 5); %>
<p>현재 시간은 <%=Calendar.getInstance().getTime() %></p>
<a href="response_data.jsp">Google 홈페이지로 이동하기</a>

</body>
</html>