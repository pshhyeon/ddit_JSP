<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
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
							넘겨받은 id, pw를 하드코딩된 임의의 아이디와 비밀번호가 일치할때
							로그인 성공으로 간주하고 로그인 처리를 진행합니다.
							
							예를 들어 아이디가 admin이고 비밀번호가 1234일때 로그인 성공으로 간주
							로그인 성공 시, 회원목록 페이지로 이동합니다.
							
							실패시, 로그인 페이지로 이동하여 '회원정보가 일치하지 않습니다' 메세지를 출력해주세요.
						-->
						<%
							request.setCharacterEncoding("utf-8");
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							boolean userChk = false;
							
							MemberDAO dao = MemberDAO.getInstance();
							List<MemberVO> list = dao.getMemberList();
							for(MemberVO vo : list){
								if(id.equals(vo.getMem_id()) && pw.equals(vo.getMem_pw())){
									userChk = true;
								}
							}
							if(userChk){
								response.sendRedirect("ch07_test_memberList.jsp");
							}else {
								request.setAttribute("ms", "**회원정보가 일치하지 않습니다");
								request.getRequestDispatcher("ch07_test_signin.jsp").forward(request, response);
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