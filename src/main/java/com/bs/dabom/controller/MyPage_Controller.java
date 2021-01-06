package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bs.dabom.model.biz.FoodPaging_Biz;
import com.bs.dabom.model.biz.Friends_Biz;
import com.bs.dabom.model.biz.Member_Biz;
import com.bs.dabom.model.biz.MyPage_Biz;
import com.bs.dabom.model.dto.Dailyfoodrecord_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.model.dto.MyPage_Dto;
import com.bs.dabom.model.dto.Paging_Dto;
import com.bs.dabom.model.dto.Reply_Dto;
import com.bs.dabom.model.dto.AddInfo_Dto;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.biz.AddInfo_Biz;
import com.bs.dabom.model.biz.Board_Biz;
import com.bs.dabom.model.biz.Board_BizImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
@Controller
public class MyPage_Controller {

	@Autowired
	private Member_Biz member_biz;
	@Autowired
	private FoodPaging_Biz food_biz;
	@Autowired
	private MyPage_Biz mypage_biz;
	@Autowired
	private Board_Biz board_biz;
	


	
	public static void main(String[] args) {
		  System.out.println("내프로젝트의 루트경로는?  " + System.getProperty("user.dir")); 
	}
	@Autowired
	private Friends_Biz friend_biz;
	
	@RequestMapping(value="mypage_friends.do",method=RequestMethod.GET)
	public String mypageMain(Model model,HttpSession session) {
		Member_Dto dto= (Member_Dto)session.getAttribute("login");
		int memberno = dto.getMember_no();
		List<Member_Dto> list = friend_biz.friendsList(memberno);
		List<Member_Dto> requestlist = friend_biz.friendsRequestList(dto.getMember_no());
		List<Member_Dto> requestinglist = friend_biz.friendsRequestingList(memberno);
	
		model.addAttribute("requestlist", requestlist);
		model.addAttribute("list",list);
		model.addAttribute("requestinglist",requestinglist);
		
		return "mypage_friends";
	}
	
	@RequestMapping("mypage_main.do")
	public String mypageFriends(Model model,HttpSession session) {
		Member_Dto dto= (Member_Dto)session.getAttribute("login");
		
		
		List<Board_Dto> list = mypage_biz.selectList(dto.getMember_no());
		// 모든 board 글 내용을 List<Board_Dto>로 받아옴. 
		List<Member_Dto> npList = new ArrayList<Member_Dto>();
		// nameProp Dto 값 담을 List
		
		List<List<String>> urlList = new ArrayList<List<String>>();
		// 게시글 file url String 담을 
		
		List<List<Reply_Dto>> repList = new ArrayList<List<Reply_Dto>>();
		// 게시글 reply Dto 담을
		
		for(int i=0; i < list.size(); i++) {
		// board의 총 갯수만큼 반복

			
			int board_no = list.get(i).getBoard_no();
			// board의 i번째부터 끝까지의 게시글 번호
			
			List<Files_Dto> fileUrl = mypage_biz.getFileUrl(board_no);
			// 해당 게시글 번호(board_no)와 일치하는 files_Dto들을 List<>로 받음.
			// 다중 이미지 업로드를 했다면 여러 개가 List에 들어올 것임
				List<String> urlString = new ArrayList<String>();
				
				for(Files_Dto res : fileUrl) {
					String url = res.getFiles_url();
					urlString.add(url);
				 }
			
			urlList.add(urlString);
			
			
			List<Reply_Dto> repData = mypage_biz.getReply(board_no);
			// 댓글 Dto가 여러 개 담긴 List
			
			repList.add(repData);
				
				
		}	
		// 로그인 정보 담아서 reply 이미지 아이콘 출력
		model.addAttribute("reply", repList);
		model.addAttribute("list", list);
		model.addAttribute("url", urlList);
		
		return "mypage_main";
	}
	
