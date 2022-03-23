package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Attend;
import service.AttendDao;

public class AttendCheckController extends MskimRequestMapping {

  
  @RequestMapping("check")
  public String ckeck(HttpServletRequest request, HttpServletResponse response) {
    
    String id = (String) request.getSession().getAttribute("memberID");
    
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(id != null) {
      AttendDao ad = new AttendDao();
      List<Attend> result = ad.attendGet(id);
      request.setAttribute("result", result);
      return "/view/check/attendCheck.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
 
  /*
   * 날짜 체크
   * */
  @RequestMapping("check_pro")
  public String check_pro(HttpServletRequest request, HttpServletResponse response) {
 
    
    String id = (String) request.getSession().getAttribute("memberID");
    AttendDao ad = new AttendDao();
    int result = ad.attendInsert(id);
    String url = request.getContextPath() +"/attend/check";
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  
}
