package com.bs.dabom.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Chatroom_Dto {

	private  int chatroom_no;
	private int user_one;
	private int user_two;
	private Date created;
	private String member_profile;
	private String member_name;
	private String last_message;
}
