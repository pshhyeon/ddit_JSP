<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <li>CH05</li>
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
						<table class="table table-bordered">
							<%
								// 모든 헤더 이름을 가져오도록 request내장 객체의 getHeaderNames() 메소드를 작성하고
								// 이름 모두 저장하도록 Enumeration 객체 타입의 변수 en 작성
								Enumeration en = request.getHeaderNames();
							
								// Enumeration 객체 타입의 변수 en의 hasMoreElements()
								// 메소드를 통해 저장된 헤더 이름이 있을 때까지 반복하도록 while문을 작성함
								while(en.hasMoreElements()){
									// 현재 헤더 이름을 가져오도록 Enumeration객체 타입의
									// 변수 en의 nextElement() 메소드를 작성함
									String headerName = (String)en.nextElement();
									// 설정된 헤더 이름의 값을 가져오도록 request 내장객체의
									// getHeader() 메소드를 작성함
									String headerValue = request.getHeader(headerName);
							%>
							<tr>
								<th><%=headerName %></th>
								<th><%=headerValue %></th>
							</tr>
							<%
								}
							%>
							<!-- 
								# user-agent 정보
								- 형태 : Mozilla 정보/버전 + 운영체제 정보 + 브라우저 렌더링 엔진 정보 + 브라우저 버전 정보
							 -->
						</table>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>