package com.bs.dabom.common.interceptor;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


	public class LoginCheckIntercepter  extends HandlerInterceptorAdapter {

		private Logger logger = LoggerFactory.getLogger(LoginCheckIntercepter.class);
		
		
		// 디스패쳐 서블릿서 컨트롤러 가기 전 
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			logger.info("[INTERCEPTOR] postHandle");
			ArrayList<String> excludeCheckUrl = new ArrayList<String>();

			excludeCheckUrl.add("/");
			excludeCheckUrl.add("register.do");
			excludeCheckUrl.add("ajaxlogin.do");
			excludeCheckUrl.add("registerres.do");
			excludeCheckUrl.add("idcheck.do");
			excludeCheckUrl.add("auth/naver/callback.do");
			excludeCheckUrl.add("oauth/kakao/callback.do");
			excludeCheckUrl.add("logout.do");
			
			
			if((request.getSession().getAttribute("login")==null 
					&&request.getRequestURI().contains("/login.do"))
					||request.getRequestURI().contains("/ajaxlogin.do")
					||request.getRequestURI().contains("/register.do")
					||request.getRequestURI().contains("/registerres.do")
					||request.getRequestURI().contains("/logout.do")
					||request.getRequestURI().contains("/idcheck.do")
					||request.getRequestURI().contains("/findpw.do")
					||request.getRequestURI().contains("/oauth/kakao/callback.do")
					||request.getRequestURI().contains("/oauth/naver/callback.do")
					||request.getRequestURI().contains("/findpwcheck.do")
					||request.getRequestURI().contains("/mailsend.do")
					||request.getRequestURI().contains("/temppw.do")
					
					) {
				return true;
			}
			
			
			if(request.getSession().getAttribute("login")==null ) {
				response.sendRedirect("login.do");
				
			}
				
			return true;
			
			
		}

		//컨트롤러에서 디스패쳐 가기 전
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			logger.info("[INTERCEPTOR] postHandle");
			if(modelAndView != null) {
				logger.info(modelAndView.getViewName());
			}
		}

	
}
