package com.bs.dabom.ws;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;


@Controller
@ServerEndpoint(value="/echo.do")
public class WebsocketChat {
	
	@Autowired
	SqlSession sqlsession;
	
	//접속된 클라이언트 세션 관리 리스트 
	private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
    private static final Logger logger = LoggerFactory.getLogger(WebsocketChat.class);
   
    public   WebsocketChat() {
        System.out.println("웹소켓 서버 객체 생성");
    }
    
    @OnOpen  //after connection established
    public void onOpen(Session userSession) {
        sessionUsers.add(userSession);
        System.out.println("userSession >>>>>>>"+userSession);
        System.out.println("client is now connected...");
    }
     
    /*
     * 내가 입력하는 메시지  
     * @param message
     * @param session
     */
    @OnMessage       //handleTetMassage
    public void onMessage(TextMessage message,WebSocketSession session) {
    	//Freinds_Dao dao = sqlsession.getMapper(Friends_Dao.class);
		this.logger.info(message.getPayload());
		//session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload()))); 
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose  //afterConnectionClosed
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
    }

}
