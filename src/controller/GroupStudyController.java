package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Attend;
import model.Community;
import service.AttendDao;
import service.CommunityBoardDao;

public class GroupStudyController extends MskimRequestMapping {

  
  @RequestMapping("studylist")
  public String studyList(HttpServletRequest request, HttpServletResponse response) {
    
    String id = (String) request.getSession().getAttribute("memberID");
    
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(id != null) {
//      AttendDao ad = new AttendDao();
//      List<Attend> result = ad.attendGet(id);
//      request.setAttribute("result", result);
      return "/view/group/groupStudyList.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  
   
}
