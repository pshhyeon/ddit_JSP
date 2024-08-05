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
                        <li>CH01</li>
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
						<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							<table class="table table-bordered" style="text-align:center; font-size:24px;">
								<tr height="80px">
									<td width="10%">이슬미</td>
									<td width="10%">김환용</td>
									<td width="10%">도명환</td>
									<td width="10%">김성재</td>
									<td width="20%"></td>
									<td width="10%">김동영</td>
									<td width="10%">백지열</td>
									<td width="10%">김현수</td>
									<td width="10%"></td>
								</tr>
								<tr height="80px">
									<td>박정현</td>
									<td>박상현</td>
									<td>장성훈</td>
									<td>이다예</td>
									<td></td>
									<td>금서윤</td>
									<td>김동윤</td>
									<td>이원우</td>
									<td>강미정</td>
								</tr>
								<tr height="80px">
									<td>김진원</td>
									<td>이채민</td>
									<td>박신애</td>
									<td>조민지</td>
									<td></td>
									<td></td>
									<td>이채은</td>
									<td>김선경</td>
									<td>이홍석</td>
								</tr>
								<tr height="80px">
									<td>김현경</td>
									<td>이창은</td>
									<td>조서연</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
						<p id="count"></p>
						<h4 id="process"></h4>
						<hr/><br/>
						<button type="button" class="btn btn-primary" id="clickBtn">출력</button>
						<div id="output"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
var select1 = '';
var select2 = '';
$('td').on('click', function(){
	if(select1 == ''){
		select1 = $(this);
		select1.css('background-color', 'yellow');
		$('#count').html('<h2>'+select1.text()+'님과</h2>');
	} else {
		select2 = $(this);
		$('#count').html('<h2>'+select1.text()+'님과 '+select2.text()+'님을 변경합니다!</h2>');
		select1.css('background-color', 'white');
		var temp = select1.text();
		select1.text(select2.text());
		select2.text(temp);
		select1 = '';
		select2 = '';
	}
});

$('#clickBtn').on('click', function() {
	$('#output').html('<table class="table table-bordered" id=print_table style="text-align:center; font-size:24px;">' + $('table').html() + '</table>');
	var tds = $('#print_table').find('td');
	tds.each(function(){
		if ($(this).text() == '박상현') {
			$(this).html('<marquee behavior="scroll"><font color="blue">박상현</font></marquee>');
		}
	});
});
</script>
</html>