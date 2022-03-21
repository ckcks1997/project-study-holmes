package controller;


import java.io.UnsupportedEncodingException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Community;
import model.Search;
import model.StudyMenu;
import service.CommunityBoardDao;
import service.GroupMemberDao;
import service.StudyMenuDao;

//WebServlet("/studymenu/*")
public class StudyMenuController extends MskimRequestMapping{
	
	@RequestMapping("studyMenuList")
	public String studymenu(HttpServletRequest request, 
			HttpServletResponse response) {

	HttpSession session = request.getSession();
	
	String menuid = "";
	int pageInt = 1;
	int limit = 9;
	
	if (request.getParameter("menuid") !=null) {
		session.setAttribute("menuid", request.getParameter("menuid"));
		session.setAttribute("pageNum", "1");
	}
	
	menuid = (String) session.getAttribute("menuid");
	
	if (menuid==null) {
		menuid = "1";
	}
	
	if (request.getParameter("pageNum") !=null) {
		session.setAttribute("pageNum", request.getParameter("pageNum"));
	}
	
	String pageNum = (String) session.getAttribute("pageNum");
	
	if (pageNum==null) {
		pageNum = "1";
	}
	
	pageInt = Integer.parseInt(pageNum);
	
	StudyMenuDao sd = new StudyMenuDao();
	int menucount = sd.menuCount(menuid);
	
	List<StudyMenu> list = sd.menuList(pageInt, limit, menucount, menuid);
	 
	int menunum = menucount - (pageInt -1) * limit;
	
	int bottomLine = 3;
	int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
	int endPage = startPage + bottomLine -1;
	int maxPage = (menucount / limit) + (menucount % limit == 0 ? 0 : 1);
	if (endPage > maxPage) endPage = maxPage;
	
	String menuName = "전체 스터디";
	switch (menuid) {
	case "2": menuName="개발/프로그래밍"; break;
	case "3": menuName="보안/네트워크"; break;
	case "4": menuName="크리에이티브"; break;
	case "5": menuName="직무/마케팅"; break;
	case "6": menuName="학문/외국어"; break;
	case "7": menuName="교양"; break;	
	}
	
	request.setAttribute("menuName", menuName);
	request.setAttribute("menuid", menuid);
	request.setAttribute("pageInt", pageInt);
	request.setAttribute("menucount", menucount);
	request.setAttribute("list", list);
	request.setAttribute("menunum", menunum);
	request.setAttribute("startPage", startPage);
	request.setAttribute("bottomLine", bottomLine);
	request.setAttribute("endPage", endPage);
	request.setAttribute("maxPage", maxPage);
	
	
	return "/view/study/studyMenuList.jsp";
	}
	
	
	@RequestMapping("studyWriteForm")
	public String studyWriteForm(HttpServletRequest request, 
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/studymember/loginForm";
		
		 if(session.getAttribute("memberNickname")!= null) {
			return "/view/study/studyWriteForm.jsp";	
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		  
		return "/view/alert.jsp";	
		}
	
	@RequestMapping("writePro")
	public String writePro(HttpServletRequest request, 
			HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	StudyMenu studymenu = new StudyMenu();
	
	studymenu.setTitle(request.getParameter("title"));
	studymenu.setSubject(request.getParameter("subject"));
	studymenu.setRegion(request.getParameter("region"));
	studymenu.setPrice(request.getParameter("price"));
	studymenu.setNickname((String)request.getSession().getAttribute("memberNickname"));
	int pernum = Integer.parseInt(request.getParameter("pernum"));	
	studymenu.setPernum(pernum);
	studymenu.setContent(request.getParameter("content"));
	studymenu.setLatitude(request.getParameter("latitude"));
	studymenu.setLongitude(request.getParameter("longitude"));
		 	
	String menuid = (String) request.getSession().getAttribute("menuid");
	if (menuid==null) menuid = "1";
	studymenu.setMenuid(menuid);
	
	StudyMenuDao sm = new StudyMenuDao();
	studymenu.setBoard_num(sm.menuNextNum());	
	
	int num = sm.insertMenu(studymenu);
	System.out.println("============================");
	System.out.println(num);
	
	//group insert
	GroupMemberDao gm = new GroupMemberDao();
	System.out.println(studymenu);
	gm.groupInsert(studymenu, 1);
	
	String msg="게시물 등록 실패";
	String url=request.getContextPath()+"/studymenu/studyWriteForm";
	
	if (num==1) {
		msg="게시물 등록 성공";
		url=request.getContextPath()+"/studymenu/studyMenuList?pageNum=1";
		
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
		
	
	
		return "/view/alert.jsp";
	}
	
	@RequestMapping("studySearch")
	public String studySearch(HttpServletRequest request, 
			HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String part = request.getParameter("part");
		String searchData = request.getParameter("searchData");
		Search sh = new Search();
		sh.setPart(part);
		sh.setSearchData("%" + searchData + "%");
		
		StudyMenuDao dao = new StudyMenuDao();
		List<StudyMenu> list = dao.studySearch(sh);
		request.setAttribute("list", list);
		
		
		
		return "/view/study/menuSearchList.jsp";
	}

	 @RequestMapping("studyMenuInfo")
	  public String studyMenuInfo(HttpServletRequest request, HttpServletResponse response) {
		  
		  int board_num = Integer.parseInt(request.getParameter("board_num"));
		  StudyMenuDao smd = new StudyMenuDao();
		  StudyMenu s = smd.menuBoardOne(board_num);
		  request.setAttribute("s", s);
		  	  	  
		  //session의 닉네임 가져오기
		  HttpSession session = request.getSession();
		  String loginNick = (String)session.getAttribute("memberNickname");
		  request.setAttribute("loginNick", loginNick);
		    
		  
		  return "/view/study/studyMenuInfo.jsp";
	  }		
	 
	 
	 //스터디 참가신청 버튼을 누를 때
	 @RequestMapping("studyIn")
     public String studyIn(HttpServletRequest request, HttpServletResponse response) {
         
          int board_num = Integer.parseInt(request.getParameter("board_num"));
          String nickname = request.getParameter("nickname");
          
         return "/view/study/studyMenuInfo.jsp";
     }     

}
