package com.bs.dabom.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.dabom.model.biz.AddInfo_Biz;
import com.bs.dabom.model.dto.AddInfo_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class AddInfo_Controller {
	
	@Autowired
	private AddInfo_Biz biz;
	
	
	
	@RequestMapping("mypage_addinfo.do")
	public String AddInsert(Model model,HttpSession session) {
		Member_Dto member_dto = (Member_Dto)session.getAttribute("login");
		int member_no = member_dto.getMember_no();
		model.addAttribute("addinfo_dto", biz.selectOne(member_no));
		return "mypage_addinfo";
	}
	
	@RequestMapping("addinfo_insert.do")
	public String insert(Model model,HttpSession session,AddInfo_Dto dto) {
		Member_Dto member_dto = (Member_Dto)session.getAttribute("login");
		int member_no = member_dto.getMember_no();
		dto.setMember_no(member_no);
		int res = biz.insert(dto);
		if (res>0){
			return "redirect:mypage_addinfo.do";
		}
		
		
		return "mypage_main";
	}
	
	@RequestMapping("addinfo_update.do")
	public String update(Model model,HttpSession session,AddInfo_Dto dto) {
		Member_Dto member_dto = (Member_Dto)session.getAttribute("login");
		int member_no = member_dto.getMember_no();
		dto.setMember_no(member_no);
		System.out.println(dto);
		int res = biz.update(dto);
		if(res>0) {
			return "mypage_addinfo";
		}
		return "mypage_main";
		
	}
	
	@RequestMapping("addinfo_delete.do")
	public String delete(HttpSession session) {
		Member_Dto member_dto = (Member_Dto)session.getAttribute("login");
		int member_no = member_dto.getMember_no();
		int res = biz.delete(member_no);
		if(res>0) {
			return "mypage_main";
		}
		return "mypage_main";
	}
	
	@RequestMapping("cancel.do")
	public String cancel() {
		return "mypage_main";
	}
	

	
	
	
	

}
