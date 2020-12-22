package com.bs.dabom.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
		return "mainpage";
	}
	
	
	@RequestMapping("/write.do")
	public String write() {
		return "write";
	}	
	
	@RequestMapping("updateres.do")
	public String updateres(Model model,@RequestParam("board_no") int board_no,
										@RequestParam("board_content") String board_content,
										@RequestParam("file1") List<MultipartFile> file, 
										HttpServletRequest request,
										HttpSession session) {
		
		Member_Dto member_dto= (Member_Dto)session.getAttribute("login");
		int data = member_dto.getMember_no();
		// 회원 번호
		
		String url = "";
		// url 스트링
		
		boolean result = false;
		
		Board_Dto dto = new Board_Dto(board_no, board_content);
		
		int res = biz.update(dto);
		
		
			for (int i = 0; i < file.size(); i++) {
				
				MultipartFile mp = file.get(i);
				// mp에 든 file을 하나 하나씩 꺼냄.
				
				url = fileUploadService.restore(mp, request);
				// 파일 하나 하나씩 실제 폴더에 업로드, 파일명은 url
				
				Files_Dto files_dto = new Files_Dto(board_no, url);
				// 게시판 번호, url List
				// ------------------------------------------
				
				
				
				// -----------------------------------------
				int fileres = biz.insertFile(files_dto);
				// files DB 테이블 저장
				
				if (fileres != 0) {
					result = true;
				} 
			}
			
			
		// 1. 업로드 할 이미지 폴더에 업로드 non-DB
			
		// 2. 기존에 있던 Files 정보 지우기 DB
		
		// 3. content 내용으로 엎어쓰기 DB	
		
		// 4. 올릴 File정보 업로드 DB
		
		// int res = biz.update(board_no);
		
		
		
		return "";
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
	
	@RequestMapping("/writeReply.do")
	public @ResponseBody Map<String,String> replyUpload(HttpSession session){
		
		Member_Dto member_dto = (Member_Dto)session.getAttribute("login");
		
		String member_id = member_dto.getMember_id();
		
		return null;
	}
	
	@RequestMapping("/update.do")
	public String update(Model model, HttpSession session, int board_no) {
		// board_no 수정할 게시판 번호
	
		Member_Dto member_dto = (Member_Dto)session.getAttribute("login");
		// 세션의 로그인 정보
		
		Board_Dto dto = biz.selectOne(board_no);
		// 해당 게시판 board 정보
		
		List<Files_Dto> fileUrl = biz.getFileUrl(board_no);
		// 게시판 번호로 url List Files_Dto 정보 받아옴
		
		List<String> url = new ArrayList<String>();
		
			for(Files_Dto res : fileUrl) {
				String result = res.getFiles_url();
				url.add(result);
			}
		
		Member_Dto nameProp = biz.getNameProp(member_dto.getMember_no());
		System.out.println("NameProp 정보" + nameProp);
		model.addAttribute("login", member_dto);
		model.addAttribute("url", url);
		
		return "update";
	}
	
	@RequestMapping("/delete.do")
	public String delete(Model model, int board_no) {
		int res = biz.delete(board_no);
		return "redirect:mainpage.do";
	}
	
	@RequestMapping("/youtube.do")
	public String youtube() {
		return "youtube";
	}
}


