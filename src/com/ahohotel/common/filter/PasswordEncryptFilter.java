package com.ahohotel.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.ahohotel.common.wrapper.EncryptRequestWrapper;

@WebFilter("/*")
public class PasswordEncryptFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		/* HttpServletRequest으로 다운 캐스팅 -> 이유 wrapper 클래스가 httpwrapper를 상속 받기 때문 */
		HttpServletRequest hrequest = (HttpServletRequest) request;
		
		String uri = hrequest.getRequestURI();
//		System.out.println("uri = " + uri);
		
		String intent = uri.substring(uri.lastIndexOf("/"));
//		System.out.println("intent : " + intent);
		
		if (!"/login".equals(intent)) {
			
			EncryptRequestWrapper wrapper = new EncryptRequestWrapper(hrequest);
			
			chain.doFilter(wrapper, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
