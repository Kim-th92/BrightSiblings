package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Friends_Biz;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.biz.MyMain_Biz;
import com.bs.dabom.model.dto.Friends_Dto;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.model.dto.MyMain_Dto;

@Controller
public class FriendPage_Controller {

	@Autowired
	private Member_Biz member_biz;
	
	@Autowired
	private Friends_Biz friend_biz;
	
	@Autowired
	private MyMain_Biz mymain_biz;
	
	@RequestMapping("friendsmainpage.do")
	public String friendMainPage(@RequestParam("member_no") int member_no,Model model) {
		List<Member_Dto> list = friend_biz.friendsRequestList(member_no);
		model.addAttribute("requestlist", list);
		System.out.println(list.toString());
		
		return "friends_mainpage";
	}
	
	@RequestMapping("friendRequestCancel.do")
	public @ResponseBody Map<String,Integer> friendRequestCancel(@RequestBody Friends_Dto dto){
		int res = friend_biz.cancelRequest(dto);
		Map<String,Integer> map = new HashMap<String, Integer>();
		if(res>0) {
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}
		return map;
	}
	
	@RequestMapping("friendDetail.do")
	public String friendPage(Model model ,@RequestParam("member_no") int member_no,HttpSession session) {
		
		Member_Dto dto = member_biz.friendDetail(member_no);
		
		List<MyMain_Dto> board_list = mymain_biz.myList(member_no);
		
		List<String> urlList = new ArrayList<String>();
	
		for(int i=0; i < board_list.size(); i++) {
			
			List<String> egg = board_list.get(i).getUrlList();
			
			for(int j=0; j <= egg.size()-1; j++) {
				urlList.add(egg.get(j));
			}
			
		}
		
		model.addAttribute("url", urlList);
		model.addAttribute("list", board_list);
		model.addAttribute("login", dto);
		model.addAttribute("dto", dto);
		
		
		if(dto != null) {
			Member_Dto myDto = (Member_Dto)session.getAttribute("login");
			List<Member_Dto> list= new ArrayList<Member_Dto>();
			list = friend_biz.friendsList(myDto.getMember_no());
			int res = 0;
			System.out.println(list.toString());
			for(Member_Dto friend : list) {
				if(friend.getMember_no() == dto.getMember_no() ) {
					res = 1; //친구일때
					break;
				}else {
					res = 0; //친구아님 
				}
				
			}
			
			
			model.addAttribute("res",res);
		}else {
			return "redirect:mainpage.do";
		}
		
		return "frienddetail";
	}
	
	@RequestMapping("friendRequest.do")
	public @ResponseBody Map<String,Integer> friendRequest(@RequestBody Friends_Dto friends_dto){
		int res = friend_biz.friendRequest(friends_dto);
		Map<String, Integer> map = new HashMap<String, Integer>();
		if(res>0) {
			map.put("result", 1);
		}else {
			map.put("result",0);
		}
		return map;
	}
	
	@RequestMapping("friendAccepted.do")
	public @ResponseBody Map<String, Integer> friendAccepted(@RequestParam("friend_no") int friend_no,HttpSession session){
		Member_Dto myDto  = (Member_Dto)session.getAttribute("login");
		int myno = myDto.getMember_no();
		int res = friend_biz.friendAccepted(friend_no,myno);
		
		return null;
	}
	
	@RequestMapping("friendDennied.do")
	public @ResponseBody Map<String, Integer> friendDennied(@RequestParam("friend_no") int friend_no,HttpSession session){
		Member_Dto myDto  = (Member_Dto)session.getAttribute("login");
		int myno = myDto.getMember_no();
		int res = friend_biz.friendDennied(friend_no,myno);
		Map<String,Integer> map = new HashMap<String, Integer>();
		if(res>0)
			map.put("result", 1);
		else
			map.put("result", 0);
		return map;
	}
	
}
