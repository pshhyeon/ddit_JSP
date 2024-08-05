<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="vo.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = request.getServletContext().getRealPath("/resources/images");
	File file = new File(realFolder);
	if(!file.exists()){
		file.mkdirs();
	}
	
	int maxSize = 5 * 1024 * 1024; // 5MB
	String encType = "utf-8";
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(9000000); // 최대 크기
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
 	String bookId = "";
 	String name = "";		
 	String unitPrice = "";	
 	String author = "";	
 	String publisher = "";	
 	String releaseDate = "";
 	String totalPages = "";
 	String description = "";	
 	String category = "";	
	String unitsInStock = "";
 	String condition = "";	
 	String fileName = "";	
	
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		if(item.isFormField()){ 
			String fieldName = item.getFieldName();
			if(fieldName.equals("bookId")){
				bookId = item.getString(encType);
			} else if(fieldName.equals("name")) {
				name = item.getString(encType);
			} else if(fieldName.equals("unitPrice")) {
				unitPrice = item.getString(encType);
			} else if(fieldName.equals("author")) {
				author = item.getString(encType);
			} else if(fieldName.equals("publisher")) {
				publisher = item.getString(encType);
			} else if(fieldName.equals("releaseDate")) {
				releaseDate = item.getString(encType);
			} else if(fieldName.equals("totalPages")) {
				totalPages = item.getString(encType);
			} else if(fieldName.equals("description")) {
				description = item.getString(encType);
			} else if(fieldName.equals("category")) {
				category = item.getString(encType);
			} else if(fieldName.equals("unitsInStock")) {
				unitsInStock.isEmpty();
				unitsInStock = item.getString(encType);
			} else if(fieldName.equals("condition")) {
				condition= item.getString(encType);
			}
						
		} else { // 파일일때
			fileName = item.getName();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile); // 파일 복사
		}
	}
	
	Integer price;
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;
	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(Integer.parseInt(totalPages));
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);

	dao.addBook(newBook);
	response.sendRedirect("books.jsp");
%>