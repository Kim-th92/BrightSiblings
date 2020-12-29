package com.bs.dabom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.dabom.model.biz.FoodPaging_Biz;
import com.bs.dabom.model.dto.Paging_Dto;

@Controller
public class Food_Controller {

	@Autowired
	private FoodPaging_Biz biz;
	
	@RequestMapping("foodlist.do")
	public String boardList(Paging_Dto  dto ,Model model,
			@RequestParam (value="nowPage",required=false)String nowPage,
			@RequestParam (value="cntPerPage",required=false)String cntPerPage,
			@RequestParam (value="keyword",required=false)String keyword) {
		int total = biz.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		dto= new Paging_Dto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),keyword);
		model.addAttribute("paging", dto);
		model.addAttribute("viewAll", biz.selectFood(dto));
		return "foodlist";
		
	}
	
}
