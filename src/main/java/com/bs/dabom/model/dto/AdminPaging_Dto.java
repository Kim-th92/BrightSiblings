package com.bs.dabom.model.dto;

public class AdminPaging_Dto {

	private int countPerPage = 3; // 페이지당 글 수
	private int currentPage; // 현재 페이지
	private int totalCount; // 전체 글 수
	
	public AdminPaging_Dto() {
		super();
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getCurrentPage() {
		return (currentPage < 1) ? 1 : currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = (currentPage > Total_page_count()) ? Total_page_count() : currentPage;
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
	
	
	
	

}
