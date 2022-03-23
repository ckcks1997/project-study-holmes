package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Community;
import model.Notice;
import model.StudyMenu;
import service.CommunityBoardDao;
import service.NoticeDao;
import service.StudyMenuDao;
 


public class BoardController extends MskimRequestMapping{

  /*
   * 메인 화면입니다.
   * */
  @RequestMapping("main")
  public String main(HttpServletRequest request, HttpServletResponse response) {
 
    HttpSession s = request.getSession();
    String nick_id = (String) s.getAttribute("memberNickname");
  
//    커뮤니티 리스트 가져오기
    CommunityBoardDao cbd = new CommunityBoardDao();
    List<Community> list1 = cbd.comMainBoardList("4");
    List<Community> list2 = cbd.comMainBoardList("1");
    List<Community> list3 = cbd.comMainBoardList("2");
    request.setAttribute("list1", list1);
    request.setAttribute("list2", list2);
    request.setAttribute("list3", list3);
    
    StudyMenuDao sd = new StudyMenuDao();
    List<StudyMenu> slist = sd.mainNewStudy3();
    request.setAttribute("slist", slist);
    
    
    return "/view/main.jsp";
  }
  
  
  //ajax(head 알림상태 가져오기)
  @RequestMapping("notice")
  public String notice(HttpServletRequest request, HttpServletResponse response) {
 
    HttpSession s = request.getSession();
    String nick_id = (String) s.getAttribute("memberNickname"); 
    
    if(nick_id != null) {
      NoticeDao nd = new NoticeDao();
      int newNoticeCount = nd.noticeNew(nick_id); //알림이 없으면 0, 있으면 1~
      request.setAttribute("noticeCount", newNoticeCount); 
    }
    
 
    return "/single/alert_ajax.jsp";
  }
  
  
  
  
  
}
 