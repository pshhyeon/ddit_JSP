<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                        <li>CH17</li>
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
							String num = request.getParameter("num");
						%>
						<c:set value="<%=num %>" var="number" />
						
						<!-- 
							c:when 태그를 사용하여 조건문 number % 2 == 0이 참이면 number 변수 값을 출력하도록 out 태그를 작성
							c:when 태그를 사용하여 조건문 number % 2 == 0이 거짓이면 number 변수 값을 출력하도록 out 태그를 작성
							이때, 거짓 조건은 otherwise를 활용하여 적용
							
							c:choose 안에서 주석을 달게되면 구문 에러가 발생할 수 있다.
							주석은 c:choose위나 바깥에서 다는게 좋다!
						 -->						
						<c:choose>
							<c:when test="${number % 2 == 0 }">
								<c:out value="${number }"/>는 짝수입니다.
							</c:when>
							<c:otherwise>
								<c:out value="${number }"/>는 홀수입니다.
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>