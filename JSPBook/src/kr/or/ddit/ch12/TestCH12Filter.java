package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TestCH12Filter implements Filter {

	private FilterConfig filterConfig = null;
	
	@Override
	public void destroy() {
		System.out.println("ch12_test 소멸...!");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("ch12_test 수행...!");
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("j_username");
		
		String param = filterConfig.getInitParameter("param");
		
		String msg = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		HttpServletRequest req;
		req = (HttpServletRequest)request;
		Principal princ = req.getUserPrincipal();
		String authentId = princ.getName();
		if (req.isUserInRole(authentId) && authentId.equals("admin")) {
			msg = "현재 접속중인 계정은 관리자(admin) 권한을 가지고 접근중입니다...!<br>";
			msg += "<h3>Filter Test</h3>";
			msg += "인증 성공 사용자 : " + param;
			req.setAttribute("msg", msg);
		} else {
			msg = "접근 권한이 다릅니다! 다시 시도해주세요!";
			msg += "<a href='ch12_test.jsp'>다시시도</a>";
			req.setAttribute("msg", msg);
		}
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("ch12_test 초기화...!");
		this.filterConfig = filterConfig;
	}

}
