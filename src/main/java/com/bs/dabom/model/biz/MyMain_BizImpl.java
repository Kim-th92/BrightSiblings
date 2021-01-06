package com.bs.dabom.model.biz;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.MyMain_Dao;
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
import com.bs.dabom.model.dto.MyMain_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

@Service
public class MyMain_BizImpl implements MyMain_Biz {

	@Autowired
	private MyMain_Dao dao;
	
	@Override
	public List<MyMain_Dto> myList(int member_no) {
	
		List<Board_Dto> board_list = dao.myList(member_no); // 로그인한 회원의 모든 게시글 정보
		List<Files_Dto> files_list = dao.myUrl(); // 모든 이미지 정보
		List<Reply_Dto> reply_list = dao.myReply(); // 모든 댓글 정보
		
		//------------------------//
		List<Integer> bn_list = new ArrayList<Integer>(); // 회원이 작성한 모든 게시글 번호들 순서대로
		
		for(int i=0; i<board_list.size(); i++) {
			bn_list.add(board_list.get(i).getBoard_no());
		}
		Iterator<Integer> bnlist_It = bn_list.iterator();
		//------------------------//
		
		List<MyMain_Dto> res = new ArrayList<MyMain_Dto>(); //마지막에 리턴할 것
		
		int count = 0;
		
		while(bnlist_It.hasNext()) {
			
				int out = bnlist_It.next(); // board_no 하나 하나마다
				MyMain_Dto dto = new MyMain_Dto();
				List<String> url_list_inner = new ArrayList<String>(); // url List 만들어줌
				List<String> rep_list_inner = new ArrayList<String>(); // rep List 만들어줌
				
				for(int i=0; i < files_list.size(); i++) {
					
					if(out == files_list.get(i).getBoard_no()) { // 만약 게시글 번호와 files_의 게시글 번호와 일치하는게 나타나면
						url_list_inner.add(files_list.get(i).getFiles_url()); // 그 url List에 넣음
					}
					
				}
				
				for(int i=0; i < reply_list.size(); i++) {
					if(out == reply_list.get(i).getBoard_no()) {
						String reply = reply_list.get(i).getMember_id()+" "+reply_list.get(i).getReply_content();
						rep_list_inner.add(reply);
					}
				}
				
				dto.setBoard_no(board_list.get(count).getBoard_no());
				dto.setMember_no(board_list.get(count).getMember_no());
				dto.setBoard_content(board_list.get(count).getBoard_content());
				dto.setBoard_regdate(board_list.get(count).getBoard_regdate());
				dto.setUrlList(url_list_inner);
				dto.setReplyList(rep_list_inner);
				
				count++;
				res.add(dto);
		}
		
		
		
		return res;
	}

}
