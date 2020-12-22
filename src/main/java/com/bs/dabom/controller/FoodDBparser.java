package com.bs.dabom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.bs.dabom.model.dao.Friends_DaoImpl;
import com.bs.dabom.model.dto.Food_Dto;

public class FoodDBparser {

	//ag값의 정보를 가져오는 메서드 
	private static String getTagValue(String tag,Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);
		if (nValue ==null)
			return null;
		
			return nValue.getNodeValue();
	}
	
	
	public static void main(String[] args) {
		try {
			
		List<Food_Dto> list = new ArrayList<Food_Dto>();
		Friends_DaoImpl dao = new Friends_DaoImpl();
		System.out.println("시작");
	
			
				String url = "http://openapi.foodsafetykorea.go.kr/api/d84d5432d58b432997b3/I2790/xml/1/10";
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);

				doc.getDocumentElement().normalize();
				System.out.println("Root element : "+ doc.getDocumentElement().getNodeName());
				
			
				NodeList nList = doc.getElementsByTagName("row");
				System.out.println("파싱할리스트 수 : " +nList.getLength());
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						//System.out.println(eElement.getTextContent());
					int  number=	Integer.parseInt(getTagValue("NUM", eElement));
					float serving_size =	Float.parseFloat(getTagValue("SERVING_SIZE", eElement));
					String food_name = 	getTagValue("DESC_KOR", eElement);
					float kcal = Float.parseFloat(getTagValue("NUTR_CONT1", eElement));
					float protein = Float.parseFloat(getTagValue("NUTR_CONT3", eElement));
					float carb = Float.parseFloat(getTagValue("NUTR_CONT2", eElement));
					float  fat = Float.parseFloat(getTagValue("NUTR_CONT4", eElement));
					float  sugar = Float.parseFloat(getTagValue("NUTR_CONT5", eElement));
					float  sodium = Float.parseFloat(getTagValue("NUTR_CONT6", eElement));
					
					
						Food_Dto dto = new Food_Dto();
						dto.setFood_no(number);
						dto.setServing_size(serving_size);
						dto.setFood_name(food_name);
						dto.setKcal(kcal);
						dto.setCarbohydrate(carb);
						dto.setProtein(protein);
						dto.setFat(fat);
						dto.setSugar(sugar);
						dto.setSodium(sodium);
						
						list.add(dto);
					}	// for end
					
					
				}	// if end
			System.out.println(list.toString());
			if(list !=null) {
				
				int res = dao.insertFoodDb(list);
				if(res > 0) {
					System.out.println("db저장 성공!");
				}else {
					System.out.println("db저장실패..");
				}
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		

		}
	
	
	
}
