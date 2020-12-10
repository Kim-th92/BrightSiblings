package com.bs.dabom.model.dto;

import java.util.Date;

public class Member_Dto {

	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birthday;
	private String member_phone;
	private String member_zipcode;
	private String member_firstaddr;
	private String member_secondaddr;
	private String member_email;
	private String member_profile;
	private Date member_regdate;
	private String member_role;
	private String member_payment;
	private String member_delflag;
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_firstaddr() {
		return member_firstaddr;
	}
	public void setMember_firstaddr(String member_firstaddr) {
		this.member_firstaddr = member_firstaddr;
	}
	public String getMember_secondaddr() {
		return member_secondaddr;
	}
	public void setMember_secondaddr(String member_secondaddr) {
		this.member_secondaddr = member_secondaddr;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	public Date getMember_regdate() {
		return member_regdate;
	}
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_payment() {
		return member_payment;
	}
	public void setMember_payment(String member_payment) {
		this.member_payment = member_payment;
	}
	public String getMember_delflag() {
		return member_delflag;
	}
	public void setMember_delflag(String member_delflag) {
		this.member_delflag = member_delflag;
	}
	@Override
	public String toString() {
		return "Member_Dto [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_birthday=" + member_birthday + ", member_phone="
				+ member_phone + ", member_zipcode=" + member_zipcode + ", member_firstaddr=" + member_firstaddr
				+ ", member_secondaddr=" + member_secondaddr + ", member_email=" + member_email + ", member_profile="
				+ member_profile + ", member_regdate=" + member_regdate + ", member_role=" + member_role
				+ ", member_payment=" + member_payment + ", member_delflag=" + member_delflag + "]";
	}
	public Member_Dto(int member_no, String member_id, String member_pw, String member_name, String member_birthday,
			String member_phone, String member_zipcode, String member_firstaddr, String member_secondaddr,
			String member_email, String member_profile, Date member_regdate, String member_role, String member_payment,
			String member_delflag) {
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_birthday = member_birthday;
		this.member_phone = member_phone;
		this.member_zipcode = member_zipcode;
		this.member_firstaddr = member_firstaddr;
		this.member_secondaddr = member_secondaddr;
		this.member_email = member_email;
		this.member_profile = member_profile;
		this.member_regdate = member_regdate;
		this.member_role = member_role;
		this.member_payment = member_payment;
		this.member_delflag = member_delflag;
	}
	public Member_Dto() {
	}
	public Member_Dto(String member_id, String member_name) {
		this.member_id = member_id;
		this.member_name = member_name;
	}
	
	
}
