<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">내장객체</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH05</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
            <!-- 
            	넘겨받은 모든 데이터를 아래와 같은 형식으로 출력해주세요.
            	
            	[결과]
            	아이디 : a001
            	비밀번호 : 1234
            	이름 : 홍길동
            	핸드폰번호 : 010-1234-1234
            	성별 : 남자
            	취미 : 운동 영화 독서
            	가입인사 : 
            	대덕인재개발원 403호 000입니다!
            	반갑습니다! 잘부탁드립니다!
            	
            	아래 두가지 방법 모두로 출력해주세요.
            	- 스크립트 태그를 이용한 방법으로 출력해주세요.
            	- JSTL을 이용한 방법으로 출력해주세요.
             -->
             <%
             	request.setCharacterEncoding("UTF-8");
             
             	String id = request.getParameter("id");
             	String pw = request.getParameter("pw");
             	String name = request.getParameter("name");
             	String phone1 = request.getParameter("phone1");
             	String phone2 = request.getParameter("phone2");
             	String phone3 = request.getParameter("phone3");
             	String phone = phone1 + "-" + phone2 + "-" + phone3;
             	String gender = request.getParameter("gender");
             	if(gender.equals("M")){
             		gender = "남자";
             	} else {
             		gender = "여자";
             	}
             	String[] hobbyArr  = request.getParameterValues("hobby");
             	String hobby = "";
             	for(int i = 0; i<hobbyArr.length; i++){
             		if(hobbyArr[i].equals("power")) hobby += "운동 ";
             		if(hobbyArr[i].equals("book")) hobby += "독서 ";
             		if(hobbyArr[i].equals("movie")) hobby += "영화 ";
             		if(hobbyArr[i].equals("music")) hobby += "음악 ";
             	}
             	String comment  = request.getParameter("comment");
             	
             	out.println("<p>스크립틀릿을 이용하는 방법</p><br>");
             	out.println("<p>아이디 : " + id + "</p><br>");
             	out.println("<p>비밀번호 : " + pw + "</p><br>");
             	out.println("<p>이름 : " + name + "</p><br>");
             	out.println("<p>전화번호 : " + phone + "</p><br>");
             	out.println("<p>성별 : " + gender + "</p><br>");
             	out.println("<p>취미 : " + hobby + "</p><br>");
				out.println("<p style='white-space: pre-wrap;'>가입인사 : <br>" + comment + "</p>");             	
             %>
             
             <br>
             <hr>
             <br>
             
             <c:set value="<%=id %>" var="id" />
             <c:set value="<%=pw %>" var="pw" />
             <c:set value="<%=name %>" var="name" />
             <c:set value="<%=phone %>" var="phone" />
             <c:set value="<%=gender %>" var="gender" />
             <c:set value="<%=hobby %>" var="hobby" />
             <c:set value="<%=comment %>" var="comment" />
             
             <p>JSTL을 이용하는 방법</p><br>
             <p>아이디 : <c:out value="${id}" /></p><br>
             <p>비밀번호 : <c:out value="${pw}" /></p><br>
             <p>이름 : <c:out value="${name}" /></p><br>
             <p>전화번호 : <c:out value="${phone}" /></p><br>
             <p>성별 : <c:out value="${gender}" /></p><br>
             <p>취미 : <c:out value="${hobby}" /></p><br>
             <p style="white-space: pre-wrap;">가입인사 : <br> <c:out value="${comment}" /></p><br>
             
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>