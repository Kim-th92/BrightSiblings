package com.bs.dabom.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Food_Dto;
import static com.bs.dabom.model.dao.JDBCTemplate.*;

public class Food_DaoImpl implements Food_Dao {

	@Override
	public int insertFoodDb(List<Food_Dto> list) {
		
		System.out.println("들어왓심다 ");
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int[] result = null;
		int res = 0;
		String sql = "INSERT INTO FOODDB VALUES(?,?,?,?,?,?,?,?,?) ";
		
		try {
			pstm =con.prepareStatement(sql);
			for(Food_Dto dto : list) {
				pstm.setInt(1, dto.getFood_no());
				pstm.setString(2,dto.getFood_name());
				pstm.setFloat(3, dto.getServing_size());
				pstm.setFloat(4, dto.getKcal());
				pstm.setFloat(5, dto.getCarbohydrate());
				pstm.setFloat(6, dto.getProtein());
				pstm.setFloat(7, dto.getFat());
				pstm.setFloat(8, dto.getSugar());
				pstm.setFloat(9, dto.getProtein());
			
				pstm.addBatch();
				
				System.out.println("4. query 실행 및 리턴");
				
			}
			result = pstm.executeBatch();
			for(int i=0 ;i<result.length ; i++) {
				//성공 : -2
				//실패 : -3
				if(result[i]==-2) {
					res++;
				}
			}
			if(list.size() == res) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
					
		return  (res == list.size())?1 : 0;
	}

	@Override
	public int insertfoodone(Food_Dto dto) {
	
		return 0 ;
	}

	@Override
	public int insertChat(List<Chatmsg_Dto> list) {
		System.out.println("들어왓심다 ");
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int[] result = null;
		int res = 0;
		String sql = "INSERT INTO chatmsg VALUES(chatmsgseq.nextval,?,?,to_date(?,'RRRR-MM-DD HH24:MI:SS'),?)" ; 
		System.out.println("쿼리준비 ");
		
		try {
			pstm =con.prepareStatement(sql);
			for(Chatmsg_Dto dto : list) {
				System.out.println(dto.toString());
				pstm.setString(1, dto.getMessage());
				pstm.setInt(2,dto.getMember_no());
				pstm.setString(3, dto.getSendingtime());
				pstm.setInt(4, dto.getChatroomno());
				
			
				pstm.addBatch();
				
				System.out.println("4. query 실행 및 리턴");
				
			}
			result = pstm.executeBatch();
			for(int i=0 ;i<result.length ; i++) {
				//성공 : -2
				//실패 : -3
				if(result[i]==-2) {
					res++;
				}
			}
			if(list.size() == res) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
					
		return  (res == list.size())?1 : 0;
	}
	

}