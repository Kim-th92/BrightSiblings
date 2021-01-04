package com.bs.dabom.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Water_Dto {
	private int water_no;
	private int water_count;
	private int member_no;
	private Date water_date;
}
