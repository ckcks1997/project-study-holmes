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


  @RequestMapping("loginForm")
  public String memberloginForm(HttpServletRequest request, HttpServletResponse response) {

    return "/view/member/login.jsp";
  }

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

  @RequestMapping("logout")
  public String logout(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    String login = (String) session.getAttribute("memberID");
    session.invalidate();
    request.setAttribute("msg", login + "로그아웃");
    request.setAttribute("url", request.getContextPath() + "/studymember/loginForm");
    return "/view/alert.jsp";
  }


}


