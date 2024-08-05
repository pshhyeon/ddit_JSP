<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
							// Commons-FileUpload를 이용하여 파일을 업로드하려면 먼저
							// Commons-FileUpload 패키지에 포함되어 있는 DiskFileUpload 객체를 생성합니다.
							// 생성된 객체를 통해 DiskFileUpload 클래스가 제공하는 메소드를 사용하여 웹 브라우저가 전송한 multipart/form-data유형의 요청 파라미터를 가져온다
							// 그리고 FileItem 클래스의 메소드를 사용하여 요청 파라미터가 일반 데이터인지
							// 파일인지 분석 및 처리하여 파일을 업로드한다.
							
							// 폼 페이지에서 전송된 파일을 저장할 서버의 경로를 작성
							String fileUploadPath = "C:\\upload";
							
							// 파일 업로드를 진행할 폴더 경로가 존재하지 않다면 폴더를 생성
							File tempFile = new File(fileUploadPath);
							
							if(!tempFile.exists()) { // 해당 경로에 폴더가 존재 하지 않을 경우 폴더 생성
								tempFile.mkdirs();
							}
							
							// CommonsFileUpload를 이용하여 파일을 업로드하려면 먼저
							// Commons-FileUpload 라이브러리를 통한 객체 정보를 사용해야한다.
							DiskFileUpload upload = new DiskFileUpload();
							// 파일 업로드를 위해 패키지에 포함되어 있는 DiskFileUpload 클래스가 제공하는 메소드를 사용하여
							// 웹 브라우저가 전송한 multipart/form-data 유형의 요청 파라미터를 가져옴
							List items = upload.parseRequest(request);
							// 폼 페이지에서 전송된 요청 파라미터를 Iterator 클래스로 변환
							Iterator params = items.iterator();
							
							// 폼 페이지에서 전송된 요청 파라미터가 없을 때까지 반복하도록 Iterator객체 타입의 hasNext() 메소드를 작성
							while(params.hasNext()){
								FileItem fileItem = (FileItem) params.next();
								
								// FileItem 클래스의 메소드를 사용하여 요청 파라미터가 일반 데이터인지
								// 파일인지 분석 및 처리하여 파일을 업로드 함
								if(!fileItem.isFormField()) { // 파일일때
									String fileName = fileItem.getName(); // 파일명
						%>
									<p><%=fileName %>이 저장되었습니다!</p>
								
						<%
									// 이곳으로 업로드 된다(최종)
									// C:/upload/KaKaoTalk_240422_14_56/jpg
									File file = new File(fileUploadPath + "/" + fileName);
									fileItem.write(file); // 파일 복사
								}
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