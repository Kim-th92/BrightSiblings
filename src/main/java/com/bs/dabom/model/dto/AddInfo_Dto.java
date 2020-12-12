package com.bs.dabom.model.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AddInfo_Dto {
	
	private int member_no;
	private float height;
	private float weight;
	private String gender;
	private float targetweight;
	private float bmi;
	private float targetkcal;
	private float advisekcal;
	
}
