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
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
                    	<!--
							회원가입 페이지를 작성해주세요.
							아이디 : _____________
							비밓번호 : _____________
							이름 : ______________
							성별 : O 남자 O 여자
							프로필 이미지 : [ 파일선택 ]
							-----------------------
							[ 가입하기 ] [ 뒤로가기 ]
						-->
						<form action="ch07_test_signup_process.jsp" method="post" enctype="multipart/form-data">
							아이디 : <input type="text" name="mem_id">
						 	<br>
						 	비밀번호 : <input type="text" name="mem_pw">
						 	<br>
						 	이름 : <input type="text" name="mem_name">
						 	<br>
						 	성별 : &nbsp;
						 	<input type="radio" name="mem_sex" value="M">남자 &nbsp;
						 	<input type="radio" name="mem_sex" value="G">여자 &nbsp;
						 	<br>
							<input type="file" name="filename">						 	
						 	<br>
						 	<input type="submit" class="btn btn-primary btn-sm" value="가입하기"> &nbsp;
						 	<input type="button" class="btn btn-primary btn-sm" value="뒤로가기" onclick="goBack()">
						</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>
	
	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
function goBack() {
	history.back();
}
</script>
</html>