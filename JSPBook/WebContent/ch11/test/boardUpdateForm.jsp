<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
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
	
<script type="text/javascript">
<%
	request.setCharacterEncoding("utf-8");
	String ms = request.getParameter("ms") == null || request.getParameter("ms").isEmpty() ? "" : request.getParameter("ms");
%>
var ms = "<%=ms%>";
if (!(ms == "")) {
	alert(ms);
}

</script>

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
						1. 게시판 수정 페이지를 작성해주세요.
						
						게시글 수정
						─────────────────────────────
						제목 : 제목입니다1
						내용 : 내용입니다1
						─────────────────────────────
						첨부파일 : [파일 선택]
						─────────────────────────────
						[ 수정  ] [ 목록 ]
						
						2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
						3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
					 -->
					 <%
					 	int boardNo = Integer.parseInt(request.getParameter("no")); 
						BoardRepository dao = BoardRepository.getInstance();
						BoardVO board = dao.getBoardById(boardNo);
						String title = board.getTitle();
						String content = board.getContent();
						title = request.getParameter("title") == null ? title : request.getParameter("title");
						content = request.getParameter("content") == null ? content : request.getParameter("content");
						BoardFileVO file = board.getFileVO();
					 %>
					 <h3>게시글 수정</h3>
					 <hr>
					 <form action="boardUpdate.jsp?no=<%=boardNo %>" method="post" enctype="multipart/form-data">
						 <table class="table table-bordered">
						 	<tr>
						 		<td>제목</td>
						 		<td><input class="form-control" type="text" name="title" value="<%=title%>"></td>
						 	</tr>
						 	<tr>
						 		<td>내용</td>
						 		<td><textarea class="form-control" rows="6" name="content"><%=content%></textarea></td>
						 	</tr>
						 	<tr>
						 		<td>파일</td>
						 		<td><input class="form-control" type="file" name="fileName"></td>
						 	</tr>
						 	<tr>
						 		<td>첨부파일 내용</td>
						 		<td><p><%=file.getFileName()%></p></td>
						 	</tr>
						 	<tr>
						 		<td colspan="2">
						 			<input class="btn btn-warning" type="submit" value="수정">
						 			<input class="btn btn-info" type="button" value="취소" onclick="javascript:location.href='boardView.jsp?no=<%=boardNo%>'">
						 		</td>
						 	</tr>
						 </table>
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