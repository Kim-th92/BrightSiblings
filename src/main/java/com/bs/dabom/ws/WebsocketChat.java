package com.bs.dabom.ws;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bs.dabom.model.biz.Chat_Biz;
import com.bs.dabom.model.biz.Food_Biz;
import com.bs.dabom.model.biz.Food_BizImpl;
import com.bs.dabom.model.dto.Chatmsg_Dto;
import com.bs.dabom.model.dto.Member_Dto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
@ServerEndpoint(value = "/echo.do", configurator = HttpSessionConfigurator.class)
public class WebsocketChat {
	private static Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<Session, EndpointConfig>());
	
	// handshake를 거치고 handleOpen 호출
	//유저를 담아놓는 맵 
	private static Map<Session, Integer> chatMap = new HashMap<Session, Integer>();
	
	//메세지를 담아놓는맵 
	private static Map<Integer, List<JsonObject>> chatMsgMap = new HashMap<Integer, List<JsonObject>>();

	@Autowired
	private Chat_Biz chatBiz;
	
	Food_Biz biz = new Food_BizImpl();

	DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@OnOpen // 소켓이 열릴때 컨피그에 세션을 담아줍니당
	public void handleOpen(Session userSession, EndpointConfig config) {

		System.out.println("[클라이언트가 접속했습니다.]" + userSession.getId());
		if (!configs.containsKey(userSession)) {
			configs.put(userSession, config);
		}
	}

	@OnMessage // 클라이언트에서 넘어온 메세지를 처리해 줍니다.
	public void handleMessage(String msg, Session userSession) throws IOException {
		EndpointConfig userConfig = configs.get(userSession);
		HttpSession httpSession = (HttpSession) userConfig.getUserProperties().get("session");
		Member_Dto login = (Member_Dto) httpSession.getAttribute("login");
		int member_no = login.getMember_no();
		System.out.println("member_no :   >>>>>"  +member_no);
		
		// msg 는 채팅으로건너오는 메세지 or 룸 을 맵핑해준다
		// 제이슨 타입으로 넘어오기때문에 {로 시작하는데 {로 시작하지 않으면 / 룸번호
		System.out.println("msg >>>>>>>>>>>>>>>>>"+msg);
	
				int chatroom_no =0;
				if(msg.charAt(0) != '{') { // 처음 메세지 창에 떴을때.
					int room_no = Integer.parseInt(msg);
					chatMap.put(userSession, room_no);
					
				}else {
					// Json타입 메세지 받기
					String member_name = login.getMember_name();
					System.out.println(member_name);
					JsonElement element = JsonParser.parseString(msg);
					JsonObject jsonData = element.getAsJsonObject();
					jsonData.addProperty("member_no", member_no);
					jsonData.addProperty("member_name", member_name);

					chatroom_no = jsonData.get("chatroom_no").getAsInt();
					chatMap.put(userSession, chatroom_no);

					// chatMsgMap에 jsonData추가
					List<JsonObject> jsonlist = null;
					if (!chatMsgMap.containsKey(chatroom_no)) {
						jsonlist = new ArrayList<JsonObject>();
					} else {
						jsonlist = chatMsgMap.get(chatroom_no);
					}

					jsonlist.add(jsonData);
					chatMsgMap.put(chatroom_no, jsonlist);
					
					// 해당 방번호에 데이터보내기
					// 동기화 : 하나의 일 처리를 수행하는동안 사용자의 변경이 일어나면 NullPointer 에러 발생
					synchronized (configs) {

						Iterator<Session> sessions = chatMap.keySet().iterator();
						
						while (sessions.hasNext()) {
							Session session = sessions.next();
							if (chatroom_no == chatMap.get(session) && session != userSession) {
								try {
									session.getBasicRemote().sendText(jsonData + "");
								} catch (IOException e) {
									e.printStackTrace();
								}
							}
						}
					}
				}
	
				
	}

	@OnClose
	public void  onClose(Session userSession) throws ParseException   {

		if (chatMap.containsKey(userSession)) {
			int room_no = chatMap.get(userSession);

			EndpointConfig config = configs.get(userSession);
			HttpSession httpSession = (HttpSession) config.getUserProperties().get("session");
			Member_Dto login = (Member_Dto) httpSession.getAttribute("login");
			int member_no = login.getMember_no();

			// chatMsgMap에 해당room data가 있으면 insert
			if (chatMsgMap.get(room_no) != null) {
				List<JsonObject> jsonlist = chatMsgMap.get(room_no);

				List<Chatmsg_Dto> list = new ArrayList<Chatmsg_Dto>();

				for (JsonObject obj : jsonlist) {
					int member_no_res = obj.get("member_no").getAsInt();
					String content = obj.get("content").getAsString();
					String	sendingtime = obj.get("sendingtime").getAsString();
					System.out.println(sendingtime);
					
					int chatroom_no = obj.get("chatroom_no").getAsInt();

					Chatmsg_Dto dto = new Chatmsg_Dto(content, member_no_res, sendingtime, chatroom_no);
					list.add(dto);
				}                    
				System.out.println("저장할 메세지는  : >>>>>."+list.toString());
				int res =0;
				try {
					res = biz.insertChat(list);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (res > 0) {
					chatMsgMap.remove(room_no);
				}

			}
		}
		configs.remove(userSession);
		chatMap.remove(userSession);
	}
	@OnError
	public void handleError(Throwable e, Session userSession) {
		e.printStackTrace();
	}
}
