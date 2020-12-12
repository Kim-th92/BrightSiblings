package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Friends_Biz;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class MyPage_Controller {

	@Autowired
	private Friends_Biz biz;
	
	@RequestMapping(value="mypage_friends.do",method=RequestMethod.GET)
	public String mypageMain(Model model,HttpSession session) {
		Member_Dto dto= (Member_Dto)session.getAttribute("login");
		int memberno = dto.getMember_no();
		System.out.println(memberno);
		List<Member_Dto> list = biz.friendsList(memberno);
		model.addAttribute("list",list);
		
		return "mypage_friends";
	}
	
	@RequestMapping("mypage_main.do")
	public String mypageFriends(Model model) {

		return "mypage_main";
	}
	
	@RequestMapping("mypage_food.do")
	public String mypageFood(Model model) {
		return "mypage_food";
	}
	
	@RequestMapping("mypage_exercise.do")
	public String mypageExercise(Model model) {
		return "mypage_exercise";
	}
	
	@RequestMapping("search.do")
	public @ResponseBody Map<String,Object> search(@RequestParam("keyword") String keyword) {
		System.out.println("keyword: " + keyword);
		List<Member_Dto> list = null;
				list = biz.searchFriends(keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(list.toString());
		
		if(list.isEmpty()) {
			map.put("check", "NO"); 
			map.put("searchlist",list);
			
		}else if(list != null) {
			map.put("check", "OK"); 
			map.put("searchlist",list);
		}
		
		return map;
	}
	
}
