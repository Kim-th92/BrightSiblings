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
import com.bs.dabom.model.biz.MyMain_Biz;
import com.bs.dabom.model.biz.MyPage_Biz;
import com.bs.dabom.model.dto.Calendar_Dto;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Dailyfoodrecord_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.Member_Dto;
import com.bs.dabom.model.dto.MyMain_Dto;
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
	@Autowired
	private MyMain_Biz mymain_biz;
	
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
		int member_no = dto.getMember_no();
		
		List<MyMain_Dto> board_list = mymain_biz.myList(member_no);
		
		List<String> urlList = new ArrayList<String>();
	
		for(int i=0; i < board_list.size(); i++) {
			
			List<String> egg = board_list.get(i).getUrlList();
			
			for(int j=0; j <= egg.size()-1; j++) {
				urlList.add(egg.get(j));
			}
			
		}
		
		model.addAttribute("url", urlList);
		model.addAttribute("list", board_list);
		model.addAttribute("login", dto);
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
		List<MyPage_Dto> total = new ArrayList<MyPage_Dto>(); 
		total = mypage_biz.total(member_no);
		
		System.out.println("여기까지왔고");
		System.out.println(total.get(0));
		System.out.println(total);
		
		
		if (total.get(0) == null) {
			
			System.out.println("null이면");
			System.out.println(total);
			System.out.println(total.get(0));
			
			model.addAttribute("td", 0);
		} else {
			
			System.out.println("null이 아니면");
			System.out.println(total);
			System.out.println(total.get(0));
			
			int td = total.get(0).getTotal_distance();
			float tbk = total.get(0).getTotal_burn_kcal();
			model.addAttribute("td", td);
			model.addAttribute("tbk", tbk);
		}
		
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
	
	@RequestMapping(value= "calendarAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> calendarAjax(@RequestParam("member_no") int member_no,
											@RequestParam("yyyyMMdd") String yyyyMMdd) {
		
		List<Calendar_Dto> list1 = new ArrayList<Calendar_Dto>();
		List<Calendar_Dto> list2 = new ArrayList<Calendar_Dto>();
		
		Calendar_Dto dto = new Calendar_Dto();
		dto.setMember_no(member_no);
		dto.setYyyyMMdd(yyyyMMdd);
		
		float tk = mypage_biz.showTargetKcal(dto);

		list1 = mypage_biz.showTotalDFR(dto);
		list2 = mypage_biz.showTotalDER(dto);
		
		float tik = list1.get(0).getTotal_intake_kcal();
		int td = list2.get(0).getTotal_distance();
		float tbk = list2.get(0).getTotal_burn_kcal();
		
		System.out.println(tk);
		System.out.println(tik);
		System.out.println(td);
		System.out.println(tbk);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tk", tk);
		map.put("tik", tik);
		map.put("td", td);
		map.put("tbk", tbk);
		
		return map;
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
	
	@RequestMapping("mypage_pose.do")
	public String mypage_pose() {
		System.out.println("mypage_pose.do");
		return "mypage_pose";
	}
	
}
	
	
	
				
		
