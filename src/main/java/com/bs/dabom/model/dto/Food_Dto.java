package com.bs.dabom.model.dto;

import lombok.Data;

@Data
public class Food_Dto {
	
	private int food_no;
	private String food_name;
	private float serving_size;
	private float kcal;
	private float carbohydrate;
	private float protein;
	private float fat;
	private float sugar;
	private float sodium;
	
}
