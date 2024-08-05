package kr.or.ddit.ch12;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LogFileFilter implements Filter {
	
	private PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02_1 초기화...!");
		
		String filename = filterConfig.getInitParameter("filename");
		
		if (filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다!!");
		}
		
		try {
			// PrintWriter
			// 두번째 매개변수 : autoFlush의 여부(true, false)
			
			// FileWriter
			// 두번째 매개변수 : append여부(true, false)
			writer = new PrintWriter(new FileWriter(filename, true), true); // web.xml에 지정한 파일 만듬
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다."); 
			// web.xml에 지정한 파일 만들기 전 폴더가 생성되어있지 않으면 예외가 발생하기 때문에 console에 exception 메세지 출력
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02_1 수행...!");
		// filter02.jsp 로그인 수행시 로그 정보 기록후 파일 생성 >> 설정은 web.xml
		writer.printf("현재 일시 : %s %n", getCurrentTime());
		
		String clientAddr = request.getRemoteAddr();
		writer.printf("클라이언트 주소 : %s %n", clientAddr);
		
		chain.doFilter(request, response);
		
		String contentType = response.getContentType();
		writer.printf("문서의 콘텐츠 유형 : %s %n", contentType);
		writer.printf("===================================");
	}

	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter02_1 소멸...!");
		writer.close();
	}
}
