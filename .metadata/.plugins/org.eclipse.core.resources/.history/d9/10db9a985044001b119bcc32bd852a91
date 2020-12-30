package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.Chat_Dao;
import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Chatroom_Dto;
import com.bs.dabom.model.dto.Member_Dto;

@Service
public class Chat_BIzImpl implements Chat_Biz {

	@Autowired
	private Chat_Dao dao;
	
	@Override
	public List<Chatroom_Dto> chatroomlist(int member_no) {
		return  dao.chatroomlist(member_no);
	}

	@Override
	public Chatroom_Dto isRoom(int chatroom_no) {
		
		return dao.isRoom(chatroom_no);
	}

	@Override
	public int insertChat(List<Chatmsg_Dto> list) {
		return dao.insertChat(list);
	}

	@Override
	public int createRoom(Chatroom_Dto roomDto) {
		return dao.createRoom(roomDto);
	}

	@Override
	public int getRoomnumber(Chatroom_Dto roomDto) {
		return dao.getRoomnumber(roomDto);
	}

	@Override
	public List<Chatmsg_Dto> msglist(int chatroom_no) {
		return dao.msglist(chatroom_no);
	}

	@Override
	public String getName(int member_no) {
		return dao.getName(member_no);
	}

	@Override
	public List<Member_Dto> getNameProfile(int chatroom_no) {
		return dao.getNameProfile(chatroom_no);
	}

}
