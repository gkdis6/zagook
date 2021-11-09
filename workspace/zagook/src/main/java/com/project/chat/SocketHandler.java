package com.project.chat;

import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
    
    HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
    
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        // 메시지 발송, key는 난수 형태로 부여됨.
        String msg = message.getPayload();
        for(String key : sessionMap.keySet()) {
            System.out.println("메시지 발송 key: " + key);
            WebSocketSession wss = sessionMap.get(key);
            try {
                wss.sendMessage(new TextMessage(msg));
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 소켓 연결
        super.afterConnectionEstablished(session);
        sessionMap.put(session.getId(), session); // id는 난수 형태로 부여되며 메시지 전송시 key로 이용됨
        System.out.println("소켓 연결 session.getId(): " + session.getId());
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 소켓 종료
        System.out.println("소켓 종료 session.getId(): " + session.getId()); // id는 난수 형태로 부여되며 메시지 전송시 key로 이용됨
        sessionMap.remove(session.getId());
        super.afterConnectionClosed(session, status);
    }
}
