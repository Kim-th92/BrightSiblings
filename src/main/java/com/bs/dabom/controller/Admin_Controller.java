package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Board_Biz;
import com.bs.dabom.model.biz.Donation_Biz;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.dto.AdminPaging_Dto;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.FileUploadService;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

@Controller
public class Admin_Controller {

	@Autowired
	private Member_Biz memberbiz;

	@Autowired
	private Donation_Biz donationbiz;

	@Autowired
	private Board_Biz boardbiz;

	@RequestMapping("/admin.do")
	public String admin_member_list(Model model) {
		model.addAttribute("memberlist", memberbiz.admin_member_list());
		return "admin_member_list";
	}

	@RequestMapping("admin_select_list.do")
	public String admin_select_list(Model model, int member_no) {
		model.addAttribute("memberselect", memberbiz.admin_select_list(member_no));
		model.addAttribute("donationselect", donationbiz.selectDonationSum(member_no));
		return "admin_select_list";
	}

	@RequestMapping("/admin_board_list.do")
	public String mainpage(Model model, HttpSession session) {

		List<Board_Dto> list = boardbiz.adminBoardList();
		// 모든 board 글 내용을 List<Board_Dto>로 받아옴.
		List<Member_Dto> npList = new ArrayList<Member_Dto>();
		// nameProp Dto 값 담을 List

		List<List<String>> urlList = new ArrayList<List<String>>();
		// 게시글 file url String 담을

		List<List<Reply_Dto>> repList = new ArrayList<List<Reply_Dto>>();
		// 게시글 reply Dto 담을

		for (int i = 0; i < list.size(); i++) {
			// board의 총 갯수만큼 반복

			int member_no = list.get(i).getMember_no();
			// board의 i번째부터 끝까지의 회원 번호
			Member_Dto nameProp = boardbiz.getNameProp(member_no);
			// 회원번호를 써서 이름과 프로필을 가져옴
			npList.add(nameProp);
			// 그걸 List<Member_Dto>에 담음

			int board_no = list.get(i).getBoard_no();
			// board의 i번째부터 끝까지의 게시글 번호

			List<Files_Dto> fileUrl = boardbiz.getFileUrl(board_no);
			// 해당 게시글 번호(board_no)와 일치하는 files_Dto들을 List<>로 받음.
			// 다중 이미지 업로드를 했다면 여러 개가 List에 들어올 것임
			List<String> urlString = new ArrayList<String>();

			for (Files_Dto res : fileUrl) {
				String url = res.getFiles_url();
				urlString.add(url);
			}

			urlList.add(urlString);

			List<Reply_Dto> repData = boardbiz.getReply(board_no);
			// 댓글 Dto가 여러 개 담긴 List

			repList.add(repData);
		}

		model.addAttribute("login", session.getAttribute("login"));
		// 로그인 정보 담아서 reply 이미지 아이콘 출력
		model.addAttribute("reply", repList);
		model.addAttribute("np", npList);
		model.addAttribute("list", list);
		model.addAttribute("url", urlList);

		return "admin_board_list";
	}

	@ResponseBody
	@RequestMapping("/admin_board_paging.do")
	public Map<String, Object> admin_board_paging(@RequestParam("currentPage") int currentPage, HttpSession session) {
		System.out.println("Ajax에서 받은 currentPage : " + currentPage);

		AdminPaging_Dto pagingDto = new AdminPaging_Dto();
		pagingDto.setTotalCount(boardbiz.totalCount());
		pagingDto.setCurrentPage(currentPage);

		int pagingStop = pagingDto.Total_page_count();

		List<Board_Dto> list = boardbiz.adminBoardPaging(pagingDto.Start_no(), pagingDto.End_no());
		List<Member_Dto> npList = new ArrayList<Member_Dto>();
		List<List<String>> urlList = new ArrayList<List<String>>();
		List<List<Reply_Dto>> repList = new ArrayList<List<Reply_Dto>>();

		for (int i = 0; i < list.size(); i++) {

			int member_no = list.get(i).getMember_no();

			Member_Dto nameProp = boardbiz.getNameProp(member_no);

			npList.add(nameProp);

			int board_no = list.get(i).getBoard_no();

			List<Files_Dto> fileUrl = boardbiz.getFileUrl(board_no);

			List<String> urlString = new ArrayList<String>();

			for (Files_Dto res : fileUrl) {
				String url = res.getFiles_url();
				urlString.add(url);
			}

			urlList.add(urlString);

			List<Reply_Dto> repData = boardbiz.getReply(board_no);

			repList.add(repData);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagingList", list);
		map.put("pagingStop", pagingStop);
		map.put("pagingNpList", npList);
		map.put("pagingUrlList", urlList);
		map.put("pagingRepList", repList);
		
		return map;
		
	}

	@RequestMapping("/admin_donation_list.do")
	public String admin_donation_list(Model model) {
		model.addAttribute("admin_donation_list", donationbiz.selectList());
		return "admin_donation_list";
	}

	@RequestMapping("/admin_donation_detail.do")
	public String detaildonation(Model model, @RequestParam int member_no, String member_name) {
		model.addAttribute("admin_donation_detail", donationbiz.detailDonation(member_no));
		model.addAttribute("admin_donation_name", member_name);
		model.addAttribute("select_donation_sum", donationbiz.selectDonationSum(member_no));
		return "admin_donation_detail";
	}

}
