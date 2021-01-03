package com.bs.dabom.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.MyPage_Dto;

@Repository
public class MyPage_DaoImpl implements MyPage_Dao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int distanceInsert(MyPage_Dto dto) {
		
		System.out.println("res시작전");
		int res = 0 ;
		System.out.println(dto.toString());
		
		try {
			res = sqlSession.insert(NAMESPACE+"distanceInsert", dto);
			System.out.println("res푸하하");
			System.out.println(res);
		} catch (Exception e) {
			System.out.println("distanceInsert Error");
			e.printStackTrace();
		} 		
		return res;
	}

}
