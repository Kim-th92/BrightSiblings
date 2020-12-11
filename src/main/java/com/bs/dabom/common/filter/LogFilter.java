package com.bs.dabom.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogFilter implements Filter {

	private Logger logger = LoggerFactory.getLogger(LogFilter.class);
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		
		String uri = req.getRequestURI();
		String url = req.getRequestURL().toString();
		String queryString = req.getQueryString();
		String referer = req.getHeader("referer");
		
		StringBuffer sb = new StringBuffer();
		sb
		.append("\n* uri  :" + uri)
		.append("\n* url  :" + url)
		.append("\n* queryString :" + queryString)
		.append("\n* 이전페이지url : "+ referer );
		
		logger.info("LOGFILTER \n" +sb);
		
		chain.doFilter(req, response);
	}

	@Override
	public void destroy() {

	}

}
