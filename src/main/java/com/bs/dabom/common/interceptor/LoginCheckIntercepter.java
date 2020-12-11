package com.bs.dabom.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


	public class LoginCheckIntercepter  implements HandlerInterceptor {

		private Logger logger = LoggerFactory.getLogger(LoginCheckIntercepter.class);
		
		
		// 디스패쳐 서블릿서 컨트롤러 가기 전 
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			logger.info("[INTERCEPTOR] postHandle");

			if(request.getSession().getAttribute("login")==null 
					&&request.getRequestURI().contains("/login.do") ) {
				return true;
			}
			
			if(request.getSession().getAttribute("login")==null||request.getRequestURI().contains("/logout.do") ) {
				response.sendRedirect("login.do");
				return false;
			}
				
			return true;
			
			
		}

		//컨트롤러에서 디스패쳐 가기 전
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			  HttpSession session = request.getSession();
		        ModelMap modelMap = modelAndView.getModelMap();
		        Object userVO = modelMap.get("login");
		        
		        if(userVO != null) {
		        
		            // 로그인 성공시 Session에 저장후, 초기 화면 이동
		            logger.info("new login success");
		            session.setAttribute("login", userVO);
		            
		        }
		}

		//View 가 rendering 된 후 
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			logger.info("[INTERCEPTOR] afterCompletion");
			
		}
}
