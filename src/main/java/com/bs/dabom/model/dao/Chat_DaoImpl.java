package com.bs.dabom.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Chatroom_Dto;
import com.bs.dabom.model.dto.Member_Dto;
@Repository
public class Chat_DaoImpl implements Chat_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Override
	public List<Chatroom_Dto> chatroomlist(int member_no) {
		List<Chatroom_Dto> list =null;
		list = sqlSession.selectList(NAMESPACE+"getroomlist",member_no);
		for(Chatroom_Dto dto : list) {
			if(dto.getUser_one()==member_no) {
				String profile = sqlSession.selectOne(NAMESPACE+"getProfile",dto.getUser_two());
				String name = sqlSession.selectOne(NAMESPACE+"getName",dto.getUser_two());
				String lastMsg = sqlSession.selectOne(NAMESPACE+"lastchat",dto.getChatroom_no());
				dto.setMember_profile(profile);
				dto.setMember_name(name);
				dto.setLast_message(lastMsg);
				
				System.out.println(dto.toString());
				
			}else {
				String profile = sqlSession.selectOne(NAMESPACE+"getProfile",dto.getUser_one());
				String name = sqlSession.selectOne(NAMESPACE+"getName",dto.getUser_one());
				String lastMsg = sqlSession.selectOne(NAMESPACE+"lastchat",dto.getChatroom_no());
				dto.setMember_profile(profile);
				dto.setMember_name(name);
				dto.setLast_message(lastMsg);
			}
		}
		
		
		return list;
	}

	@Override
	public int isRoom(int chatroom_no) {
		int res  = sqlSession.selectOne(NAMESPACE+"isRoom",chatroom_no);
		return res;
	}

	@Override
	public int createRoom(Chatroom_Dto roomDto) {
		int res = 0;
		res = sqlSession.insert(NAMESPACE+"createRoom", roomDto);
		return res;
	}

	@Override
	public int getRoomnumber(Chatroom_Dto roomDto) {
		int res = 0;
		res = sqlSession.selectOne(NAMESPACE+"getRoomno" ,roomDto);
		return res;
	}

	
	
	@Override
	public List<Chatmsg_Dto> msglist(int chatroom_no) {
		List<Chatmsg_Dto> list = new ArrayList<Chatmsg_Dto>();
		list =sqlSession.selectList(NAMESPACE+"msglist" ,chatroom_no);
		
		return list;
	}

	@Override
	public String getName(int member_no) {
		String name = sqlSession.selectOne(NAMESPACE+"getName",member_no);
		return name;
	}

	@Override
	public List<Member_Dto> getNameProfile(int chatroom_no) {
			List<Member_Dto> list = null;
			list = sqlSession.selectList(NAMESPACE+"getNameProfile",chatroom_no);
		return list;
	}

	@Override
	public int existRoom(Chatroom_Dto roomDto) {
		int res = sqlSession.selectOne(NAMESPACE+"existRoom",roomDto);
		return res;
	}



}
