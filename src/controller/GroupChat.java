package controller;

import java.io.IOException;
import java.util.HashMap;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import model.WebChat;
import service.ChatMybatisDao;

@ServerEndpoint("/groupchat")
public class GroupChat {

  private static HashMap<Session, String> clients = new HashMap<>();//세션,그룹아이디
//1. 단톡
  //2. group chatting  <session, groupId>
  //3. 일대일 chatting  <userid, session>

  @OnMessage
  public void onMessage(String message, Session session) throws IOException {
    String[] msg = message.split(":"); 
    WebChat webChat = new WebChat(message.split(":"));
    System.out.println("=="+webChat+"==");

    
    synchronized (clients) { //hashmap이라 싱크
      if (clients.get(session) == null) {
        clients.put(session, webChat.getBoardnum());
      } else {
      
      ChatMybatisDao dao = new ChatMybatisDao();
      int num=dao.nextNum();
      webChat.setNum(num);
      dao.insertWebChat(webChat);
      }
      for (Session client : clients.keySet()) {
        //자기자신한테는 보내지 않는다, 자기 그룹에만 보낸다.
        if (!client.equals(session) && clients.get(client).equals(webChat.getBoardnum())) {
          client.getBasicRemote().sendText(webChat.toString());
          System.out.println(webChat.toString()+"===");
        }
      }
    }

    System.out.println("message:" + message);
  }


  @OnOpen
  public void onOpen(Session session) {

    System.out.println("open:" + session);
    clients.put(session, null);
  }


  @OnClose
  public void onClose(Session session) {
    clients.remove(session);
    System.out.println("close:" + session);
  }

}
