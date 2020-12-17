package com.bs.dabom.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Friends_Dto {

	private int member_no;
	private int friend_no;
	private int status;
	private int action_member;
}
