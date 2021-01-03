package com.bs.dabom.model.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MyPage_Dto {
	
	private int member_no;
	private Date calendar_date;
	private int exercise_no;
	private float exercise_name;
	private float burn_kcal;
	private int distance;
	
}

