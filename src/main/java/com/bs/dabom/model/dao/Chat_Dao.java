package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Chatroom_Dto;
import com.bs.dabom.model.dto.Member_Dto;

public interface Chat_Dao {

	String NAMESPACE = "chatmapper.";
	
	public List<Chatroom_Dto> chatroomlist(int member_no);

	public int isRoom(int chatroom_no);


	public int createRoom(Chatroom_Dto roomDto);

	public int getRoomnumber(Chatroom_Dto roomDto);

	public List<Chatmsg_Dto> msglist(int chatroom_no);

	public String getName(int member_no);

	public List<Member_Dto> getNameProfile(int chatroom_no);

	public int existRoom(Chatroom_Dto roomDto);

}
