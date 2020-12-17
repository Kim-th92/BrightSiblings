package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.Donation_Dto;

public interface Donation_Biz {

	public List<Donation_Dto> selectList();
	public List<Donation_Dto> detailDonation(int member_no);
	public int insertDonation(Donation_Dto dto);
	public int donationSum();
	public int selectDonationSum(int member_no);
	
}
