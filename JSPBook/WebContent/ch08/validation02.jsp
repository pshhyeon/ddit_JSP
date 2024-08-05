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
                        <li>CH08</li>
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
						<h3>JavaScript 버전</h3>
						<form action="validation02_process.jsp" method="post" name="loginForm">
							아이디 : <input type="text" name="id" id="id"> <br>
							비밀번호 : <input type="text" name="pw" id="pw"> <br>
							<input type="button" value="전송" onclick="CheckLogin()">
						</form>
						
						<h3>jQuery 버전</h3>
						<form action="validation02_process.jsp" method="post" name="loginForm2" id="loginForm2">
							아이디 : <input type="text" name="id2" id="id2"> <br>
							비밀번호 : <input type="text" name="pw2" id="pw2"> <br>
							<input type="button" value="전송" id="submitBtn2">
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
function CheckLogin() {
	var form = document.loginForm;
	
	// 입력한 아이디 값의 길이를 이용해 특정 범위내에서만 입력 할 수 있도록 제한
	if(form.id.value.length < 4 || form.id.value.length > 12){
		alert("아이디는 4 ~ 12자 이내로 입력 가능합니다!");
		form.id.select(); // 아이디 입력란으로 포커스를 옮겨주기
		return false;
	}
	
	// 입력한 아이디 값의 길이를 이용해 특정 범위내에서만 입력 할 수 있도록 제한
	if(form.pw.value.length < 4){
		alert("비밀번호는 4자 이상 입력 가능합니다!");
		form.pw.select(); // 아이디 입력란으로 포커스를 옮겨주기
		return false;
	}
	
	form.submit();
}

$(function() {
	var submitBtn2 = $("#submitBtn2"); // 전송 버튼 Element
	var loginForm2 = $("#loginForm2"); // form Element
	
	submitBtn2.on("click", function(){
		var id2 = $("#id2").val();
		var pw2 = $("#pw2").val();
		
		// 입력한 아이디 값의 길이를 이용해 특정 범위내에서만 입력 할 수 있도록 제한
		if(id2.length < 4 || id2.length > 12){
			alert("아이디는 4 ~ 12자 이내로 입력 가능합니다!");
			$("#id2").select(); // 아이디 입력란으로 포커스를 옮겨주기
			return false;
		}
		
		// 입력한 아이디 값의 길이를 이용해 특정 범위내에서만 입력 할 수 있도록 제한
		if(pw2.length < 4 || pw2.length > 12){
			alert("비밀번호는 4자 이상 입력 가능합니다!");
			$("#pw2").select(); // 아이디 입력란으로 포커스를 옮겨주기
			return false;
		}
		
		loginForm2.submit();
		
	});
	
});

</script>

</html>