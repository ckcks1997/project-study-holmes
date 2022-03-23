package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import model.WebChat;
import service.ChatMybatisDao;
 
 
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
    
    
    ChatMybatisDao dao = new ChatMybatisDao();
    List<WebChat> li = dao.listWebChat(boardnum);
    for (WebChat webChat : li) {
      System.out.println(webChat);
    }
    
 
    request.setAttribute("li", li);
    
    return "/view/chat/websocket.jsp";
  }

  @RequestMapping("upload")
  public String upload(HttpServletRequest request, HttpServletResponse  response) {

    String path = getServletContext().getRealPath("/upload");
    String filename = "";
    MultipartRequest multi = null;
    try {
      multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
    } catch (IOException e) {
      e.printStackTrace();
    }
    
    
    filename = multi.getFilesystemName("file");
    String boardnum= multi.getParameter("boardnum");
    String memberNickname = multi.getParameter("memberNickname");
    System.out.println(filename);
    request.setAttribute("filename", filename); 
    return "/common/upload.jsp";
  }

}
