package kr.or.ddit.ch12;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class initParamFilter implements Filter {
	
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화...!");
		
		System.out.println("param1 : " + filterConfig.getInitParameter("param1"));
		System.out.println("param2 : " + filterConfig.getInitParameter("param2"));
		// doFilter() 메소드 안에서 init-prarm 설정했던 값을 취급하기 위해서
		this.filterConfig = filterConfig;
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행...!");
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String msg = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (id.equals(param1) && pw.equals(param2)) {
			msg = "로그인 성공했습니다!";
			request.setAttribute("msg", msg);
		} else {
			msg = "로그인 실패했습니다! ";
			msg += "<a href='filter02.jsp'>Filter02 이동</a>";
			writer.println(msg);
			return;
		}
		
		chain.doFilter(request, response);
	}

	
	@Override
	public void destroy() {
		System.out.println("Filter02 소멸...!");
	}
}
