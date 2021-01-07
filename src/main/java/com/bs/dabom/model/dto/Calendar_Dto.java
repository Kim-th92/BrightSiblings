package com.bs.dabom.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Calendar_Dto {
	
	private int member_no;
	private String yyyyMMdd;
	
	private float targetkcal;
	
	private float total_intake_kcal;
	
	private int total_distance;
	private float total_burn_kcal;
	


}
