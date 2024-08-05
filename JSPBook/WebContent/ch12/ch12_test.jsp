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
                        <li>CH12</li>
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
						<!-- 
							ch12_test.jsp를 요청 시, admin 권한을 가지고 있는 계정으로만 접근이 가능하게 해주세요.
							
							이때, admin 권한을 가지고 있는 사용자가 로그인 시, 
							필터를 통해서 권한이 admin이고 시큐리티 인증을 통해서 입력한 아이디가 admin일때 ch12_test.jsp에서 '현재 접속중인 계정은 관리자(admin)
							권한을 가지고 접근중입니다...!'를 표시해주세요!
							> FORM 인증 기반의 인증 방식으로 진행해주세요!
							
							권한이 admin이 아닌 경우, '접근 권한이 다릅니다! 다시 시도해주세요!'를 출력해주세요!
							
							해당 페이지에서는 인증 성공 후, 인증 성공된 사용자의 아이디를 함께 출력해주세요!
							
							필터 클래스명 : TestCH12Filter
						 -->
						 <%
						 	if(request.getAttribute("msg") == null){
						 		session.invalidate();
							 	out.println("접근 권한이 다릅니다! 다시 시도해주세요!<br>");
							 	out.println("<a href='ch12_test.jsp.jsp'>다시시도</a>");
						 	} else {
							 	out.println(request.getAttribute("msg"));
							 	session.invalidate();
						 	}
						 %>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>