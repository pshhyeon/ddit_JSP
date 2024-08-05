<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						<!-- 
							문제) 305호 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요.
							예)------------------------------
							'홍'씨 성을 가진 사람 : 00명
							'김'씨 성을 가진 사람 : 00명
							'조'씨 성을 가진 사람 : 00명
							'박'씨 성을 가진 사람 : 00명
							...
							...
							305호 학생들의 이름을 리스트, 배열, 등등 자유롭게 넣어놓고
							JSTL을 활용하여 위와 같은 형태로 출력해주세요.
						 -->
						 <%
						 	List<String> list = new ArrayList<String>();
							list.add("강미정");
							list.add("금서윤");
							list.add("김동영");
							list.add("김동윤");
							list.add("김선경");
							list.add("김성재");
							list.add("김진원");
							list.add("김현경");
							list.add("김현수");
							list.add("김환용");
							list.add("도명환");
							list.add("박상현");
							list.add("박신애");
							list.add("박정현");
							list.add("백지열");
							list.add("이다예");
							list.add("이슬미");
							list.add("이원우");
							list.add("이창은");
							list.add("이채민");
							list.add("이채은");
							list.add("이홍석");
							list.add("장성훈");
							list.add("조민지");
							list.add("조서연");
						 %>
						 
						 <c:set value="<%=list %>" var="listItem"/>
						 
						  전체 학생 : <c:out value="${listItem }"/> 
						 <br>
						 <c:set value="0" var="geum" />
						 <c:set value="0" var="gang" />
						 <c:set value="0" var="kim" />
						 <c:set value="0" var="_do" />
						 <c:set value="0" var="park" />
						 <c:set value="0" var="baek" />
						 <c:set value="0" var="lee" />
						 <c:set value="0" var="jang" />
						 <c:set value="0" var="jo" />
						 <!-- 금 김 도 박 백 이 장 조  -->
						 <c:forEach var="i" begin="0" end="${fn:length(listItem) - 1 }">
							<c:set value="${fn:substring(listItem[i], 0, 1)}" var="first_name"/>
							<c:if test="${fn:contains(first_name, '금') }">
								<c:set value="${geum+1}" var="geum" />
							</c:if>
							<c:if test="${fn:contains(first_name, '강') }">
								<c:set value="${gang+1}" var="gang" />
							</c:if>
							<c:if test="${fn:contains(first_name, '김') }">
								<c:set value="${kim+1}" var="kim" />
							</c:if>
							<c:if test="${fn:contains(first_name, '도') }">
								<c:set value="${_do+1}" var="_do" />
							</c:if>
							<c:if test="${fn:contains(first_name, '박') }">
								<c:set value="${park+1}" var="park" />
							</c:if>
							<c:if test="${fn:contains(first_name, '백') }">
								<c:set value="${baek+1}" var="baek" />
							</c:if>
							<c:if test="${fn:contains(first_name, '이') }">
								<c:set value="${lee+1}" var="lee" />
							</c:if>
							<c:if test="${fn:contains(first_name, '장') }">
								<c:set value="${jang+1}" var="jang" />
							</c:if>
							<c:if test="${fn:contains(first_name, '조') }">
								<c:set value="${jo+1}" var="jo" />
							</c:if>
						 </c:forEach>
						 
						 <!-- 금 김 도 박 백 이 장 조  -->
						 <font color="red">'금'씨</font>성을 가지 사람 수 : <c:out value="${geum}"/> <br>
						 <font color="red">'강'씨</font>성을 가지 사람 수 : <c:out value="${gang}"/> <br>
						 <font color="red">'김'씨</font>성을 가지 사람 수 : <c:out value="${kim}"/> <br>
						 <font color="red">'도'씨</font>성을 가지 사람 수 : <c:out value="${_do}"/> <br>
						 <font color="red">'박'씨</font>성을 가지 사람 수 : <c:out value="${park}"/> <br>
						 <font color="red">'백'씨</font>성을 가지 사람 수 : <c:out value="${baek}"/> <br>
						 <font color="red">'이'씨</font>성을 가지 사람 수 : <c:out value="${lee}"/> <br>
						 <font color="red">'장'씨</font>성을 가지 사람 수 : <c:out value="${jang}"/> <br>
						 <font color="red">'조'씨</font>성을 가지 사람 수 : <c:out value="${jo}"/> <br>

						 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>