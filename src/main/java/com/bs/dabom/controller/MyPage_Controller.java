package com.bs.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPage_Controller {

	@RequestMapping(value="mypage_main.do",method=RequestMethod.GET)
	public String mypageMain(Model model) {
		return "mypage_main";
	}
}
