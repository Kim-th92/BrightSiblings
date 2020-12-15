package com.bs.dabom.model.dto;

import java.util.Date;

public class Donation_Dto {

	private int donation_no;
	private int member_no;
	private int donation;
	private Date donation_date;
	private String member_name;
	
	public Donation_Dto() {
	}

	public Donation_Dto(int donation_no, int member_no, int donation, Date donation_date) {
		super();
		this.donation_no = donation_no;
		this.member_no = member_no;
		this.donation = donation;
		this.donation_date = donation_date;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getDonation_no() {
		return donation_no;
	}

	public void setDonation_no(int donation_no) {
		this.donation_no = donation_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	public Date getDonation_date() {
		return donation_date;
	}

	public void setDonation_date(Date donation_date) {
		this.donation_date = donation_date;
	}
	
	
}
