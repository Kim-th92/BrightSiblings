package com.bs.dabom.model.biz;

import java.util.List;

import com.bs.dabom.model.dto.News_Dto;

public interface News_Biz {

	List<News_Dto> selectNewsList(String keyword);
	

}
