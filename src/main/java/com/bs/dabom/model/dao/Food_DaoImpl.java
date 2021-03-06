package com.bs.dabom.model.dao;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Food_Dto;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import static com.bs.dabom.model.dao.JDBCTemplate.*;

public class Food_DaoImpl implements Food_Dao {

	
	public static void main(String[] args) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		List<String> foodnames = new ArrayList<String>();
		ResultSet rs = null;
		try {
			pstm = con.prepareStatement("SELECT FOOD_NAME FROM FOODDB ORDER BY FOOD_NO ");
			rs = pstm.executeQuery();
			while(rs.next()) {
				String foodname = rs.getString("food_name");
				foodnames.add(foodname);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		 JsonObject jsonObj = new JsonObject();
		  JsonArray jsonArray2 = new Gson().toJsonTree(foodnames).getAsJsonArray();
	      jsonObj.add("foodnames", jsonArray2);
	      System.out.println(jsonObj.toString());
	      Gson gson = new GsonBuilder().setPrettyPrinting().create();
	      String json = gson.toJson(jsonObj);
      	FileWriter writer=null;
	        try {

	            writer = new FileWriter("/Users/seowonchoi/Documents/realfinalproject/BrightSiblings/src/main/java/com/bs/dabom/ws/foodnames.json");
	            writer.write(json);
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }finally {
	            try {
	                writer.close();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }



	}
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
