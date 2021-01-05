package com.bs.dabom.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.FoodPaging_Biz;
import com.bs.dabom.model.dto.Dailyfoodrecord_Dto;
import com.bs.dabom.model.dto.Food_Dto;
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
	
	@GetMapping("fooddetail.do")
	public  @ResponseBody Map<String,Object> foodDetail(@RequestParam (value="food_no",required=false)int food_no){
		Map<String,Object> map = new HashMap<String, Object>();
		Food_Dto dto = new Food_Dto();
		dto = biz.foodDetail(food_no);
		map.put("fooddetail", dto);
		
		return map;
	}
	
	@RequestMapping("dailyfood.do")
	public @ResponseBody Map<String,Object> dailyFood(@RequestBody Dailyfoodrecord_Dto dto) {
		int res = biz.insertDailyFood(dto);
		Map<String,Object> map = new HashMap<String, Object>();
		if(res>0) {
			map.put("result", "OK");
		}else {

			map.put("result", "OK");
		}
		return map;
		
	}
	
}
