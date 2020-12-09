package com.bs.dabom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board_Controller {

	@RequestMapping("mainpage.do")
	public String mainpage(Model model) {
		
		return "mainpage";
	}
	
}
