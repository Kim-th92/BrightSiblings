package com.bs.dabom.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.Friends_Biz;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.dto.Member_Dto;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
@Controller
public class MyPage_Controller {

	@Autowired
	private Member_Biz member_biz;
	
	public static void main(String[] args) {
		  System.out.println("내프로젝트의 루트경로는?  " + System.getProperty("user.dir")); 
	}
	@Autowired
	private Friends_Biz biz;
	
	@RequestMapping(value="mypage_friends.do",method=RequestMethod.GET)
	public String mypageMain(Model model,HttpSession session) {
		Member_Dto dto= (Member_Dto)session.getAttribute("login");
		int memberno = dto.getMember_no();
		System.out.println(memberno);
		List<Member_Dto> list = biz.friendsList(memberno);
		model.addAttribute("list",list);
		

		return "mypage_friends";
	}
	
	@RequestMapping("mypage_main.do")
	public String mypageFriends(Model model) {

		return "mypage_main";
	}
	
	@RequestMapping("mypage_food.do")
	public String mypageFood(Model model) {
		return "mypage_food";
	}
	
	@RequestMapping("mypage_exercise.do")
	public String mypageExercise(Model model) {
		return "mypage_exercise";
	}
	
	@RequestMapping("search.do")
	public @ResponseBody Map<String,Object> search(@RequestParam("keyword") String keyword,HttpSession session) {


		Member_Dto dto= (Member_Dto)session.getAttribute("login");
		int member_no  = dto.getMember_no();
		
		List<Member_Dto> list = null;
				list = biz.searchFriends(keyword,member_no);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(list.isEmpty()) {
			map.put("check", "NO"); 
			map.put("searchlist",list);
		}else if(list != null) {
			map.put("check", "OK"); 
			map.put("searchlist",list);
		}
		
		return map;
	}
	
	
	//파일업로드 서비스는 멤버에 위치
	@RequestMapping("profilePicUpload.do")
	public @ResponseBody Map<String, Integer> profilePicUpload(HttpSession session,MultipartHttpServletRequest mtf) throws UnsupportedEncodingException{
		MultipartFile file = mtf.getFile("file");
		boolean isc = file.isEmpty();
		
		Member_Dto member_dto = (Member_Dto) session.getAttribute("login");
		
		System.out.println(member_dto.getMember_no());
		if(isc ==true) {
			
			member_dto.setMember_profile("resources/image/profile-default.jpg");
			
		}else {
			
			String oriName = file.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			String filePath = mtf.getSession().getServletContext().getRealPath("/");
			
			InputStream inputStream =null;
			OutputStream outputStream = null;
			
			System.out.println(oriName);
			System.out.println(ext);
			System.out.println(filePath);
			

			try {
				inputStream = file.getInputStream();
				String path = mtf.getSession().getServletContext().getRealPath("/resources/profile_img");
			
				System.out.println("업로드될 실제 경로 : " + path);
				
				File storage = new File(path);
				if(!storage.exists()) {
					storage.mkdir();
				}
				
				File newFile = new File(path +"/" + oriName);
				if(!newFile.exists()) {
					newFile.createNewFile();
				}
				
				outputStream = new FileOutputStream(newFile);
				
				int read = 0;
				byte[] b = new byte[(int)file.getSize()];
				
				while((read=inputStream.read(b))!= -1) {
					outputStream.write(b,0,read);
					
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			member_dto.setMember_profile("resources/profile_img/"+ oriName);
			
		}
		
		int result = member_biz.uploadProfile(member_dto);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		
		return map;
	}
	
}
	
	
	
				
		
