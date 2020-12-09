package com.bs.dabom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth1.OAuth1Parameters;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.snslogin.SNS;
import com.bs.dabom.snslogin.SNSLogin;

@Controller
public class Member_Controller {

	@Autowired
	private Member_Biz biz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Inject
	private SNS naverSns;
	
	@Inject
	private SNS googleSns;

	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	@RequestMapping("/login.do")
	public String snsLogin (Model model) throws Exception {
		System.out.println("루");
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSLogin googleLogin = new SNSLogin(googleSns);
//		model.addAttribute("google_url", googleLogin.getNaverAuthURL());
		
		/* 구글code 발행을 위한 URL 생성 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		
		return "login";
	}
	
	
	
	@RequestMapping("ajaxlogin.do")
	public Map<String,Boolean> login(@RequestBody Member_Dto dto,HttpSession session) {
		
		Member_Dto res =  biz.login(dto);
		
		boolean check = false;
		if(res!= null) {
			session.setAttribute("login", res);
			check=true;
		}
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		return map;
	} 
	

	
	
	@RequestMapping("register.do")
	public String register() {
		return "register";
	}
	
	@RequestMapping("registerres.do")
	public String registerRes(Member_Dto dto) {
		System.out.println(dto);
		dto.setMember_pw(passwordEncoder.encode(dto.getMember_pw()));
		
		if(biz.register(dto)>0)
			return "redirect:login.do";
		return "redirect:register.do";
	}
	
	@PostMapping("idcheck.do")
	public @ResponseBody Map<String,Integer> idchk(@RequestParam("member_id") String id) {	
		System.out.println(id);
		int value = biz.idChk(id);
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("value", value);
		return map;
	}
	
	
}
