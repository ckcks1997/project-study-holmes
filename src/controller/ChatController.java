package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
 
public class ChatController extends MskimRequestMapping {

  @RequestMapping("chat")
  public String list(HttpServletRequest request, HttpServletResponse  response) {

    //member의 group가입에 관한 테이블작업
    String boardnum = request.getParameter("boardnum");
    String memberNickname = (String) request.getSession().getAttribute("memberNickname");
    System.out.println(memberNickname+"==");
    //userid 세션으로 수정
    request.setAttribute("boardnum", boardnum);
    request.setAttribute("memberNickname", memberNickname);
    
    return "/view/chat/websocket.jsp";
  }


}
