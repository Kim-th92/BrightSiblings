package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bs.dabom.model.dto.BoardRes_Dto;

@Repository
public class BoardRes_DaoImpl implements BoardRes_Dao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardRes_Dto> selectList(int board_no) {
	
		List<BoardRes_Dto> dto = new ArrayList<BoardRes_Dto>();
		
		try {
			dto = sqlSession.selectList(NAMESPACE + "selectList", board_no);
		} catch (Exception e) {
			System.out.println("sql 에러란다 애송아");
			e.printStackTrace();
		}
		
		System.out.println("dto의 값은 : " + dto);
		return dto;
	}

}
