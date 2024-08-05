<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	
	// D:/JSP_SPRING/00.JSP/workspace_jsp/.metadata.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/WebMarket + /resources/images
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
	
	String productId = "";
	String pname = "";
	String unitPrice = "";
	String description = "";
	String manufacturer = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String fileName = "";
	
	while(params.hasNext()){
		FileItem item = (FileItem) params.next();
		if(item.isFormField()){ // 일반 데이터 일때
			
			// 파라미터의 이름
			String fieldName = item.getFieldName();
			if(fieldName.equals("productId")) {
				productId = item.getString(encType);
			} else if(fieldName.equals("pname")) {
				pname = item.getString(encType);
			} else if(fieldName.equals("unitPrice")) {
				unitPrice = item.getString(encType);
			} else if(fieldName.equals("description")) {
				description = item.getString(encType);
			} else if(fieldName.equals("manufacturer")) {
				manufacturer = item.getString(encType);
			} else if(fieldName.equals("category")) {
				category = item.getString(encType);
			} else if(fieldName.equals("unitsInStock")) {
				unitsInStock = item.getString(encType);
			} else if(fieldName.equals("condition")) {
				condition = item.getString(encType);
			}
			
		} else { // 파일일때
			fileName = item.getName();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile); // 파일 복사
			
		}
	}
	
	/*
	String productId = request.getParameter("productId");
	String pname = request.getParameter("pname");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	*/
	
	Integer price;
	
	if(unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()){
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(pname);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
	
%>


