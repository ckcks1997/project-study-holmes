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
 


public class BoardController extends MskimRequestMapping{
  @RequestMapping("list2")
  public String list2(HttpServletRequest request, HttpServletResponse response) {
 
    return "/view/board/list2.jsp";
  }
  
  @RequestMapping("main")
  public String main(HttpServletRequest request, HttpServletResponse response) {
 
    return "/view/main.jsp";
  }
  
}
 