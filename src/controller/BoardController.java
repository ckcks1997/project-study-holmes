package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import com.oreilly.servlet.MultipartRequest;
import model.Notice;
import model.Community;
import service.NoticeDao;
import service.CommunityBoardDao;
 


public class BoardController extends MskimRequestMapping{

  /*
   * 메인 화면입니다.
   * */
  @RequestMapping("main")
  public String main(HttpServletRequest request, HttpServletResponse response) {
 
    HttpSession s = request.getSession();
    String nick_id = (String) s.getAttribute("memberNickname");
//    알림 가져오기
    if(nick_id != null) {
      System.out.println(nick_id);
      NoticeDao nd = new NoticeDao();
      int newNoticeCount = nd.noticeNew(nick_id);
      List<Notice> n = nd.noticeGet(nick_id);
      request.getSession().setAttribute("notice", newNoticeCount); 
    }
    
//    커뮤니티 리스트 가져오기
    CommunityBoardDao cbd = new CommunityBoardDao();
    List<Community> list1 = cbd.comMainBoardList("4");
    List<Community> list2 = cbd.comMainBoardList("1");
    List<Community> list3 = cbd.comMainBoardList("2");
    request.setAttribute("list1", list1);
    request.setAttribute("list2", list2);
    request.setAttribute("list3", list3);
    return "/view/main.jsp";
  }
  
}
 