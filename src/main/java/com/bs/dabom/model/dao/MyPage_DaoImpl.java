package com.bs.dabom.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import com.bs.dabom.model.dto.Calendar_Dto;
=======
import com.bs.dabom.model.dto.Board_Dto;
import com.bs.dabom.model.dto.Files_Dto;
>>>>>>> master
import com.bs.dabom.model.dto.MyPage_Dto;
import com.bs.dabom.model.dto.Reply_Dto;

@Repository
public class MyPage_DaoImpl implements MyPage_Dao {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int distanceInsert(MyPage_Dto dto) {
		
		int res = 0 ;
		System.out.println(dto.toString());
		
		try {
			res = sqlSession.insert(NAMESPACE+"distanceInsert", dto);
		} catch (Exception e) {
			System.out.println("distanceInsert Error");
			e.printStackTrace();
		} 		
		return res;
	}
	
	@Override
	public List<MyPage_Dto> showList(int member_no) {
		List<MyPage_Dto> list = new ArrayList<MyPage_Dto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "showList", member_no);
		} catch (Exception e) {
			System.out.println("showList Error");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<MyPage_Dto> total(int member_no) {
		List<MyPage_Dto> list = new ArrayList<MyPage_Dto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "total", member_no);
		} catch (Exception e) {
			System.out.println("total Error");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
<<<<<<< HEAD
	public float showTargetKcal(Calendar_Dto dto) {
		float res = 0 ;
		try {
			res = sqlSession.selectOne(NAMESPACE + "showTargetKcal", dto);
		} catch (Exception e) {
			System.out.println("showTargetKcal Error");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<Calendar_Dto> showTotalDFR(Calendar_Dto dto) {
		List<Calendar_Dto> list = new ArrayList<Calendar_Dto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "showTotalDFR", dto);
		} catch (Exception e) {
			System.out.println("showTotalDFR Error");
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Calendar_Dto> showTotalDER(Calendar_Dto dto) {
		List<Calendar_Dto> list = new ArrayList<Calendar_Dto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "showTotalDER", dto);
		} catch (Exception e) {
			System.out.println("showTotalDER Error");
			e.printStackTrace();
		}
		return list;
=======
	public List<Board_Dto> selectList(int member_no) {
		List<Board_Dto> list =null;
			try {
				list=	sqlSession.selectList("board.selectListMypage",member_no);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}

	@Override
	public List<Files_Dto> getFileUrl(int board_no) {
		List<Files_Dto> res = sqlSession.selectList("board.getFileUrl", board_no);
		
		return res;
	}

	@Override
	public List<Reply_Dto> getReply(int board_no) {
		List<Reply_Dto> res = sqlSession.selectList("board.getReply", board_no);
		
		return res;
		
>>>>>>> master
	}
	


}
