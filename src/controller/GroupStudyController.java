package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Attend;
import model.Community;
import model.GroupMember;
import model.group.GroupInList;
import service.AttendDao;
import service.CommunityBoardDao;
import service.GroupMemberDao;

public class GroupStudyController extends MskimRequestMapping {

  
  @RequestMapping("studylist")
  public String studyList(HttpServletRequest request, HttpServletResponse response) {
    
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {
//      AttendDao ad = new AttendDao();
//      List<Attend> result = ad.attendGet(id);
//      request.setAttribute("result", result);
      
      GroupMemberDao gmd = new GroupMemberDao();
      List<GroupInList> list = gmd.groupInList(nickname);
      request.setAttribute("list", list);
      return "/view/group/groupStudyList.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  @RequestMapping("studyinfo")
  public String studyInfo(HttpServletRequest request, HttpServletResponse response) {
    
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    String boardnum = request.getParameter("boardnum");
    
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {

      
      GroupMemberDao gmd = new GroupMemberDao();
      List<GroupMember> groupMemberList = gmd.groupListByBoardnum(boardnum);
      request.setAttribute("groupMemberList", groupMemberList);
      return "/view/group/groupStudyInfo.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  @RequestMapping("groupexit")
  public String groupExit(HttpServletRequest request, HttpServletResponse response) {
    
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    String boardnum = request.getParameter("boardnum");
    
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {

      
      GroupMemberDao gmd = new GroupMemberDao();
      List<GroupMember> groupMemberList = gmd.groupListByBoardnum(boardnum);
      request.setAttribute("groupMemberList", groupMemberList);
      return "/view/group/groupStudyExit.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
   
}
