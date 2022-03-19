package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.oreilly.servlet.MultipartRequest;


import model.Community;
import model.StudyMember;
import service.CommunityBoardDao;
import service.StudyMemberDao;
 


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
  
  
  //글쓰기 페이지
  @RequestMapping("comWriteForm")
  public String comWriteForm(HttpServletRequest request,  HttpServletResponse response) {
	  
	  HttpSession session = request.getSession();
	  String msg = "로그인이 필요합니다";
	  String url = request.getContextPath()+"/studymember/loginForm";
	  
	  if(session.getAttribute("memberNickname")!= null) {
		return "/view/community/comWriteForm.jsp";
	  }
	  
	  request.setAttribute("msg", msg);
	  request.setAttribute("url", url);
	  
	  return "/view/alert.jsp";
  }
 
  
  
  //글쓰기
  @RequestMapping("comWritePro")
  public String comWritePro(HttpServletRequest request, HttpServletResponse response) {
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
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	  
	  Community com = new Community();
	  
	  //세션에 저장된 닉네임 가져와서 커뮤니티 닉네임으로 저장하기
	  HttpSession session = request.getSession();
	  com.setNickname(String.valueOf(session.getAttribute("memberNickname")));
	 
	  com.setTitle(multi.getParameter("title"));
	  com.setContent(multi.getParameter("content"));
	  com.setIp(request.getLocalAddr());
	  
	 
	  String boardid = (String)session.getAttribute("boardid");
	  	if(boardid ==null) { boardid ="1"; }
	  com.setBoardid(boardid);
	  
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  com.setBoard_num(cbd.comNextNum());
	
	  
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
  
  
  
  //게시글 상세보기
  @RequestMapping("comBoardInfo")
  public String comBoardInfo(HttpServletRequest request, HttpServletResponse response) {
	  
	  int board_num = Integer.parseInt(request.getParameter("board_num"));
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  Community com = cbd.comBoardOne(board_num);
	  request.setAttribute("com", com);
	  
	  
	  //session의 닉네임 가져오기
	  HttpSession session = request.getSession();
	  String loginNick = (String)session.getAttribute("memberNickname");
	  request.setAttribute("loginNick", loginNick);
	  
	  
	  
	  return "/view/community/comBoardInfo.jsp";
  }
  
  
  //게시글 수정페이지
  @RequestMapping("comBoardUpdateForm")
 public String comBoardUpdateForm(HttpServletRequest request,  HttpServletResponse response) {
	  
	  int board_num = Integer.parseInt(request.getParameter("board_num"));
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  Community com = cbd.comBoardOne(board_num);
	  request.setAttribute("com", com);
	  
	  
	  
	  return "/view/community/comBoardUpdateForm.jsp";
  }
  
  
  //게시글 수정
  @RequestMapping("comBoardUpdatePro")
  public String comBoardUpdatePro(HttpServletRequest request, HttpServletResponse response) {
	  
	  String path = request.getServletContext().getRealPath("/")+"/comboardupload/";
	  
	  int size = 10*10*1024;
	  MultipartRequest multi = null;
	  try {
		multi = new MultipartRequest(request, path, size, "utf-8");
	  } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	  }
	  Community com = new Community();
	  com.setBoard_num(Integer.parseInt(multi.getParameter("board_num")));
	  com.setTitle(multi.getParameter("title"));
	  com.setContent(multi.getParameter("content"));
	  
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  
	  String msg = "";
	  String url = "";
	  
	
	  
	  //Community newcom = cbd.comBoardOne(com.getNum());
	  if(cbd.comBoardUpdate(com)>0) {
		   msg = "수정되었습니다";
		   url = request.getContextPath()+"/community/comBoardInfo?board_num="+com.getBoard_num();
		 
	  } else {
		  msg = "수정이 실패하였습니다";
	  }
	 
	  
	  request.setAttribute("msg", msg);
	  request.setAttribute("url", url);
	 
	  
	  return "/view/alert.jsp";
	  
  }
  
  
  //게시글 삭제
  @RequestMapping("comBoardDelete") 
  public String comBoardDelete(HttpServletRequest request, HttpServletResponse response) {
	  
	  int board_num = Integer.parseInt(request.getParameter("board_num"));
	  CommunityBoardDao cbd = new CommunityBoardDao();
	  Community com = cbd.comBoardOne(board_num);
	  request.setAttribute("com", com);
	  
	
	  
	  String msg = "";
	  String url = "";
	 
	 
	  if(cbd.comBoardDelete(board_num)>0) {
		  
		  msg = "게시글이 삭제되었습니다.";
		  url = request.getContextPath()+"/community/comBoardList";
	  } else {
		  msg= "삭제가 불가능합니다";
		  url = request.getContextPath()+"/community/comBoardInfo";
	  }
	
	  request.setAttribute("msg", msg);
	  request.setAttribute("url", url);
	
	  return "/view/alert.jsp";
  	
  }
  
  
  
  
  
  
  
  //메인
  @RequestMapping("main")
  public String main(HttpServletRequest request, HttpServletResponse response) {
 
    return "/view/main.jsp";
  }
  
}
 