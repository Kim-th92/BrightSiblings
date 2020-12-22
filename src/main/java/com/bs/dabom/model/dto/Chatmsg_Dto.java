package com.bs.dabom.model.dto;



import lombok.Data;

@Data
public class Chatmsg_Dto {

	private int chatmessage_no;
	private String message;
	private int member_no;
	private String sendingtime;
	private int chatroomno;
	private Member_Dto memberDto;
	

	public Chatmsg_Dto() {
		
	}
	public Chatmsg_Dto(String content, int member_no,String sendingtime, int chatroom_no) {
		this.message =content;
		this.member_no = member_no;
		this.sendingtime = sendingtime;
		this.chatroomno = chatroom_no;
	}
}
