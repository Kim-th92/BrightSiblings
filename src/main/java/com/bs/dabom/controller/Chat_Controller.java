package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Chat_Biz;
import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Chatroom_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class Chat_Controller {

	@Autowired
	private Chat_Biz chat_biz;
	
	
	@RequestMapping("chatroomlist.do")
	public @ResponseBody Map<String, Object> chatroomlist(@RequestParam("member_no") int member_no){
		List<Chatroom_Dto> list = chat_biz.chatroomlist(member_no);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("chatroomlist", list);
		if(list.isEmpty()) {
			map.put("check",false);
		}else {
			map.put("check", true);
		}
		return map;
	}
	
	@RequestMapping("chatmsglist.do")
	public  String chatmsglist(HttpServletRequest request,Model model,@RequestParam(required = false) Integer chatroom_no,@RequestParam(required = false)Integer member_no){
	
		HttpSession session = request.getSession();
		Member_Dto myDto = (Member_Dto)session.getAttribute("login");
		int myno = myDto.getMember_no();
		Chatroom_Dto roomDto =null;
		
		System.out.println(roomDto);
		
		if(chatroom_no !=null) {
			roomDto = chat_biz.isRoom(chatroom_no);
			if (roomDto==null) {
				roomDto = new Chatroom_Dto();
				roomDto.setUser_one(myno);
				roomDto.setUser_two(member_no);
				int res = chat_biz.createRoom(roomDto);
				if(res>0) {
					chatroom_no = chat_biz.getRoomnumber(roomDto);
					return "redirect:chatmsglist.do?chatroom_no="+chatroom_no;
				}else {
					return "redirect:mainpage.do";
				}
			}else {
				List<Chatmsg_Dto> list = new ArrayList<Chatmsg_Dto>();
				List<Member_Dto> memberlist = chat_biz.getNameProfile(chatroom_no);
				System.out.println("여기까진가......");
				list = chat_biz.msglist(chatroom_no);
				System.out.println("list 느느으으으으으ㅡㅇ"+list.toString());
				model.addAttribute("memberlist",memberlist);
				model.addAttribute("chatmsglist", list);
				return "chatroom";
		
			}
		}else {
			roomDto = new Chatroom_Dto();
			roomDto.setUser_one(myno);
			roomDto.setUser_two(member_no);
			int res = chat_biz.createRoom(roomDto);
			if(res>0) {
				chatroom_no = chat_biz.getRoomnumber(roomDto);
				return "redirect:chatmsglist.do?chatroom_no="+chatroom_no;
			}else {
				return "redirect:mainpage.do";
			}
		}
		
	
	}
	
	
	
	
}
