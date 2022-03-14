package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import model.StudyMember;
import service.StudyMemberDao;


// @WebServlet("/studymember/*")
public class StudyMemberController extends MskimRequestMapping {


  /*
   * 회원가입 페이지
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
        msg = mem.getName() + "님이 로그인";
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
    String path = getServletContext().getRealPath("/")+"upload/";
    String filename = null;
    MultipartRequest multi = null;
    try {
      multi = new MultipartRequest(request, path, 10*1024*1024, "utf-8");
    } catch (IOException e) { 
      e.printStackTrace();
    }
    filename = multi.getFilesystemName("picture");
    request.setAttribute("filename", filename);
    return "/single/picturePro.jsp";
  }
  
  /*
   * 로그아웃-세션 삭제
   * */
  @RequestMapping("logout")
  public String logout(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    String login = (String) session.getAttribute("memberNickname");
    session.invalidate();
    request.setAttribute("msg", login + "로그아웃");
    request.setAttribute("url", request.getContextPath() + "/studymember/loginForm");
    return "/view/alert.jsp";
  }


}


