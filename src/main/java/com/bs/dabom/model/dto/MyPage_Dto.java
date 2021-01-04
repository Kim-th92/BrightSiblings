package com.bs.dabom.model.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MyPage_Dto {
	
	private int member_no;
	private String course_name;
	private Date calendar_date;
	private float burn_kcal;
	private int distance;
	private float total_burn_kcal;
	private int total_distance;
	
}

