package com.bs.dabom.model.dto;

import java.util.Date;
import java.util.List;

public class MyMain_Dto {

	private int board_no;
	private int member_no;
	private String board_content;
	private Date board_regdate;
	private List<String> urlList;
	private List<String> replyList;
	
	public MyMain_Dto() {
		
	}
	
	public MyMain_Dto(int board_no, int member_no, String board_content, Date board_regdate, List<String> urlList,
			List<String> replyList) {
		this.board_no = board_no;
		this.member_no = member_no;
		this.board_content = board_content;
		this.board_regdate = board_regdate;
		this.urlList = urlList;
		this.replyList = replyList;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
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
	public List<String> getUrlList() {
		return urlList;
	}
	public void setUrlList(List<String> urlList) {
		this.urlList = urlList;
	}
	public List<String> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<String> replyList) {
		this.replyList = replyList;
	}
	
	
}
