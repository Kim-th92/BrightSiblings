package com.bs.dabom.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Dailyfoodrecord_Dto {
	private int member_no;
	private Date calendar_date;
	private int food_no ;
	private double intacke_kcal;
	
	
}
