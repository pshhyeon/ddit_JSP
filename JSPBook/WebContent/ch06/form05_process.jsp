<%@page import="java.util.Enumeration"%>
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
						<table class="table table-bordered">
							<tr>
								<th>요청 파라미터 이름</th>
								<th>요청 파라미터 값</th>
							</tr>
						<% 
							request.setCharacterEncoding("UTF-8");
						
							Enumeration paramNames = request.getParameterNames();
							
							while(paramNames.hasMoreElements()){
								String name = (String)paramNames.nextElement();
								out.println("<tr><td>" + name + "</td>");
								
								String paramValue = request.getParameter(name);
								if(name.equals("hobby")) {
									paramValue = "";
									String[] hobbyArr = request.getParameterValues(name);
									for(int i = 0; i< hobbyArr.length; i++){
										paramValue += hobbyArr[i] + " ";
									}
								}
								if(name.equals("gender")) {
									if(paramValue.equals("M")) paramValue = "남자";
									if(paramValue.equals("G")) paramValue = "여자";
								}
								
								out.println("<td>" + paramValue + "</td></tr>");
							}
						%>
						
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