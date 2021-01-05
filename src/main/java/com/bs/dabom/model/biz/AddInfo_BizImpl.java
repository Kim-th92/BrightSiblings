package com.bs.dabom.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bs.dabom.model.dao.AddInfo_Dao;
import com.bs.dabom.model.dto.AddInfo_Dto;

@Service
public class AddInfo_BizImpl implements AddInfo_Biz {
	
	@Autowired
	private AddInfo_Dao dao;

	@Override
	public List<AddInfo_Dto> selectList() {
		return dao.selectList();
	}

	@Override
	public AddInfo_Dto selectOne(int member_no) {
		return dao.selectOne(member_no);
	}

	@Override
	public int insert(AddInfo_Dto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(AddInfo_Dto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int member_no) {
		return dao.delete(member_no);
	}

}
