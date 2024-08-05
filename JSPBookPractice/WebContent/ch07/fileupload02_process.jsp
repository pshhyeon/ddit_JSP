<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String path= "C://upload";
	File tempFile = new File(path);
	if(!tempFile.exists()){
		tempFile.mkdirs();
	}
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(5*1024*1024);
	upload.setSizeThreshold(4*1024*1024);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	int maxSize = 4* 1024*1024;
	
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
		
		// 폼 페이지에서 전송된 요청 파라미터가 일반 데이터라면
		if(item.isFormField()){
			//파라미터의 이름
			String name = item.getFieldName();
			//파라미터의 값 
			String value = item.getString("utf-8");
			out.println(name + "="+value+"<br>");
		}else{ //파일일때
			//파라미터의 이름
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();//파일명
			String realName = new File(fileName).getName();
			// 파일 콘텐츠타입(MimeType)
			String contentType = item.getContentType();
			//파일 크기
			long fileSize = item.getSize();
			
			//업로드한 이미지 파일을 write하기 위한 파일 객체 생성
			File file = new File(path+"/"+fileName);
			if(maxSize < fileSize){
				out.println("파일 크기를 초과하였습니다.<br>");
			}else{
				item.write(file);//파일 복사
				out.println("---------------<br>");
				out.println("파라미터 이름  : "+fileFieldName+"<br>");
				out.println("실제 파일 이름  : "+realName+"<br>");
				out.println("저장 파일 이름  : "+fileName+"<br>");
				out.println("파일 콘텐츠 유형  : "+contentType+"<br>");
				out.println("파일크기 : "+ fileSize +"<br>");
			}
			
		}
	}
	%>
</body>
</html>