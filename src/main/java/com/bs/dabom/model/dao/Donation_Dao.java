package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.Donation_Dto;

public interface Donation_Dao {

	String NAMESPACE = "donation.";
	
	public List<Donation_Dto> selectList();
	public Donation_Dto detaildonation(int member_no);
	public int insertdonation(Donation_Dto dto);
	
}
