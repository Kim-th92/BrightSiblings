package com.bs.dabom.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Donation_Biz;
import com.bs.dabom.model.dto.Donation_Dto;

@Controller
public class Donation_Controller {
	
	@Autowired
	private Donation_Biz biz;
	
	@RequestMapping("/listdonation.do")
	public String listdonation(Model model) {
		model.addAttribute("list", biz.selectList());
		return "listdonation";
	}
	
	@RequestMapping("/detaildonation.do")
	public String detaildonation(Model model, @RequestParam int member_no, String member_name) {
		model.addAttribute("detaildonation_list", biz.detailDonation(member_no));
		model.addAttribute("donation_name", member_name);
		model.addAttribute("select_donation_sum", biz.selectDonationSum(member_no));
		return "detaildonation";
	}
	
	@ResponseBody
	@RequestMapping("insertdonation.do")
	public Map<String,Object> insertdonation(
			@RequestParam("member_no") int member_no,
			@RequestParam("donation") int donation) {
		System.out.println("mem : " + member_no);
		System.out.println("don : " + donation);
		
		Donation_Dto dto = new Donation_Dto();
		dto.setMember_no(member_no);
		dto.setDonation(donation);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int res = biz.insertDonation(dto);
		if(res > 0) {
			map.put("member_no", member_no);
			map.put("donation", donation);
			return map;
		} else {
			member_no = -1;
			donation = -1;
		}
		map.put("member_no", member_no);
		map.put("donation", donation);
		
		return map;
	}
	
}
