package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bs.dabom.model.biz.Board_Biz;
import com.bs.dabom.model.biz.Donation_Biz;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.FileUploadService;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class Admin_Controller {
	
	@Autowired
	private Member_Biz memberbiz;
	
	@Autowired
	private Donation_Biz donationbiz; 
	
	@Autowired
	private Board_Biz biz;
	
//	@Autowired
//	private FileUploadService fileUploadService;
	
	@RequestMapping("/admin.do")
	public String admin_member_list(Model model) {
		model.addAttribute("memberlist", memberbiz.admin_member_list());
		return "admin_member_list";
	}
	
	@RequestMapping("/admin_board_list.do")
	public String mainpage(Model model, HttpSession session) {
		
		List<Board_Dto> list = biz.selectList();
		// 모든 board 글 내용을 List<Board_Dto>로 받아옴. 
		List<Member_Dto> npList = new ArrayList<Member_Dto>();
		// nameProp Dto 값 담을 List
		
		List<List<String>> urlHM = new ArrayList<List<String>>();
		// 게시글 당 Files_Dto, 

		
		for(int i=0; i < list.size(); i++) {
		// board의 총 갯수만큼 반복
			
			int member_no = list.get(i).getMember_no();
			// board의 i번째부터 끝까지의 회원 번호 
			Member_Dto nameProp = biz.getNameProp(member_no);
			// 회원번호를 써서 이름과 프로필을 가져옴
			npList.add(nameProp);
			// 그걸 List<Member_Dto>에 담음
			
			int board_no = list.get(i).getBoard_no();
			// board의 i번째부터 끝까지의 게시글 번호
			System.out.println("현재 board_no는" + board_no + "입니다.");
			// board의 i번째 게시판 번호
			List<Files_Dto> fileUrl = biz.getFileUrl(board_no);
			// 해당 게시글 번호(board_no)와 일치하는 files_Dto들을 List<>로 받음.
			// 다중 이미지 업로드를 했다면 여러 개가 List에 들어올 것임
				List<String> urlList = new ArrayList<String>();
				
				for(Files_Dto res : fileUrl) {
					String url = res.getFiles_url();
					urlList.add(url);
					
				 }
			
			urlHM.add(urlList);
			
			
			// 담음
			
		}	
		
		model.addAttribute("login", session.getAttribute("login"));
		// 로그인 정보 담아서 reply 이미지 아이콘 출력
		model.addAttribute("np", npList);
		model.addAttribute("list", list);
		model.addAttribute("url", urlHM);
		return "admin_board_list";
	}
	
}
