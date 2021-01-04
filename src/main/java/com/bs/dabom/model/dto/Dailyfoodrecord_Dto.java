package com.bs.dabom.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Dailyfoodrecord_Dto {
	private int member_no;
	private Date calendar_date;
	private int food_no ;
	private int intake_size;
	private int intake_kcal;
	private String food_name;
	private String today;
	
}
