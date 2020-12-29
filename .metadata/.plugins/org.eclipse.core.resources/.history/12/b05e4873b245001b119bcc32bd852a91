package com.bs.dabom.model.dao;

import static com.bs.dabom.model.dao.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class WordCloudParser {

	public static void main(String[] args) {
			JSONParser json;
	        JSONObject jsonObj = new JSONObject();
	        JSONObject finalJsonObj1 = new JSONObject();
	        JSONArray jsonarr = null;
	        
	      
	        
	        // 파일 경로 잡기
	        String filePath ="/Users/seowonchoi/Documents/realfinalproject/BrightSiblings/src/main/webapp/resources/json/wordcloud.json";
	        FileInputStream fileStream = null;
	        
	        
	        try {
	        	  Connection conn =getConnection();
	  	        PreparedStatement pstmt= null;
	            fileStream = new FileInputStream(filePath);
	                        
	            // 버퍼 선언
	            byte[] readbuffer = new byte[fileStream.available()];
	            while(fileStream.read(readbuffer) != -1){}
	            
	            String str = new String(readbuffer);
	            
	            json = new JSONParser();
	            jsonObj = (JSONObject) json.parse(str);
	            
	            jsonarr = (JSONArray) jsonObj.get("wordcloud");
	            String s = jsonarr.toString();
	            String reals = s.substring(1,127552);
	            jsonObj =(JSONObject)json.parse(reals);
	            
	            String[] objectName ={"DIET", "다이어트", "식이요법", "운동분석", "유산소", "근력운동", "닭가슴살", "DABOM", "건강", "칼로리", "BMI", "필라테스", "요가", "소셜네트워크", "한방다이어트", "친구찾기", "채팅", "인바디", "비타민", "보조제", "단백질", "감량", "캘린더", "좋아요", "동기부여", "비만유전자", "식욕억제"};
	            
	            pstmt = conn.prepareStatement("INSERT INTO WORDCLOUD VALUES(?, ?, ?, ?)");   
	            for(int i = 0 ; i < jsonObj.size();i++) {
	            	
	            		jsonarr = (JSONArray)jsonObj.get(objectName[i]);
	            	System.out.println(jsonarr.size() * jsonObj.size() );
	            		for(int j =0 ; j<jsonarr.size();j++) {
	            			System.out.println(j);
	            			JSONObject finalJsonObj2 = new JSONObject();
	            			finalJsonObj2 =(JSONObject)jsonarr.get(j);
	            			pstmt.setString(1,objectName[i]);
	            			pstmt.setString(2, (String) finalJsonObj2.get("img"));
	            			pstmt.setString(3,(String) finalJsonObj2.get("title"));
	            			pstmt.setString(4, (String) finalJsonObj2.get("link"));
	            			pstmt.executeUpdate();
	            		} 
	            		
	            }
	            // 쿼리 종료
	            pstmt.close();
	            conn.close();
	         
	        
	        // 상세 오류 확인
	        } catch(SQLException e1) {
	            e1.getStackTrace();
	        } catch(FileNotFoundException e2) {
	            e2.getStackTrace();
	        } catch(IOException e3) {
	            e3.getStackTrace();
	        } catch(ParseException e4) {
	            e4.getStackTrace();
	        }
	    }
	
	/* python 크롤링 
	 
	 #https://search.daum.net/search?nil_suggest=btn&w=news&DA=PGD&cluster=y&q=[]&p=1


import json 

json_data = """
{"tags": [ {"tag": "DIET","count": "1000000"}, { "tag": "다이어트","count": "999999"}, {
  "tag": "식이요법",
  "count": "983099"}, {
  "tag": "운동분석",
  "count": "962928"}, {
  "tag": "유산소",
  "count": "952281"}, {
  "tag": "근력운동",
  "count": "944983"
}, {
  "tag": "닭가슴살",
  "count": "805679"
}, {
  "tag": "DABOM",
  "count": "606051"
}, {
  "tag": "건강",
  "count": "591410"
}, {
  "tag": "칼로리",
  "count": "574684"
}, {
  "tag": "BMI",
  "count": "550916"
}, {
  "tag": "필라테스",
  "count": "479892"
}, {
  "tag": "요가",
  "count": "343092"
}, {
  "tag": "소셜네트워크",
  "count": "303311"
}, {
  "tag": "한방다이어트",
  "count": "296963"
}, {
  "tag": "친구찾기",
  "count": "288445"
}, {
  "tag": "채팅",
  "count": "286823"
}, {
  "tag": "인바디",
  "count": "280079"
}, {
  "tag": "비타민",
  "count": "277144"
}, {
  "tag": "보조제",
  "count": "263451"
}, {
  "tag": "단백질",
  "count": "257159"
}, {
  "tag": "감량",
  "count": "457159"
} , {
  "tag": "캘린더",
  "count": "357159"
} , {
  "tag": "좋아요",
  "count": "223159"
} , {
  "tag": "동기부여",
  "count": "251159"
} , {
  "tag": "비만유전자",
  "count": "241659"
} , {
  "tag": "식욕억제",
  "count": "222659"
}  
]}
"""


tagdict = json.loads(json_data)
tagList = tagdict.get('tags')
print(tagList[0].get('tag'))
lengthOftag = len(tagList)
print(lengthOftag)

lst = []
for i in range(0,lengthOftag):
    tagname = tagList[i].get('tag')
    lst.append(tagname)





import requests
from bs4 import BeautifulSoup



def daum_search(list):
    url = 'https://search.daum.net/search?w=news&DA=PGD&spacing=0'
    a={}
    # 검색 결과는 1페이지부터 10페이지 까지
    for page in range(1, 3):
        for v in lst:
           
            req_params = {
                'q': v ,# 검색어(키워드)를 쿼리 스트링에 파라미터로 추가
                'p': page # 검색 페이지 번호를 쿼리 스트링에 파라미터로 추가
            }
            response = requests.get(url, params=req_params)
            html = response.text.strip()
            bundle_lst =[]
            soup = BeautifulSoup(html, 'html.parser')
            news_links = soup.select('.coll_cont ul li') 
            for link in news_links:
                
                bundle = {}
                if link.find('a',class_='f_link_b') == None:
                    continue
                else:
                    bundle["title"] =link.find('a',class_='f_link_b').text
                    bundle["link"]= link.find('a',class_='f_link_b').get('href')
                    if link.find('img') ==None:
                        bundle['img']='https://rsvsstsv2fnl-a.akamaihd.net/assets/default-image.jpg'
                    else:
                        bundle['img']=link.find('img')['src']
                    
                    bundle_lst.append(bundle)
                    print(bundle)
            try:
                a[v] += bundle_lst
            except KeyError:
                a[v] = bundle_lst


    

            
   
    
    resultdict = {}
    jsonfile= []
    jsonfile.append(a)
    resultdict['wordcloud']=jsonfile
      
    res_json = json.dumps(resultdict, ensure_ascii=False)
    with open('wordcloud.json','w',encoding='utf-8') as f:
        f.write(res_json)
    print('end')
      
if __name__ == '__main__':
    daum_search(lst)
    

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 */
	
}
