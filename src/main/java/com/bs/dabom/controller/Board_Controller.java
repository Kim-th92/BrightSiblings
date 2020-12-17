package com.bs.dabom.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.bs.dabom.model.biz.Board_Biz;
import com.bs.dabom.model.biz.Board_BizImpl;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.FileUploadService;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class Board_Controller {

	@Autowired
	private Board_Biz biz;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping("mainpage.do")
	public String mainpage(Model model, HttpSession session) {
		
		List<Board_Dto> list = biz.selectList();
		List<Member_Dto> npList = new ArrayList<Member_Dto>();
		List<Files_Dto> urlList = new ArrayList<Files_Dto>();
		
		for(int i=0; i < list.size(); i++) {
			int member_no = list.get(i).getMember_no();
			Member_Dto nameProp = biz.getNameProp(member_no);
			npList.add(nameProp);
			
			int board_no = list.get(i).getBoard_no();
			Files_Dto fileUrl = biz.getFileUrl(board_no);
			urlList.add(fileUrl);
			
		}	
		model.addAttribute("login", session.getAttribute("login"));
		// 로그인 정보 담아서 reply 이미지 아이콘 출력
		model.addAttribute("np", npList);
		model.addAttribute("list", list);
		model.addAttribute("url", urlList);
		return "mainpage";
	}
	
	
	@RequestMapping("/write.do")
	public String write() {
		return "write";
	}	
	
	@RequestMapping("/upload.do")
	public String upload(Model model, @RequestParam("text") String text, @RequestParam("file1") List<MultipartFile> file, HttpServletRequest request,HttpSession session) {
		
		String url = "";
		// url 변수
		boolean result = false;
		
		Member_Dto member_dto= (Member_Dto)session.getAttribute("login");
		int data = member_dto.getMember_no();
		// 회원 번호
		
		// List 변수
		
		Board_Dto board_dto = new Board_Dto(data,text);
		// 회원번호, 글내용
		
		int textres = biz.insert(board_dto);
		// board 테이블 저장
		
		int val = 0;
		// board_no 변수
		
		if (textres > 0) {
			val = biz.getVal();
			// 게시판 번호 
			
				for (int i = 0; i < file.size(); i++) {
					
					MultipartFile mp = file.get(i);
					// mp에 든 file을 하나 하나씩 꺼냄.
					
					url = fileUploadService.restore(mp, request);
					// 파일 하나 하나씩 폴더에 업로드, 파일명은 url
					
					Files_Dto files_dto = new Files_Dto(val, url);
					// 게시판 번호, url List
					
					int fileres = biz.insertFile(files_dto);
					// files 테이블 저장
					
					if (fileres != 0) {
						result = true;
					} 
				}
		}
		return result ? "redirect:mainpage.do" : "redirect:write.do";
	}
	
	@RequestMapping("/update.do")
	public String update(Model model) {
		return "";
	}
	
	@RequestMapping("/delete.do")
	public String delete(Model model, int board_no) {
		int res = biz.delete(board_no);
		return "redirect:mainpage.do";
	}
}


