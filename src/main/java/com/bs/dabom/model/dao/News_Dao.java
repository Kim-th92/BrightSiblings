package com.bs.dabom.model.dao;

import java.util.List;

import com.bs.dabom.model.dto.News_Dto;

public interface News_Dao {
	
	 String NAMESPACE= "news.";

	List<News_Dto> selectNewsList(String keyword);

}
