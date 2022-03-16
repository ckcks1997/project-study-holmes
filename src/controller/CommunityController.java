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


import model.Community;
import service.CommunityBoardDao;
 


public class CommunityController extends MskimRequestMapping{
  @RequestMapping("comBoardList")
  public String comBoardList(HttpServletRequest request, HttpServletResponse response) {
	  HttpSession session = request.getSession();
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
	  
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  int boardcount = cbd.comBoardCount(boardid);
	  List<Community> list = cbd.comBoardList(pageInt, limit, boardcount, boardid);
	  int boardnum = boardcount - limit * (pageInt-1);
	  int bottomLine = 3;
	  int startPage = (pageInt-1)/bottomLine * bottomLine + 1;
	  int endPage = startPage + bottomLine -1;
	  int maxPage = (boardcount/limit)+(boardcount % limit==0? 0:1);
	  if(endPage > maxPage) endPage = maxPage;
	  
	  String boardName = "질문 & 답변";
	  switch(boardid) {
	  case "5" : boardName = "블로그"; break;
	  case "4" : boardName = "공지사항"; break;
	  case "3" : boardName = "정보공유"; break;
	  case "2" : boardName = "자유"; break;
	
	  }
	   request.setAttribute("boardName",boardName);
	   request.setAttribute("pageInt",pageInt);
	   request.setAttribute("boardid",boardid);
	   request.setAttribute("boardcount",boardcount);
	   request.setAttribute("list",list);
	   request.setAttribute("boardnum",boardnum);
	   request.setAttribute("startPage",startPage);
	   request.setAttribute("bottomLine", bottomLine);
	   request.setAttribute("endPage",endPage);
	   request.setAttribute("maxPage",maxPage);
	   
	   
	  
	  
    return "/view/community/comBoardList.jsp";
  }
  
  
  
  @RequestMapping("comWriteForm")
  public String comWriteForm(HttpServletRequest request,  HttpServletResponse response) {
	  
	  return "/view/community/comWriteForm.jsp";
  }
 
  @RequestMapping("comWritePro")
  public String comWritePro(HttpServletRequest request, HttpServletResponse response) {
	  String path = request.getServletContext().getRealPath("/")+"/comboardupload/";
	  int size = 10*1024*1024;
	  MultipartRequest multi = null;
	  try {
		multi = new MultipartRequest(request, path, size,"utf-8");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  Community com = new Community();
	  
	  com.setSubject(multi.getParameter("subject"));
	  com.setTag(multi.getParameter("tag"));
	  com.setContent(multi.getParameter("content"));
	  com.setIp(request.getLocalAddr());
	  
	  HttpSession session = request.getSession();
	  String boardid = (String)session.getAttribute("boardid");
	  	if(boardid ==null) { boardid ="1"; }
	  com.setBoardid(boardid);
	  
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  com.setNum(cbd.comNextNum());
	  com.setRef(com.getNum());
	  
	  int num = cbd.comInsertBoard(com);
	  
	  String msg = "게시물이 등록되지 않습니다.";
	  String url = request.getContextPath()+"/community/comWriteForm";
	  if(num==1) {
		  msg= "게시물이 등록되었습니다.";
		  url = request.getContextPath()+"/community/comBoardList?pageNum=1";
		  
	  }
	  
	  request.setAttribute("msg", msg);
	  request.setAttribute("url", url);
	  
	  
	  
	  return "/view/alert.jsp";
  }
  
  
  @RequestMapping("comBoardInfo")
  public String comBoardInfo(HttpServletRequest request, HttpServletResponse response) {
	  
	  int num = Integer.parseInt(request.getParameter("num"));
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  Community com = cbd.comBoardOne(num);
	  request.setAttribute("com", com);
	  
	  return "/view/community/comBoardInfo.jsp";
  }
  
  
  
  @RequestMapping("comBoardUpdateForm")
 public String comBoardUpdateForm(HttpServletRequest request,  HttpServletResponse response) {
	  
	  return "/view/community/comBoardUpdateForm.jsp";
  }
  
  
  @RequestMapping("main")
  public String main(HttpServletRequest request, HttpServletResponse response) {
 
    return "/view/main.jsp";
  }
  
}
 