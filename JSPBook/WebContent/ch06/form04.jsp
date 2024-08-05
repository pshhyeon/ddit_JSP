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
						<form action="form04_process.jsp" method="post" name="member">		
							<!-- action이 지정되어있지 않으면 현재 페이지가 타겠이 됨 -->
							아이디 : <input type="text" name="id" value="" />
							<br>
							비밀번호 : <input type="text" name="pw" value="" />
							<br>							
							이름 : <input type="text" name="name" value="" />
							<br>
							연락처 : 
							<select name="phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							-
							<input type="text" name="phone2" value="" size="4" maxlength="4" />-
							<input type="text" name="phone3" value="" size="4" maxlength="4" />
							<br>
							성별 : <input type="radio" name="gender" value="M" />남자 &nbsp;
							<input type="radio" name="gender" value="G" />여자 
							<br>
							취미 : <input type="checkbox" name="hobby" value="독서" />독서&nbsp;
							<input type="checkbox" name="hobby" value="운동" />운동&nbsp;
							<input type="checkbox" name="hobby" value="영화" />영화&nbsp;
							<br>
							자기소개 : 
							<!-- 
								textarea wrap 속성
								wrap = "off" : 줄바꿈 안함
								wrap = "soft" : 줄바꿈 자동
								wrap = "hard" : 줄바꿈 자동 포함 / 서버 전송시 캐리지 리턴(엔터문자) 분자를 전달
								
								해당 속성은 html5버전에서 새롭게 추가된 기능입니다.
								wrap="hard" 속성을 사용 시. cols 속성이 꼭 명시되어 있어야 한다.
								wrap 속성의 값을 soft, hard로 설정 시, textarea 설정 크기에서
								Enter를 치지 않고 텍스트를 입력해 나갈때, 
								textarea가로길이 오른쪽 맨 끝에 다다를때 자동으로 아래줄로 넘어가 작성이 되는데
								이때 Enter를 직접 치지는 않았지만 아래줄로 내려가 작성된다.
								
								이때, hard는 개행문자가 포함된 데이터가 전송된다.
								(개행문자인 '\n\r'이 데이터 상에 보여지지는 않지만, 데이터를 확인해보면
								 Enter가 쳐진 상태의 데이터를 확인할 수 있다.)
							 -->
							<textarea rows="10" cols="50" name="comment" 
							placeholder="가입 인사를 입력해주세요!" wrap="hard"></textarea>
							<br>							
							<input type="submit" value="전송" />
							<input type="reset" value="리셋" />
						</form>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>