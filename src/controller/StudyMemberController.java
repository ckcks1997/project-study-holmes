package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import model.GroupMember;
import model.MemberTag;
import model.Notice;
import model.StudyMember;
import model.StudyMenu;
import service.GroupMemberDao;
import service.MemberTagDao;
import service.NoticeDao;
import service.StudyMemberDao;
import service.StudyMenuDao;


// @WebServlet("/studymember/*")
public class StudyMemberController extends MskimRequestMapping {


  /*
   * 알림 페이지
   * */
  @RequestMapping("notice")
  public String memberNotice(HttpServletRequest request, HttpServletResponse response) {

    String id = (String) request.getSession().getAttribute("memberNickname");
    String msg = "로그인이 필요합니다";
    String url = request.getContextPath()+"/studymember/loginForm";
    if(id != null) {
      NoticeDao nd = new NoticeDao();
      List<Notice> noticeList = nd.noticeGet(id); //알림 리스트 가져옴
      System.out.println(nd.noticeRead(id)); //전부 읽음처리
      request.setAttribute("noticeList", noticeList);
      request.getSession().setAttribute("noticeCount", 0);
      return "/view/member/memberNotice.jsp";      
    }
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  /*
   * 알림 상세
   * */
  @RequestMapping("noticeInfo")
  public String noticeInfo(HttpServletRequest request, HttpServletResponse response) {

    String id = (String) request.getSession().getAttribute("memberNickname");
    String msg = "로그인이 필요합니다";
    String url = request.getContextPath()+"/studymember/loginForm";
    if(id != null) {
      NoticeDao nd = new NoticeDao();
      StudyMenuDao md = new StudyMenuDao(); 
      int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
      Notice n = nd.noticeGetByNoticeNum(noticeNum);
      StudyMenu menu = md.menuBoardOne(Integer.parseInt(n.getInfo2()));
      String title = menu.getTitle();
      if(n.getNickname_to().equals(id)) {
        request.setAttribute("notice", n);
        request.setAttribute("title", title);
        return "/view/member/memberNoticeInfo.jsp";
      }      
    }
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  
  /*
   * 알림-그룹초대 수락
   * */
  @RequestMapping("groupAccept")
  public String groupAccept(HttpServletRequest request, HttpServletResponse response) {

    String id = (String) request.getSession().getAttribute("memberNickname");
 
   
    String msg = "로그인이 필요합니다";
    String url = request.getContextPath()+"/studymember/loginForm";
    if(id != null) {
      NoticeDao nd = new NoticeDao();
      StudyMenuDao md = new StudyMenuDao(); 
      
      int noticeNum = Integer.parseInt(request.getParameter("notice_num")); //알림번호 가져옴
      Notice n = nd.noticeGetByNoticeNum(noticeNum); //알림정보 조회
      StudyMenu menu = md.menuBoardOne(Integer.parseInt(n.getInfo2())); //알림정보에 있는 스터디 보드번호로 보드조회
 
      if(n.getNickname_to().equals(id)) { //세션과 알림 받은사람 비교, 본인확인
        GroupMemberDao gmd = new GroupMemberDao(); //group에 초대하는 과정
        GroupMember gm = new GroupMember();
        gm.setBoardnum(menu.getBoard_num());
        gm.setNickname(n.getNickname_from()); 
        gmd.groupInsert(gm, 0);
        
        
        /*TODO: 스터디에 참가한 사람에게 알림 전송*/
        
        
        msg = "등록되었습니다";
        url = request.getContextPath()+"/studymember/notice";
         
      }      
    }
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  /*
   * 로그인 페이지
   * */
  @RequestMapping("loginForm")
  public String memberloginForm(HttpServletRequest request, HttpServletResponse response) {

    return "/view/member/login.jsp";
  }
  
  /*
   * 비밀번호 찾기
   * */
  @RequestMapping("findPassword")
  public String memberfindPassword(HttpServletRequest request, HttpServletResponse response) {
    
    String msg = "기능개발진행중..";
    String url = request.getContextPath() + "/studymember/loginForm";
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }

  /*
   * 로그인 과정
   * 
   * 로그인 성공시에는 memberID(이메일)와 memberNickname(닉네임, 이름x!!),memberPicture 3가지 세션이 생성됩니다.
   * */
  
  @RequestMapping("loginPro")
  public String memberloginPro(HttpServletRequest request, HttpServletResponse response) {

    try {
      request.setCharacterEncoding("utf-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    String id = request.getParameter("id"); // email
    String pass = request.getParameter("password"); 
    
    StudyMemberDao md = new StudyMemberDao();
    StudyMember mem = md.studyMemberOne(id);
    String msg = "아이디를 확인하세요";
    String url = request.getContextPath() + "/studymember/loginForm";
    if (mem != null) {
      if (pass.equals(mem.getPassword())) {
        request.getSession().setAttribute("memberID", mem.getEmail());
        request.getSession().setAttribute("memberNickname", mem.getNickname());
        request.getSession().setAttribute("memberPicture", mem.getPicture());
        msg = "";
        url = request.getContextPath() + "/board/main";
      } else {
        System.out.println(mem);
        msg = "비밀번호 확인하세요";
      }
    }

    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  
  /*
   * 로그아웃-세션 삭제
   * */
  @RequestMapping("logout")
  public String logout(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    String login = (String) session.getAttribute("memberNickname");
    session.invalidate();
    request.setAttribute("msg", "");
    request.setAttribute("url", request.getContextPath() + "/studymember/loginForm");
    return "/view/alert.jsp";
  }
  
  
    /*회원가입*/
  
  
  /*
   * 회원가입 페이지
   * */
  @RequestMapping("join")
  public String memberJoin(HttpServletRequest request, HttpServletResponse response) {
    
    return "/view/member/join.jsp";
  }

  /*
   * 회원가입 진행
   * 
   * */
  @RequestMapping("joinPro")
  public String memberJoinPro(HttpServletRequest request, HttpServletResponse response) {
    
    try {
      request.setCharacterEncoding("utf-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    
    StudyMemberDao md = new StudyMemberDao();
    int result = md.insertStudyMember(request);
    
    String msg = "가입 실패";
    String url = request.getContextPath() + "/studymember/loginForm";
    
    if(result == 1) msg="가입 성공";
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  /*
   * id중복체크
   * */
  @RequestMapping("idexist")
  public String idExist(HttpServletRequest request, HttpServletResponse response) {

    try {
      request.setCharacterEncoding("utf-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    String id = request.getParameter("id");  
    System.out.println("id="+id);
    StudyMemberDao md = new StudyMemberDao();
    int mem = md.studyMemberIdExist(id); 
    System.out.println("result="+mem);
    request.setAttribute("chk", mem); 
    return "/single/readId.jsp";
  }
  
  /*
   * 닉네임 중복확인
   * */
  @RequestMapping("nicknameExist")
  public String nicknameExist(HttpServletRequest request, HttpServletResponse response) {

    try {
      request.setCharacterEncoding("utf-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    String nickname = request.getParameter("nickname");  
    System.out.println("nicknameExist="+nickname);
    StudyMemberDao md = new StudyMemberDao();
    int mem = md.studyMemberNicknameExist(nickname); 
    System.out.println("result="+mem);
    request.setAttribute("chk", mem); 
    return "/single/readId.jsp";
  }
  /*
   * 회원가입 내 사진등록 창
   * */
  @RequestMapping("pictureForm")
  public String pictureForm(HttpServletRequest request, HttpServletResponse response) {

    return "/single/pictureForm.jsp";
  }
  
  /*
   * 회원가입 내 사진등록 진행
   * */
  @RequestMapping("picturePro")
  public String picturePro(HttpServletRequest request, HttpServletResponse response) {
    
    String path = getServletContext().getRealPath("/")+"upload";
    
    //폴더가 없으면 에러남, 검사 후 폴더생성
    File file=new File(path);
    if(!file.exists()) { 
      file.mkdir();
    }
    
    String filename = null;
    MultipartRequest multi = null;
    try {
      multi = new MultipartRequest(request, path, 10*1024*1024, "utf-8");
      System.out.println("asdasd===1");
    } catch (IOException e) { 
      e.printStackTrace();
    }
    filename = multi.getFilesystemName("picture");
    request.setAttribute("filename", filename);
    return "/single/picturePro.jsp";
  }
  
  
    /*마이페이지*/

  /*
   * 마이페이지
   * */
  @RequestMapping("mypage")
  public String mypage(HttpServletRequest request, HttpServletResponse response) {
    
    HttpSession session = request.getSession();
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    
    if(session.getAttribute("memberID") != null) {
      String memberID = (String) session.getAttribute("memberID");
      StudyMemberDao md = new StudyMemberDao();
      StudyMember mem = md.studyMemberOne(memberID);
      request.setAttribute("memberInfo", mem);
    }

    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/member/mypage.jsp";
  }
  
    /*내  프로필 정보*/
  
  /*
   * 내 프로필 정보
   * */
  @RequestMapping("myprofile")
  public String myprofile(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    
    if(session.getAttribute("memberID") != null) {
      String memberID = (String) session.getAttribute("memberID");
      StudyMemberDao md = new StudyMemberDao();
      MemberTagDao td = new MemberTagDao();
      
      StudyMember mem = md.studyMemberOne(memberID);
      List<MemberTag> mem_tag = td.getMemberTag(memberID);
      
    
      
      request.setAttribute("memberInfo", mem);
      request.setAttribute("tagInfo", mem_tag);
      
      return "/view/member/myprofile.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  /*
   * 내 프로필 정보-자기소개 수정칸
   * */
  @RequestMapping("myprofileEdit1")
  public String myprofileEdit1(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    if(session.getAttribute("memberID") != null) {
      String s_id = (String)request.getSession().getAttribute("memberID");
      String profile_intro = (String) request.getParameter("profile_intro");

      StudyMemberDao md = new StudyMemberDao();
      int result = md.studyMemberIntroUpdate(s_id, profile_intro);

      if(result == 1) {
        msg="수정되었습니다";
        url="studymember/myprofile";
      }
    }
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
     
    return "/view/alert.jsp";
  }
  
  /*
   * 내 프로필 정보-두번째 수정칸(태그추가)
   * */
  @RequestMapping("myprofileEdit2")
  public String myprofileEdit2(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    String tag = (String) request.getParameter("tag");
    
    if(session.getAttribute("memberID") != null && !tag.isEmpty()) {
      String s_id = (String)request.getSession().getAttribute("memberID");
      MemberTagDao td = new MemberTagDao();
      int result = td.addMemberTag(s_id, tag); 
      msg="추가 되었습니다.";
      url="studymember/myprofile";
    } 

    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";
  }
  
  
  /*
   * 비밀번호 변경
   * */
  @RequestMapping("passwordChange")
  public String passwordChange(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession(); 
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    
    if(session.getAttribute("memberID") != null) {
      return "/view/member/passwordChange.jsp"; 
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";

  }
  
  /*
   * 비밀번호 변경 진행
   * */
  @RequestMapping("passwordChangePro")
  public String passwordChangePro(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession(); 
    
    String newPass = request.getParameter("password");
    
    String msg="오류가 발생했습니다.";
    String url="studymember/loginForm";
    
    if(session.getAttribute("memberID") != null && !newPass.isEmpty()) {
      String s_id = (String)request.getSession().getAttribute("memberID");
      StudyMemberDao md = new StudyMemberDao();
      int result = md.changePassword(s_id, newPass); 
      msg="비밀번호가 변경 되었습니다.";
      url="studymember/myprofile";
    }  
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    return "/view/alert.jsp";

  }
  
  /*
   * 회원탈퇴
   * */
  @RequestMapping("goodbye")
  public String goodBye(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession(); 
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    
    if(session.getAttribute("memberID") != null) {
      String memberID = (String) session.getAttribute("memberID");
      StudyMemberDao md = new StudyMemberDao();
      StudyMember mem = md.studyMemberOne(memberID);
       
      request.setAttribute("memberInfo", mem);
       
      return "/view/member/goodbye.jsp";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
 
    return "/view/alert.jsp"; 
  }
  
  /*
   * 회원탈퇴 진행
   * */
  @RequestMapping("goodbyePro")
  public String goodbyePro(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession(); 
    String msg="로그인이 필요합니다";
    String url="studymember/loginForm";
    
    if(session.getAttribute("memberID") != null) {
      String memberID = (String) session.getAttribute("memberID");
      String pw = request.getParameter("password");
      
      StudyMemberDao md = new StudyMemberDao();
      StudyMember mem = md.studyMemberOne(memberID);
      
      if(mem.getPassword().equals(pw)) {
        int deleted = md.studyMemberDelete(memberID);
        
        if(deleted == 1) {
          session.invalidate();
          msg="회원탈퇴가 완료되었습니다.";
          url="main";
        } else {
          
          msg="알 수 없는 오류";
          url="main";
        }
      }else {
        
        msg="비밀번호가 다릅니다";
        url="studymember/goodbye";
      }
        
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
 
    return "/view/alert.jsp"; 
  }
  
  @RequestMapping("mywrite_study")
  public String mywrite_study(HttpServletRequest request, HttpServletResponse response) {
 
 
    return "/view/member/mywrite_study.jsp"; 
  }
  
}


