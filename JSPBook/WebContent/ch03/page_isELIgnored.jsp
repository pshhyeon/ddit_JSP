<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
isELIgnored="false" %>
<!-- 
	isELIgnored 속성은 현재 JSP 페이지의 표현언어(Expression Language) 사용 여부를 설정하는데 사용
	기본값을 false이며 JSP 페이지에 표현 언어의 표현식'\${}'를 사용할 수 있다. 속성 값을 true로 설정하면
	JSP페이지에 사용된 표현언어의 표현식을 처리할 수 없기 때문에 정적 텍스로 처리된다.
 -->
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
                        <li>CH03</li>
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
							// 내작 객체 request 변수의 setAttribute() 메소드를 이용하여
							// RequestAttrubute 키에 값을 저장하도록 스크립틀릿 태그를 작성
							// isELIgnored 설정이 false인 경우, EL표현문의 값이 출력된다.
							// isELIgnored 설정이 true인 경우, EL표현문이 그대로 텍스트로 출력된다.
							request.setAttribute("RequestAttribute", "request 내장 객체");
						%>
						isElIgnored false 설정 : 값으로 출력<br>
						isElIgnored true 설정 : 텍스트로 출력<br>
						<br>
						${requestScope.RequestAttribute}
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>