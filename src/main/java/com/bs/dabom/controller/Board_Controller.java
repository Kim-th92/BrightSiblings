package com.bs.dabom.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.bs.dabom.model.biz.Board_Biz;
import com.bs.dabom.model.biz.Board_BizImpl;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.FileUploadService;
import com.bs.dabom.model.dto.Member_Dto;

@Controller
public class Board_Controller {

	@Autowired
	private Board_Biz biz;
	
	@Autowired
	private FileUploadService fileUploadService;
	
	@RequestMapping("mainpage.do")
	public String mainpage(Model model) {
		// 피드에 이미지 뿌려 줄 코드 작성 
		return "mainpage";
	}
	
	
	@RequestMapping("/write.do")
	public String write() {
		return "write";
	}	
	
	@RequestMapping("/upload.do")
	public String upload(
			Model model,
			@RequestParam("email") String email,
			@RequestParam("file1") MultipartFile file) {
		
		String url = fileUploadService.restore(file);
		model.addAttribute("url", url);
		return "NewFile";
	}
	
	@RequestMapping("/youtube.do")
	public String youtube() {
		return "youtube";
	}
}


