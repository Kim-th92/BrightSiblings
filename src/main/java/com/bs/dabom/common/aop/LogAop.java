package com.bs.dabom.common.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class LogAop {

	public void before(JoinPoint join) { 
		Logger logger = LoggerFactory.getLogger(join.getTarget()+""); //대상 객체  (cc)
		logger.info("---------------------AOP start");
		
		Object[] args = join.getArgs();												//대상(겟args) 파라미터
		if(args != null) {
			logger.info("method :"+join.getSignature().getName());    	//시그니쳐는 메소드 
			for(int i = 0 ; i<args.length;i++) {
				logger.info(i + "번째 : "+ args[i]);
			}
		}
		
	}
	public void after(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+""); //대상 객체  (cc)
		logger.info("---------------------AOP end-----------------");
		
	}
	
	public void afterThrowing(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget()+""); //대상 객체  (cc)
		logger.info("---------------------ERROR Log");
		logger.info("* Error : " +join.getArgs());
		logger.info("* Error : " +join);
	}
}

