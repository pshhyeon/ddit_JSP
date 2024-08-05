<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
						<!-- 내용을 입력해주세요 -->
						<%
							String path = "C:\\upload";
							File tempFile = new File(path);
							if(!tempFile.exists()){
								tempFile.mkdirs();
							}
							
							DiskFileUpload upload = new DiskFileUpload();
							
							// 옵션 설정 시작
							// 업로드 할 파일의 최대 크기 (byte)
							upload.setSizeMax(5 * 1024 * 1024);
							// 메모리상에 저장할 최대 크기
							upload.setSizeThreshold(4 * 1024 * 1024);
							// 업로드된 파일을 임시로 저장할 경로
							upload.setRepositoryPath(path);
							// 옵션 설정 끝
							List items = upload.parseRequest(request);
							Iterator params = items.iterator();
							
							// 파일 업로드 시 최대 사이즈(4MB)
							int maxSize = 4 *1024 * 1024;
							while(params.hasNext()) {
								FileItem item = (FileItem) params.next();
								
								// 폼 페이지에서 전송된 요청 파라미터가 일반 데이터라면
								if(item.isFormField()) { // 일반 데이터 일때
									// 파라미터의 이름
									String name = item.getFieldName();
									// 파라미터의 값
									String value = item.getString("utf-8"); // 데이터를 꺼낼때 인코딩
									out.print(name + " = " + value + "<br>");
								} else { // 파일 일때
									String fileFieldName = item.getFieldName(); // 파라미터의 이름
									String fileName = item.getName();	// 파일명
									// 파일 콘텐츠 타입(MimeType)
									String contentType = item.getContentType();
									// 파일 크기
									long fileSize = item.getSize();
									
									File file = new File(path + "/" + fileName);
									if(maxSize < fileSize){
										out.println("파일 크기를 초과하였습니다<br>");
									} else {
										item.write(file); // 파일 복사
										out.println("------------------------");
										out.println("파라미터 이름 : " + fileFieldName + "<br>");
										out.println("파일명 : " + fileName + "<br>");
										out.println("콘텐츠 타입 : " + contentType + "<br>");
										out.println("파일 크기 : " + fileSize + "<br>");
									}// /if - else
								} // /if - else
							} // /while
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