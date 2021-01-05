package com.bs.dabom.model.dto;

import java.sql.Date;

public class BoardRes_Dto {

	private int member_no;
	private String member_name;
	private String member_profile;
	private int board_no;
	private String board_content;
	private Date board_regdate;
	private int files_no;
	private String files_url;
	
	
	
	public BoardRes_Dto() {
	}

	public BoardRes_Dto(int member_no, String member_name, String member_profile, int board_no, String board_content,
			Date board_regdate, int files_no, String files_url) {
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_profile = member_profile;
		this.board_no = board_no;
		this.board_content = board_content;
		this.board_regdate = board_regdate;
		this.files_no = files_no;
		this.files_url = files_url;
	}
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getFiles_no() {
		return files_no;
	}
	public void setFiles_no(int files_no) {
		this.files_no = files_no;
	}
	public String getFiles_url() {
		return files_url;
	}
	public void setFiles_url(String files_url) {
		this.files_url = files_url;
	}
	
	
	
}
