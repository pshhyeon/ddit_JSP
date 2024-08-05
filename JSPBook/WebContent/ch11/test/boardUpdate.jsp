<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
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
						1. 게시글 수정을 처리해주세요.
							> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
							> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
							
						2. 게시글 수정 시, 등록과 같은 옵션 정보를 처리해주세요.
							> 등록과  옵션 정보 동일
					 -->
					 <%
					 	request.setCharacterEncoding("UTF-8");
					 	int boardNo = Integer.parseInt(request.getParameter("no"));
// 					 	System.out.println("@@@@@@@@@@@" + boardNo);
						String realFolder = request.getServletContext().getRealPath("/resources/uploadFiles");
						File file  = new File(realFolder);
						if(!file.exists()){
							file.mkdirs();
						}
						
						int maxSize = 1 * 1024 * 1024;
						String encType = "utf-8";
						DiskFileUpload upload = new DiskFileUpload();
						upload.setSizeMax(2 * 1024 * 1024);
						upload.setSizeThreshold(maxSize);
						upload.setRepositoryPath(realFolder);
						
						List items = upload.parseRequest(request);
						Iterator params = items.iterator();
						String title = "";		// 게시글 제목
						String content = "";		// 게시글 내용
						String writer = request.getUserPrincipal().getName();		// 게시글 작성자
						BoardFileVO fileVO = new BoardFileVO();	// 게시글 파일객체
						String ms = "";
						boolean insertChk = true;
						
						BoardRepository dao = BoardRepository.getInstance();
						while(params.hasNext()){
							FileItem item = (FileItem)params.next();
							if(item.isFormField()){ 
								String fieldName = item.getFieldName();
								if(fieldName.equals("title")){
									title = item.getString(encType);
								} else if(fieldName.equals("content")){
									content = item.getString(encType);
								}				
							} else {
								try{
									if(item.getSize() > 0){
										if(item.getSize() < maxSize){
											String filename = item.getName();
											fileVO.setFileName(filename);
// 											String[] contentType = filename.split("\\.");
											fileVO.setContentType(item.getContentType());
											fileVO.setFileSize(item.getSize());
											fileVO.setNo(dao.getNo()+1);
											File saveFile = new File(realFolder + "/" + filename);
											item.write(saveFile);
										} else {
											insertChk = false;
										}
									}
								} catch(Exception e) {}
							}
						}
						if(insertChk){
							BoardVO board = new BoardVO();
							board.setNo(boardNo);
							board.setTitle(title);
							board.setContent(content);
							board.setWriter(writer);
							board.setFileVO(fileVO);
							dao.updateBoard(board);
							response.sendRedirect("boardView.jsp?no="+boardNo);
						} else {
							ms = "업로드 파일 크기를 초과하였습니다";
							request.getRequestDispatcher("boardUpdateForm.jsp?no="+boardNo+"&title="+title+"&content="+content+"&ms="+ms).forward(request, response);
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