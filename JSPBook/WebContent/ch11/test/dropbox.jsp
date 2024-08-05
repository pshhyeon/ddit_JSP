<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
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
					<!-- 
						첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.

						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────						
						
						자료실
						┌───────────┐	┌───────────┐
						│	파일명	│	│	파일명	│
						├───────────┤	├───────────┤
						│	이미지	│	│	이미지	│
						├───────────┤	├───────────┤
						│ 	다운로드	│	│ 	다운로드	│
						└───────────┘	└───────────┘	...
						[목록]
						
						1. 게시판에서 등록했던 게시글에 포함된 모든 파일들을 자료실에서 목록으로 출력해주세요.
						2. 파일 출력
							> 업로드 된 파일이 이미지 파일인경우, 이미지 썸네일을 [이미지]에 출력해주세요.
							> 이미지 파일이 아닌 일반 파일일경우, 해당 파일의 확장자에 맞는 아이콘으로 [이미지]에 출력해주세요.
						3. 다운로드를 클릭 하면 다운로드가 가능하게 해주세요. 
					 -->
					 <h3>메뉴 박스</h3>
					 <hr>
					 <button class="btn btn-primary" onclick="javascript:location.href='boardList.jsp'">게시판</button>
					 <button class="btn btn-danger" onclick="javascript:location.href='dropbox.jsp'">자료실</button>
					 <% if(request.getUserPrincipal() != null){ %>
					 <button class="btn btn-warning" onclick="javascript:location.href='logout.jsp'">로그아웃</button>
					 <% } %>
					 <hr>
					 <h3>자료실</h3>
					 <hr>

					<div class="row">
					<% 
					String realFolder = request.getServletContext().getRealPath("/resources/uploadFiles");
					BoardRepository dao = BoardRepository.getInstance();
					List<BoardVO> list = dao.selectBoardList();
					for(BoardVO board : list){
						BoardFileVO file = board.getFileVO(); 
						if(file.getFileName() != null){
							
		                    String contentType = file.getContentType(); 
							String filePath = "";
		                     if(contentType.equals("image/jpeg") || contentType.equals("image/png")) {
		                    	 filePath = "/resources/uploadFiles/" + file.getFileName();
		                     }
		                     else if(contentType.equals("application/pdf")) {
		                    	 filePath = "/resources/assets/images/fileIcon/pdf.jpg";
		                     }
		                     else if(contentType.equals("video/avi")) {
		                    	 filePath = "/resources/assets/images/fileIcon/avi.jpg";
		                     } 
		                     else if(contentType.equals("application/msword")) {
		                    	 filePath = "/resources/assets/images/fileIcon/doc.jpg";
		                     } 
		                     else if(contentType.equals("image/gif")) {
		                    	 filePath = "/resources/assets/images/fileIcon/gif.jpg";
		                     }
		                     else if(contentType.equals("audio/mpeg")) {
		                    	 filePath = "/resources/assets/images/fileIcon/mp3.jpg";
		                     }
		                     else if(contentType.equals("application/vnd.ms-powerpoint") ||
		                    		 contentType.equals("application/vnd.openxmlformats-officedocument.presentationml.presentation")) {
		                    	 filePath = "/resources/assets/images/fileIcon/ppt.jpg";
		                     }
		                     else if(contentType.equals("application/octet-stream")) {
		                    	 filePath = "/resources/assets/images/fileIcon/psd.jpg";
		                     }
		                     else if(contentType.equals("text/plain")) {
		                    	 filePath = "/resources/assets/images/fileIcon/txt.jpg";
		                     }
		                     else if(contentType.equals("application/vnd.ms-excel")) {
		                    	 filePath = "/resources/assets/images/fileIcon/xls.jpg";
		                     }
		                     else if(contentType.equals("application/x-zip-compressed")) {
		                    	 filePath = "/resources/assets/images/fileIcon/zip.jpg";
		                     }
					%>
                     <div class="col-sm-3" style="margin-bottom: 5px;">
	                 	<div class="card" style="text-align: center;">
							<div class="card-header"><%=file.getFileName() %></div>
							<div class="card-body">
								<img src="<%=request.getContextPath() + filePath%>"><br>
							  	size : <%=file.getFileSize() %>
							</div> 
							<div class="card-footer">
								<a href="<%=request.getContextPath()%>/resources/uploadFiles/<%=file.getFileName() %>" download>
								download</a>
							</div>
						</div>
                     </div>
                     
                     <%
                     	}}
                     %>
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