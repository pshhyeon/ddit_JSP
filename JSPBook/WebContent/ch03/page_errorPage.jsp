<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="page_errorPage_error.jsp" %>
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
							// 부트스트랩을 이용하다보면 브라우저 에러가 발생하는 경우가 있다.
							// 서버에러로 인한 500코드, NullPointerException이 발생하여
							// 브라우저 화면상에서의 500에러 페이지가 나타나야 하지만
							// out.println(str.toString()); 에러 발생한 에러를 브라우저에서
							// 제대로된 소스로 인식하지 않고 완전하지 않은 소스라고 분류하여 에러가 난 시점에서
							// 브라우저 상의 화면 그리기를 멈추고 아래와 같은 에러를 발생시킬 수 있다.
							//
							// "to load resource : new ::ERR_INCOPLETE_CHUNKED_ENCODING"
							// -여러가지 상황에 의해서 발생할 수 있는 에러로  페이지를 그려낼 때 완전하지 못한 소스가 존재 할 경우 발생한다.
							//
							// [에러 해결방법]
							// - 현재의 레이아웃 형태를 점검한다 (include되는 레이아웃의 구조가 이상이 없는지 확인)
							// - 브라우저 설정 확인 및 변경 (브라우저의 정책이 강화되고 있어 프론트 영역의 에러를 잡는데 제약이 많아지고 있다... 나쁜놈들...)
							
							// 변수 str에 값을 저장하고 저장된 값을 출력하도록 스크립틀릿 태그를 작성
							String str = null;
							out.println(str.toString());
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