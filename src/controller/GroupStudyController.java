package controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import model.Attend;
import model.Community;
import model.GroupBoard;
import model.GroupMember;
import model.Reply;
import model.ReputationEstimate;
import model.StudyMember;
import model.group.GroupInList;
import service.AttendDao;
import service.CommunityBoardDao;
import service.GroupBoardDao;
import service.GroupMemberDao;
import service.ReplyDao;
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
  
  /*그룹 나가기 페이지*/
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
  
  /*평가 후 그룹 나가기*/
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
  
  /*ajax 점수평가*/
  
  @RequestMapping("score")
  public String score(HttpServletRequest request, HttpServletResponse response) {
    
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    String nickname_to = request.getParameter("nickname");
    int score = Integer.parseInt(request.getParameter("score_value"));
    String info_value = request.getParameter("info_value");
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
      re.setInfo(info_value);
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
  
  /*그룹 게시판
   * 
   * 주의사항: boardnum과 관련하여 코드가 많이 꼬였습니다 ㅠㅠ..
   * 
   * 게시글 관련한 board_num(community, study, group board들)의 pk는 전부 같은 시퀀스(board_seq)를 공유하는데
   * group_member 자체가 Study_menu게시글의 board_num을 참고하고 있고
   * group_board의 경우 board_num시퀀스를 pk, Study_menu의 board_num을 속성으로 갖고 있어
   * 아래 코드에서도 두 board_num 속성이 혼용되고 있습니다 ㅠㅠ(whimsical을 확인해보시면 이해가 가실겁니다..)
   * 
   * 초기에는 두 board_num의 이름이 혼용되었지만
   * 이후 group_board의 board_num은 s_board_num으로 선언하여 처리하고 있으니 참고하세요..
   * 
   * */
  @RequestMapping("groupBoard")
  public String groupBoard(HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
    String nickname = (String) request.getSession().getAttribute("memberNickname");
    String boardnum = request.getParameter("boardnum"); //그룹번호(==Study_menu 게시글 번호)
    session.setAttribute("boardnum", boardnum);
    
     System.out.println(nickname + ":"+boardnum);
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {
      GroupMemberDao gmd = new GroupMemberDao();
      int res = gmd.isMemberInGroup(boardnum, nickname); //그룹에 있는지 확인, 있다면 1
      if(res == 1) { //있다면 그룹 글 조회
    	 
    	  
    	  String boardid = "";
		  int pageInt = 1;
		  int limit = 4;
		  
		  if(request.getParameter("boardid")!= null) {
			  session.setAttribute("boardid", request.getParameter("boardid"));	  
			  session.setAttribute("pageNum", "1");		  
		  }
		  
		  boardid = (String)session.getAttribute("boardid");
		  if(boardid == null) {
			  boardid ="1";
		  }
		  
		  if (request.getParameter("pageNum")!=null) {
			  session.setAttribute("pageNum", request.getParameter("pageNum"));
		  }
		  
		  String pageNum =(String)session.getAttribute("pageNum");
		  if(pageNum == null) {
			  pageNum = "1";
		  }
    	  
		  pageInt = Integer.parseInt(pageNum);
		  
		   
		  GroupBoardDao gbd= new GroupBoardDao();
		  int boardcount = gbd.groupBoardCount(boardnum, boardid);
		  System.out.println("boardcount="+boardcount);
		  
		  List<GroupBoard> list = gbd.groupBoardList(pageInt, limit, boardcount, boardid, boardnum);
		  int boardListnum = boardcount - limit * (pageInt-1);
		  int bottomLine = 3;
		  int startPage = (pageInt-1)/bottomLine * bottomLine + 1;
		  int endPage = startPage + bottomLine -1;
		  int maxPage = (boardcount/limit)+(boardcount % limit==0? 0:1);
		  if(endPage > maxPage) endPage = maxPage;
		  
		  
		  
		  
		  String boardName = "질문 & 답변";
		  switch(boardid) {

		  case "1" : boardName = "질문 답변"; break;
		  case "2" : boardName = "자료공유"; break;
		
		  }
		   request.setAttribute("boardName",boardName);
		   request.setAttribute("pageInt",pageInt);
		   request.setAttribute("boardid",boardid);
		   request.setAttribute("boardcount",boardcount);
		   request.setAttribute("list",list);
		   request.setAttribute("boardListnum",boardListnum);
		   request.setAttribute("startPage",startPage);
		   request.setAttribute("bottomLine", bottomLine);
		   request.setAttribute("endPage",endPage);
		   request.setAttribute("maxPage",maxPage);
 
    	  return "/view/group/groupBoard.jsp";
      }
      
      msg= "권한이 없습니다.";
      url= "main";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  /*게시판-페이징*/
  @RequestMapping("groupBoardList")
  public String groupBoardList(HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
    String nickname = (String) request.getSession().getAttribute("memberNickname"); 
    String boardnum = request.getParameter("boardnum"); //그룹번호(==스터디 게시글 번호) 
    if(boardnum!= null)
    	session.setAttribute("boardnum", boardnum);
    boardnum = (String) session.getAttribute("boardnum"); 
     System.out.println(nickname + ":"+boardnum);
    String msg= "로그인이 필요합니다";
    String url= "main"; //main으로 보내기, alert.jsp파일 참고
    
    if(nickname != null) {
      GroupMemberDao gmd = new GroupMemberDao();
      int res = gmd.isMemberInGroup(boardnum, nickname); //그룹에 있는지 확인, 있다면 1
      if(res == 1) { //있다면 그룹 글 조회
    	 
    	  
    	  String boardid = "";
		  int pageInt = 1;
		  int limit = 4;
		  
		  if(request.getParameter("boardid")!= null) {
			  session.setAttribute("boardid", request.getParameter("boardid"));	  
			  session.setAttribute("pageNum", "1");		  
		  }
		  
		  boardid = (String)session.getAttribute("boardid");
		  if(boardid == null) {
			  boardid ="1";
		  }
		  
		  if (request.getParameter("pageNum")!=null) {
			  session.setAttribute("pageNum", request.getParameter("pageNum"));
		  }
		  
		  String pageNum =(String)session.getAttribute("pageNum");
		  if(pageNum == null) {
			  pageNum = "1";
		  }
    	  
		  pageInt = Integer.parseInt(pageNum);
		  
		   
		  GroupBoardDao gbd= new GroupBoardDao();
		  int boardcount = gbd.groupBoardCount(boardnum, boardid);
		  System.out.println("boardcount="+boardcount);
		  
		  List<GroupBoard> list = gbd.groupBoardList(pageInt, limit, boardcount, boardid, boardnum);
		  int boardListnum = boardcount - limit * (pageInt-1);
		  int bottomLine = 3;
		  int startPage = (pageInt-1)/bottomLine * bottomLine + 1;
		  int endPage = startPage + bottomLine -1;
		  int maxPage = (boardcount/limit)+(boardcount % limit==0? 0:1);
		  if(endPage > maxPage) endPage = maxPage;
		  
		  
		  
		  
		  String boardName = "질문 & 답변";
		  switch(boardid) {

		  case "1" : boardName = "질문 답변"; break;
		  case "2" : boardName = "자료공유"; break;
		
		  }
		   request.setAttribute("boardName",boardName);
		   request.setAttribute("pageInt",pageInt);
		   request.setAttribute("boardid",boardid);
		   request.setAttribute("boardcount",boardcount);
		   request.setAttribute("list",list);
		   request.setAttribute("boardListnum",boardListnum);
		   request.setAttribute("startPage",startPage);
		   request.setAttribute("bottomLine", bottomLine);
		   request.setAttribute("endPage",endPage);
		   request.setAttribute("maxPage",maxPage);
 
    	  return "/view/group/groupBoard.jsp";
      }
      
      msg= "권한이 없습니다.";
      url= "main";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  /*글쓰기*/
  @RequestMapping("groupBoardWriteForm")
  public String groupWriteForm(HttpServletRequest request,  HttpServletResponse response) {
	  
	  HttpSession session = request.getSession();
	  String msg = "로그인이 필요합니다";
	  String url = request.getContextPath()+"/studymember/loginForm";
	  
	  if(session.getAttribute("memberNickname")!= null) {
		  
		return "/view/group/groupBoardWriteForm.jsp";
	  }
	  
	  request.setAttribute("msg", msg);
	  request.setAttribute("url", url);
	  
	  return "/view/alert.jsp";
  }
 
  /*글쓰기-진행*/
  @RequestMapping("groupBoardWritePro")
  public String groupBoardWritePro(HttpServletRequest request,  HttpServletResponse response) {
	  
	  HttpSession session = request.getSession();
	  String msg = "로그인이 필요합니다";
	  String url = request.getContextPath()+"/studymember/loginForm";
	  
	  if(session.getAttribute("memberNickname")!= null) {
		  
		  String path = request.getServletContext().getRealPath("/")+"/comboardupload/";
		  
		    //폴더가 없으면 에러가 발생합니다. 디렉토리 확인 후 폴더를 생성하는 코드입니다.
		    File file=new File(path);
		    if(!file.exists()) { 
		      file.mkdir();
		    }
		    
		  int size = 10*1024*1024;
		  MultipartRequest multi = null;
		  try {
			multi = new MultipartRequest(request, path, size,"utf-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
 
		String boardid = (String) session.getAttribute("boardid"); //게시판목록
		String boardnum = (String) session.getAttribute("boardnum");//그룹번호
		String memberNickname = (String) session.getAttribute("memberNickname"); 
		String title = (String) multi.getParameter("title");
		String content = (String) multi.getParameter("content");
		
		GroupBoard gb = new GroupBoard();
		
		gb.setBoardid(boardid);
		gb.setS_board_num(Integer.parseInt(boardnum));
		gb.setTitle(title);
		gb.setContent(content);
		gb.setNickname(memberNickname);
		
		GroupBoardDao gbd = new GroupBoardDao();
		int res = gbd.groupInsertBoard(gb);
		System.out.println("result="+res);
		return "redirect:/view/group/groupBoard?boardnum="+boardnum;
	  }
	  
	  request.setAttribute("msg", msg);
	  request.setAttribute("url", url);
	  
	  return "/view/alert.jsp";
  }
  
  //게시글 상세보기
  @RequestMapping("groupBoardInfo")
  public String groupBoardInfo(HttpServletRequest request, HttpServletResponse response) {
	  HttpSession session = request.getSession();
	  String s_board_num = (String) session.getAttribute("boardnum");
	  String board_num = request.getParameter("board_num");
	  GroupBoardDao gbd = new GroupBoardDao();
	  
	  GroupBoard gb = gbd.groupBoardOne(s_board_num, board_num);
	  gbd.groupReadCountUp(Integer.parseInt(board_num));
	  
	  //댓글보여주기
	  ReplyDao rd = new ReplyDao();

	  List<Reply> reply_list = rd.replyWriteList(Integer.parseInt(board_num));
	  int reply_count = rd.replyCount(Integer.parseInt(board_num));
	  
	  request.setAttribute("reply_list", reply_list);
	  request.setAttribute("reply_count", reply_count);
	  
	  request.setAttribute("groupBoard", gb); 
	  
	  return "/view/group/groupBoardInfo.jsp";

	  
  }

  /*이미지 업로드*/
	@RequestMapping("imageUpload")                                             
	public String imageUpload(HttpServletRequest request, HttpServletResponse response) {
 
		String path = getServletContext().getRealPath("/")+"upload";
		String fileName = "";
	    //폴더가 없으면 에러남, 검사 후 폴더생성
	    File file=new File(path);
	    if(!file.exists()) { 
	      file.mkdir();
	    }
	    
	    String filename = null;
	    MultipartRequest multi = null;
	    try {
	      multi = new MultipartRequest(request, path, 10*1024*1024, "utf-8");
	    } catch (IOException e) { 
	      e.printStackTrace();
	    }
	     
	    filename = multi.getFilesystemName("file");
	    System.out.println("filename="+filename);
	    request.setAttribute("filename", filename);
	    return "/single/picturePro2.jsp";
	}
  
  
}
