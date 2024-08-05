<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			String path = "C:\\upload";
			File tempFile = new File(path);
			if(!tempFile.exists()) {
				tempFile.mkdirs();
			}
			
			DiskFileUpload upload = new DiskFileUpload();
			
			upload.setSizeMax(5 * 1024 * 1024);
			upload.setSizeThreshold(5 * 1024 * 1024);
			upload.setRepositoryPath(path);
			
			List items = upload.parseRequest(request);
			Iterator params = items.iterator();
			
			int maxSize = 5 * 1024 * 1024;
			
			while(params.hasNext()){
				FileItem item = (FileItem) params.next();
				
				if(item.isFormField()){
					String name = item.getFieldName();
					String value = item.getString("utf-8");
					out.print(name + " = " + value + "<br>");
				} else {
					String fileFieldName = item.getFieldName();
					String fileName = item.getName();
					String contentType = item.getContentType();
					long fileSize = item.getSize();
					File file = new File(path + "/" + fileName);
					if(maxSize < fileSize){
						out.println("파일 크기를 초과하였습니다<br>");
					} else {
						item.write(file); // 파일 복사
						out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
						out.println("실제 파일 이름 : " + fileName + "<br>");
						out.println("저장 파일 이름 : " + fileName + "<br>");
						out.println("파일 콘텐츠 유형 : " + contentType + "<br>");
						out.println("파일 크기 : " + fileSize + "<br>");
					}
				}
			}
	%>
</body>
</html>