	@ResponseBody
	@RequestMapping("mypage_delete.do")
	public Map<String, Object> delete(Model model, @RequestParam("board_no")int board_no) {
		System.out.println(board_no+"<<<<<<<");
		board_biz.delete(board_no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", "success");
		return map;
	}
	
	@RequestMapping("mypage_food.do")
	public String mypageFood(Model model,Paging_Dto  dto,
			@RequestParam (value="nowPage",required=false)String nowPage,
			@RequestParam (value="cntPerPage",required=false)String cntPerPage,
			@RequestParam (value="keyword",required=false)String keyword,
			HttpSession session) {
	
		//푸드딕셔너리 페이징
		int total = food_biz.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		dto= new Paging_Dto(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),keyword);
		model.addAttribute("paging", dto);
		model.addAttribute("viewAll", food_biz.selectFood(dto));

		// 오늘 먹은 칼로리 
		Member_Dto member_dto= (Member_Dto)session.getAttribute("login");
		int member_no = member_dto.getMember_no();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        
        Dailyfoodrecord_Dto dailyFoodDto = new Dailyfoodrecord_Dto();
        dailyFoodDto.setMember_no(member_no);
        dailyFoodDto.setToday(strToday);
		
        int dailyKcal = food_biz.selectDailyRecord(dailyFoodDto);
        List<Dailyfoodrecord_Dto> list = new ArrayList<Dailyfoodrecord_Dto>();
        list = food_biz.selectDailyFoodRecord(dailyFoodDto);
        model.addAttribute("dailyKcal", dailyKcal);
        System.out.println(list.toString());
        model.addAttribute("dailyFoodList",list);

		return "mypage_food";
	}
	
	@RequestMapping("fooddb.do")
	public Map<String,String> insertfooddb(){
		return null;
	}
	
	@RequestMapping("mypage_exercise.do")
	public String mypageExercise(Model model, HttpSession session) {
		Member_Dto login = (Member_Dto)session.getAttribute("login");
		int member_no = login.getMember_no();
		model.addAttribute("list", mypage_biz.showList(member_no));
		model.addAttribute("total", mypage_biz.total(member_no));
		System.out.println("asdfaf4w4e3r24fe2e4" + mypage_biz.total(member_no));
		return "mypage_exercise";
	}
	
	@RequestMapping("distanceres.do")
	public String distanceres(Model model, MyPage_Dto dto) {
		int res = mypage_biz.distanceInsert(dto);
		if (res > 0) {
			return "redirect:mypage_exercise.do";
		} else {
			return "redirect:mypage_exercise.do";
		}
	}
	
	@RequestMapping("search.do")
	public @ResponseBody Map<String,Object> search(@RequestParam("keyword") String keyword,HttpSession session) {


		Member_Dto dto= (Member_Dto)session.getAttribute("login");
		int member_no  = dto.getMember_no();
		
		List<Member_Dto> list = null;
				list = friend_biz.searchFriends(keyword,member_no);
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
	
	//멤버배경 사진업로드 멤버에위치 
	@RequestMapping("profilePicBgUpload.do")
	public @ResponseBody Map<String,Integer> profileBgPicUpload(HttpSession session,MultipartHttpServletRequest mtf){
		MultipartFile file = mtf.getFile("file");
		//파일이 빈파일인지 유효성 검사 
		boolean isc = file.isEmpty();
		
		Member_Dto member_dto = (Member_Dto) session.getAttribute("login");
		
		if(isc ==true) {
			
			member_dto.setMember_bgprofile("resources/image/profile-bg.png");
			
		}else {
			
			String oriName = file.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			String filePath = mtf.getSession().getServletContext().getRealPath("/");
			
			InputStream inputStream =null;
			OutputStream outputStream = null;
			

			try {
				inputStream = file.getInputStream();
				String path = mtf.getSession().getServletContext().getRealPath("/resources/bg_profile_img");
				
				
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
			
			member_dto.setMember_bgprofile("resources/bg_profile_img/"+ oriName);
			
		}
		
		int result = member_biz.uploadBgProfile(member_dto);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		
		return map;
	
	}
	
	//선택한 파일업로드
	@RequestMapping("profileExPicBgUpload.do")
	public @ResponseBody Map<String,Integer> profileExPicBgUpload(HttpSession session,@RequestParam("bg_profile") String bg_profile){
		Member_Dto member_dto = (Member_Dto) session.getAttribute("login");
		
		member_dto.setMember_bgprofile(bg_profile);
		int result = member_biz.uploadBgProfile(member_dto);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
		return map;
	}
	
	//파일업로드 서비스는 멤버에 위치
	@RequestMapping("profilePicUpload.do")
	public @ResponseBody Map<String, Integer> profilePicUpload(HttpSession session,MultipartHttpServletRequest mtf) throws UnsupportedEncodingException{
		MultipartFile file = mtf.getFile("file");
		//파일이 빈파일인지 유효성 검사 
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
	
	
	
				
		
