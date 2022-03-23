package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Attend;
import model.Community;
import model.GroupMember;
import model.ReputationEstimate;
import model.StudyMember;
import model.group.GroupInList;
import service.AttendDao;
import service.CommunityBoardDao;
import service.GroupMemberDao;
import service.ReputationEstimateDao;
import service.StudyMemberDao;

//group
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
  
  
  @RequestMapping("groupexitpro")
  public String groupExitPro(HttpServletRequest request, HttpServletResponse response) {
    
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    String boardnum = request.getParameter("boardnum");
     
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {
      System.out.println(boardnum);
      System.out.println(nickname);
      GroupMemberDao gmd = new GroupMemberDao();
      System.out.println("================");
      gmd.groupDelete(Integer.parseInt(boardnum), nickname);
      msg= "스터디가 종료되었습니다.";
      url= "main"; //main으로 보내기, alert.jsp파일 참고
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  @RequestMapping("score")
  public String score(HttpServletRequest request, HttpServletResponse response) {
    
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    String nickname_to = request.getParameter("nickname");
    int score = Integer.parseInt(request.getParameter("score_value"));
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {

      System.out.println(nickname_to);
      System.out.println(score);
      //평가정보 기록
      ReputationEstimateDao rd = new ReputationEstimateDao();
      ReputationEstimate re = new ReputationEstimate();
      re.setNickname_from(nickname);
      re.setNickname_to(nickname_to);
      re.setScore(score);
      rd.insertReputation(re);
      
      //회원정보에 점수 추가
      StudyMemberDao sd = new StudyMemberDao();
      System.out.println(nickname_to+"==");
      StudyMember member = sd.studyMembeByNickname(nickname_to);
      int val = member.getPoint();
      val+=score;
      
      sd.changePoint(val, nickname_to); 
      return "/single/score_ajax.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
}
