package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.News_Dao;
import com.bs.dabom.model.dto.News_Dto;

@Service
public class News_BizImpl implements News_Biz {

	@Autowired
	private News_Dao dao;

	@Override
	public List<News_Dto> selectNewsList(String keyword) {
		return dao.selectNewsList(keyword);
	}
}
