package com.bs.dabom.model.dto;

import java.sql.Date;
import java.util.List;

public class Files_Dto {

	private int files_no;
	private int board_no;
	private String files_url;
	private Date files_regdate;
	
	
	public Files_Dto() {
	}
	
	
	
	public Files_Dto(int board_no, String files_url) {
		this.board_no = board_no;
		this.files_url = files_url;
	}



	public Files_Dto(int files_no, int board_no, String files_url, Date files_regdate) {
		super();
		this.files_no = files_no;
		this.board_no = board_no;
		this.files_url = files_url;
		this.files_regdate = files_regdate;
	}
	
	public int getFiles_no() {
		return files_no;
	}
	public void setFiles_no(int files_no) {
		this.files_no = files_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getFiles_url() {
		return files_url;
	}
	public void setFiles_url(String files_url) {
		this.files_url = files_url;
	}
	public Date getFiles_regdate() {
		return files_regdate;
	}
	public void setFiles_regdate(Date files_regdate) {
		this.files_regdate = files_regdate;
	}
}
