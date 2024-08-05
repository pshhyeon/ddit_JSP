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
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH06</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<%
							request.setCharacterEncoding("UTF-8");
						
							String id= request.getParameter("id");
							String pw = request.getParameter("pw");
							String name = request.getParameter("name");
							String phone1 = request.getParameter("phone1");
							String phone2 = request.getParameter("phone2");
							String phone3 = request.getParameter("phone3");
							String gender = request.getParameter("gender");
							String[] hobby = request.getParameterValues("hobby");
							String comment = request.getParameter("comment");
						%>
						
						아이디 : <%=id %> <br>
						비밀번호 : <%=pw %> <br>
						이름 : <%=name %> <br>
						연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %> <br>
						성별 : <%=gender %> <br>
						취미 : 
							<%
								if(hobby != null) {
									for(int i = 0; i<hobby.length; i++){
										out.println("" + hobby[i]);
									}
								}
							%>
						<br>
						
						<!-- 
							브라우저 스펙에 따라서 wrap="hard" 속성에 따른 출력이 제대로 적용되지 않을 수 있습니다.
							그래서 CSS를 적용해주어야 합니다.
							white-space: pre-wrap; 속성을 적용하여 wrap 속성에 따른 결과 값이
							정상적으로 출력될 수 있도록 합니다.
						 -->
						<p style="white-space: pre-wrap;">가입인사 : <c:out value="<%=comment %>"></c:out> </p> 
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>