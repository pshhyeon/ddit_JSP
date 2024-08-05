<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
</head>
<body>

	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a href="./welcome.jsp" class="navbar-brand">Home</a>
			</div>
		</div>
	</nav>
	<%!
		String greeting = "Book Market Mall";
		String tagline = "Welcome to Book Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	
	<main role="main">
		<div class="container">
			<div class="text-center">
				<h3>
					<%=tagline %>
				</h3>
			</div>
		</div>
	</main>
	
	<footer class="container">
	</footer>

</body>
</html>










