package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.dabom.model.biz.Friends_Biz;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class FriendPage_Controller {

	@Autowired
	private Member_Biz member_biz;
	
	@Autowired
	private Friends_Biz friend_biz;
	
	@RequestMapping("friendsmainpage.do")
	public String friendMainPage(@RequestParam("member_no") int member_no,Model model) {
		List<Member_Dto> list = friend_biz.friendsRequest(member_no);
		model.addAttribute("requestlist", list);
		System.out.println(list.toString());
		
		return "friends_mainpage";
	}
	
	@RequestMapping("friendDetail.do")
	public String friendPage(Model model ,@RequestParam("member_no") int member_no,HttpSession session) {
		Member_Dto dto = member_biz.friendDetail(member_no);
		if(dto != null) {
			Member_Dto myDto = (Member_Dto)session.getAttribute("login");
			List<Member_Dto> list= new ArrayList<Member_Dto>();
			list = friend_biz.friendsList(myDto.getMember_no());
			int res = 0;
			System.out.println(list.toString());
			for(Member_Dto friend : list) {
				if(friend.getMember_no() == dto.getMember_no() ) {
					res = 1; //친구일
					break;
				}else {
					res = 0;	 //친구아님 
				}
				
			}
			System.out.println("res"+res);
			model.addAttribute("dto", dto);
			model.addAttribute("res",res);
		}else {
			return "redirect:mainpage.do";
		}
		
		return "frienddetail";
	}
	
}
