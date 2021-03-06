package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.News_Dto;

@Repository
public class News_DaoImpl implements News_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<News_Dto> selectNewsList(String keyword) {
		List<News_Dto> list = new ArrayList<News_Dto>();
		
		list = sqlSession.selectList(NAMESPACE+"newslist",keyword);
		
		return  list;
	}
}
