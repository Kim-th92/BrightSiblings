package com.bs.dabom.model.dto;

import java.sql.Date;

public class Board_Dto {

	private int board_no;
	private int member_no;
	private String board_content;
	private String board_file;
	private String board_hashtag;
	private String board_like;
	private String board_privacy;
	private Date board_regdate;
	private Date board_updatedate;
	
//	adminpage 관련 페이징
	private int countPerPage = 5; // 페이지당 글 수
	private int currentPage;	// 현재 페이지
	private int totalCount; // 전체 글 수
	
	
	
	public Board_Dto() {
		
	}
	
	
	public Board_Dto(int member_no,String board_content) {
		this.member_no = member_no;
		this.board_content = board_content;
	}
	

	public Board_Dto(int board_no, int member_no, String board_content, String board_file, String board_hashtag,
			String board_like, String board_privacy, Date board_regdate, Date board_updatedate) {
		this.board_no = board_no;
		this.member_no = member_no;
		this.board_content = board_content;
		this.board_file = board_file;
		this.board_hashtag = board_hashtag;
		this.board_like = board_like;
		this.board_privacy = board_privacy;
		this.board_regdate = board_regdate;
		this.board_updatedate = board_updatedate;
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
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getBoard_hashtag() {
		return board_hashtag;
	}
	public void setBoard_hashtag(String board_hashtag) {
		this.board_hashtag = board_hashtag;
	}
	public String getBoard_like() {
		return board_like;
	}
	public void setBoard_like(String board_like) {
		this.board_like = board_like;
	}
	public String getBoard_privacy() {
		return board_privacy;
	}
	public void setBoard_privacy(String board_privacy) {
		this.board_privacy = board_privacy;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public Date getBoard_updatedate() {
		return board_updatedate;
	}
	public void setBoard_updatedate(Date board_updatedate) {
		this.board_updatedate = board_updatedate;
	}

	
	// <<<<<< 페이징 관련 겟,셋,리턴 (시작)
	public int getCountPerPage() {
		return countPerPage;
	}


	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}


	public int getCurrentPage() {
		return (currentPage < 1)? 1 : currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int Total_page_count() {
		return (totalCount + countPerPage - 1) / countPerPage;
	}

	public int Start_no() {
		return (countPerPage * (currentPage - 1)) + 1;
	}


	public int End_no() {
		return Start_no() + countPerPage;
	}
	//>>>>>>페이징 관련 겟,셋,리턴 (끝)
	
}
