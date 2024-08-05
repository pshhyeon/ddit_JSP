<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
						<div class="row">
						
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>변수 k가 1부터 10까지 1씩 증가하도록 JSTL의 Core태그 반복문을 작성</h5>
									</div>
									<div class="card-body">
										<c:forEach begin="1" end="10" step="1" var="k">
											<c:out value="${k }"></c:out>
										</c:forEach>
									</div>								
								</div>
							</div>

							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											변수 i가 1부터 10까지 1씩 증가하도록 JSTL의 Core태그 반복문을 작성 <br>
											<font color="red">짝수 일때만 출력</font> 
										</h5>
									</div>
									<div class="card-body">
										<c:forEach begin="1" end="10" step="1" var="i">
											<c:if test="${i % 2 == 0 }">
												<c:out value="${i }"></c:out>
											</c:if>
										</c:forEach>
									</div>								
								</div>
							</div>

							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											스크립틀릿과 표현문/JSTL을 통해 str출력 <br>
											<font color="red">스크립틀릿으로 선언</font>
										</h5>
									</div>
									<div class="card-body">
										<% 
											String str = "스크립틀릿으로 선언한 개똥이";
										%>
										<%=str %>
									</div>								
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											스크립틀릿과 표현문/JSTL을 통해 str출력 <br>
											<font color="red">JSTL의 Core 태그 out으로 선언</font>
										</h5>
									</div>
									<div class="card-body">
										<c:set value="core태그로 선언한 개똥이" var="str"/>
										<c:out value="${str }"/>
									</div>								
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											스크립틀릿과 표현문/JSTL을 통해 Collection 출력 <br>
											<font color="red">스크립틀릿으로 선언</font>
										</h5>
									</div>
									<div class="card-body">
										<%
											List<String> list = new ArrayList<String>();
											list.add("개똥이");
											list.add("김철수");
											list.add("메뚜기");
										%>
										<%=list %>
									</div>								
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											스크립틀릿과 표현문/JSTL을 통해 Collection 출력 <br>
											<font color="red">JSTL의 Core태그의 forEach를 통해 Collection을 출력</font>
										</h5>
									</div>
									<div class="card-body">
										<c:set value="<%=list %>" var="listItem"/>
										<!-- 
											collection데이터를 items에 저장
											collection의 각각의 값을 var에 저장
											index나 count같은 데이터를 사용할때 varStatus로 사용
										 -->
										<c:forEach items="${listItem }" var="item" varStatus="stat">
											<p>[count : ${stat.count } | index : ${stat.index}] - ${item }</p>
										</c:forEach>
									</div>								
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											JSTL을 통해 범위 내 값 출력<br>
											<font color="red">choose-when/otherwise를 이용</font>
										</h5>
									</div>
									<div class="card-body">
										<c:set value="5000" var="money"/>
										<p>내가가진 돈은 ${money }원 입니다.</p>
										<!-- choose-when/otherwise는 무조건 choose안에 작성 되어야 함 / 주석도 작성하면 안됨 -->
										<c:choose>
											<c:when test="${money <=0 }">
												무일푼
											</c:when>
											<c:when test="${money >= 5000 and money <= 10000 }">
												커피 한잔의 여유 가능
											</c:when>
											<c:otherwise>
												밥먹자!!
											</c:otherwise>
										</c:choose>
									</div>								
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="card">
									<div class="card-header">
										<h5>
											JSTL을 통해 범위 내 값 출력<br>
											<font color="red">if를 이용</font>
										</h5>
									</div>
									<div class="card-body">
										<p>내가가진 돈은 ${money }원 입니다.</p>
										<c:if test="${money <= 0}">
											무일푼
										</c:if>
										<c:if test="${money >= 5000 && money <=10000 }">
											커피 한잔의 여유 가능!
										</c:if>
										<c:if test="${money >= 10000 }">
											밥 먹자!
										</c:if>
									</div>								
								</div>
							</div>
							
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>