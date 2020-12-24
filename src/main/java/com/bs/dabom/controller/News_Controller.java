package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.dabom.model.biz.News_Biz;
import com.bs.dabom.model.dao.News_Dao;
import com.bs.dabom.model.dto.News_Dto;

@Controller
public class News_Controller {

	@Autowired
	News_Biz biz;
	
	@RequestMapping("news.do")
	public String newsMain(Model model,@RequestParam(required = false) String keyword) {
		System.out.println("keyword ======="+keyword);
		if(keyword !=null) {
			List<News_Dto> list = new ArrayList<News_Dto>();
			list = biz.selectNewsList(keyword);
			
			model.addAttribute("list",list);
		}
		
		return "news_main";
	}
	

	

}
