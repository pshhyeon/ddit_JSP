<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	// id를 얻어온다.
	String id = request.getParameter("id");

	// id가 존재하지 않는 경우, 상품 목록 화면으로 이동
	if(id == null || id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	// id로 상품조회
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	// 상품 전체 조회
	ArrayList<Product> goodsList = dao.getAllProducts();
	// 전체조회 후 id와 같은 정보를 하나 꺼낸 후, 꺼내진 상품 정보를 이용해서 다시 카트쪽에다가 넣어주는 로직
	// *** 개인적으로 공부할때 불필요한 소스부분이 첨부되어 있어서 별도로 빼고 다른 로직으로 진행함
	
	// 카트 목록 꺼내오기
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartList");
	// 최초 주문일때는 list 생성해서 공간 할당
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
	}
	
	// 세션에서 얻어온 cartList에서 index에 해당하는 Product를 꺼내 goodsQnt 변수에 주소 전달
	// 그 주소에 같은 상품일 경우 수량만 카운트해서 셋팅
	int cnt = 0;
	for(int i = 0; i < list.size(); i++){
		Product goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt ++;
			goodsQnt.setQuantity(goodsQnt.getQuantity() + 1);
		}
	}
	
	// 첫 상품 주문일 경우
	if(cnt == 0){
		product.setQuantity(1);
		list.add(product);
	}
	
	response.sendRedirect("product.jsp?id=" + id);
	
%>


