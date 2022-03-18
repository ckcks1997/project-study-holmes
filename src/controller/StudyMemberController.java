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
import model.MemberTag;
import model.StudyMember;
import service.MemberTagDao;
import service.StudyMemberDao;


// @WebServlet("/studymember/*")
public class StudyMemberController extends MskimRequestMapping {


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
}


