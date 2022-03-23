package controller;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Search;
import model.StudyMenu;
import model.GroupMember;
import model.Search;
import model.StudyMenu;
import service.GroupMemberDao;
import service.NoticeDao;
import service.StudyMenuDao;

//WebServlet("/studymenu/*")
public class StudyMenuController extends MskimRequestMapping{
	
	@RequestMapping("onStudyMenuList") 
	public String onStudyMenuList(HttpServletRequest request, 
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
		menuid = "8"; 
		}
	 
	
	if (request.getParameter("pageNum") !=null) {
		session.setAttribute("pageNum", request.getParameter("pageNum"));
	}
	
	  String pageNum =(String)session.getAttribute("pageNum");
	  if(pageNum == null) {
		  pageNum = "1";
	  }
	  
	pageInt = Integer.parseInt(pageNum);
	
	StudyMenuDao sd = new StudyMenuDao();
	int menucount = sd.menuCount(menuid);
	List<StudyMenu> list = sd.menuList(pageInt, limit, menucount, menuid);
	
	int menuAllCount = sd.onAllCount();
	List<StudyMenu> allList = sd.onallList(pageInt, limit, menuAllCount, menuid);
	
	int menunum = menucount - (pageInt -1) * limit;
	
	
	int bottomLine = 3;
	int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
	int endPage = startPage + bottomLine -1;
	int maxPage = (menucount / limit) + (menucount % limit == 0 ? 0 : 1);
	if (endPage > maxPage) endPage = maxPage;
	
	/* 전체스터디페이징 */
	int a_menunum = menuAllCount - (pageInt -1) * limit;
	int a_bottomLine = 3;
	int a_startPage = (pageInt -1 )/ a_bottomLine * a_bottomLine + 1;
	int a_endPage = a_startPage + a_bottomLine -1;
	int a_maxPage = (menuAllCount / limit) + (menuAllCount % limit == 0 ? 0 : 1);
	if (a_endPage > a_maxPage) a_endPage = a_maxPage;
	
	String menuName = "";
	switch (menuid) {
	case "8": menuName="전체 스터디"; 
		/* 전체스터디목록 */
	list = allList; break;
	case "9": menuName="개발/프로그래밍"; break;
	case "10": menuName="보안/네트워크"; break;
	case "11": menuName="크리에이티브"; break;
	case "12": menuName="직무/마케팅"; break;
	case "13": menuName="학문/외국어"; break;
	case "14": menuName="교양"; break;	
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
	
	
	request.setAttribute("a_menunum", a_menunum);
	request.setAttribute("a_bottomLine", a_bottomLine);
	request.setAttribute("a_startPage", a_startPage);
	request.setAttribute("a_endPage", a_endPage);
	request.setAttribute("a_maxPage", a_maxPage);
	
	return "/view/study/onStudyMenuList.jsp";
	}	
	
	
	
	
	@RequestMapping("offStudyMenuList") 
	public String offstudyMenuList(HttpServletRequest request, 
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
	
	  String pageNum =(String)session.getAttribute("pageNum");
	  if(pageNum == null) {
		  pageNum = "1";
	  }
	  
	pageInt = Integer.parseInt(pageNum);
	
	StudyMenuDao sd = new StudyMenuDao();
	int menucount = sd.menuCount(menuid);
	List<StudyMenu> list = sd.menuList(pageInt, limit, menucount, menuid);
	
	int menuAllCount = sd.offAllCount();
	List<StudyMenu> allList = sd.offallList(pageInt, limit, menuAllCount, menuid);
	
	int menunum = menucount - (pageInt -1) * limit;
	
	
	int bottomLine = 3;
	int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
	int endPage = startPage + bottomLine -1;
	int maxPage = (menucount / limit) + (menucount % limit == 0 ? 0 : 1);
	if (endPage > maxPage) endPage = maxPage;
	
	/* 전체스터디페이징 */
	int a_menunum = menuAllCount - (pageInt -1) * limit;
	int a_bottomLine = 3;
	int a_startPage = (pageInt -1 )/ a_bottomLine * a_bottomLine + 1;
	int a_endPage = a_startPage + a_bottomLine -1;
	int a_maxPage = (menuAllCount / limit) + (menuAllCount % limit == 0 ? 0 : 1);
	if (a_endPage > a_maxPage) a_endPage = a_maxPage;
	
	String menuName = "";
	switch (menuid) {
	case "1": menuName="전체 스터디"; 
		/* 전체스터디목록 */
	list = allList; break;
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
	
	
	request.setAttribute("a_menunum", a_menunum);
	request.setAttribute("a_bottomLine", a_bottomLine);
	request.setAttribute("a_startPage", a_startPage);
	request.setAttribute("a_endPage", a_endPage);
	request.setAttribute("a_maxPage", a_maxPage);
	
	return "/view/study/offStudyMenuList.jsp";
	}	
	
	@RequestMapping("onoffStudyMenuList") 
	public String onoffStudyMenuList(HttpServletRequest request, 
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
		menuid = "15"; 
		}
	 
	
	if (request.getParameter("pageNum") !=null) {
		session.setAttribute("pageNum", request.getParameter("pageNum"));
	}
	
	  String pageNum =(String)session.getAttribute("pageNum");
	  if(pageNum == null) {
		  pageNum = "1";
	  }
	  
	pageInt = Integer.parseInt(pageNum);
	
	StudyMenuDao sd = new StudyMenuDao();
	int menucount = sd.menuCount(menuid);
	List<StudyMenu> list = sd.menuList(pageInt, limit, menucount, menuid);
	
	int menuAllCount = sd.onoffAllCount();
	List<StudyMenu> allList = sd.onoffallList(pageInt, limit, menuAllCount, menuid);
	
	int menunum = menucount - (pageInt -1) * limit;
	
	
	int bottomLine = 3;
	int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
	int endPage = startPage + bottomLine -1;
	int maxPage = (menucount / limit) + (menucount % limit == 0 ? 0 : 1);
	if (endPage > maxPage) endPage = maxPage;
	
	/* 전체스터디페이징 */
	int a_menunum = menuAllCount - (pageInt -1) * limit;
	int a_bottomLine = 3;
	int a_startPage = (pageInt -1 )/ a_bottomLine * a_bottomLine + 1;
	int a_endPage = a_startPage + a_bottomLine -1;
	int a_maxPage = (menuAllCount / limit) + (menuAllCount % limit == 0 ? 0 : 1);
	if (a_endPage > a_maxPage) a_endPage = a_maxPage;
	
	String menuName = "";
	switch (menuid) {
	case "15": menuName="전체 스터디"; 
		/* 전체스터디목록 */
	list = allList; break;
	case "16": menuName="개발/프로그래밍"; break;
	case "17": menuName="보안/네트워크"; break;
	case "18": menuName="크리에이티브"; break;
	case "19": menuName="직무/마케팅"; break;
	case "20": menuName="학문/외국어"; break;
	case "21": menuName="교양"; break;	
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
	
	
	request.setAttribute("a_menunum", a_menunum);
	request.setAttribute("a_bottomLine", a_bottomLine);
	request.setAttribute("a_startPage", a_startPage);
	request.setAttribute("a_endPage", a_endPage);
	request.setAttribute("a_maxPage", a_maxPage);
	
	return "/view/study/onoffStudyMenuList.jsp";
	}	
	
	
	/*---------------------------------------------------------------------------*/
	/* 오프라인글쓰기 */
	@RequestMapping("offStudyWriteForm")
	public String offStudyWriteForm(HttpServletRequest request, 
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/studymember/loginForm";
		
		 if(session.getAttribute("memberNickname")!= null) {
			return "/view/study/offStudyWriteForm.jsp";	
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		  
		return "/view/alert.jsp";	
		}
	

	@RequestMapping("offWritePro")
	public String offWritePro(HttpServletRequest request, 
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
	
	//group insert
	GroupMemberDao gm = new GroupMemberDao();
    System.out.println(studymenu);
    GroupMember gmem = new GroupMember();
    gmem.setBoardnum(studymenu.getBoard_num());
    gmem.setNickname(studymenu.getNickname());
    gm.groupInsert(gmem, 1);
	
	String msg="게시물 등록 실패";
	String url=request.getContextPath()+"/studymenu/offStudyWriteForm";
	
	if (num==1) {
		msg="게시물 등록 성공";
		url=request.getContextPath()+"/studymenu/offStudyMenuList?pageNum=1";
		
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
		
	
	
		return "/view/alert.jsp";
	}
	
	/* 온라인글쓰기 */
	@RequestMapping("onStudyWriteForm")
	public String onStudyWriteForm(HttpServletRequest request, 
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/studymember/loginForm";
		
		 if(session.getAttribute("memberNickname")!= null) {
			return "/view/study/onStudyWriteForm.jsp";	
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		  
		return "/view/alert.jsp";	
		}
	

	@RequestMapping("onWritePro")
	public String onWritePro(HttpServletRequest request, 
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
	
	//group insert
	GroupMemberDao gm = new GroupMemberDao();
    System.out.println(studymenu);
    GroupMember gmem = new GroupMember();
    gmem.setBoardnum(studymenu.getBoard_num());
    gmem.setNickname(studymenu.getNickname());
    gm.groupInsert(gmem, 1);
	
	String msg="게시물 등록 실패";
	String url=request.getContextPath()+"/studymenu/onStudyWriteForm";
	
	if (num==1) {
		msg="게시물 등록 성공";
		url=request.getContextPath()+"/studymenu/onStudyMenuList?pageNum=1";
		
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
		
	
	
		return "/view/alert.jsp";
	}
	
	/* 온라인글쓰기 */
	@RequestMapping("onoffStudyWriteForm")
	public String onoffStudyWriteForm(HttpServletRequest request, 
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/studymember/loginForm";
		
		 if(session.getAttribute("memberNickname")!= null) {
			return "/view/study/onoffStudyWriteForm.jsp";	
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		  
		return "/view/alert.jsp";	
		}
	
		/* 온오프라인글쓰기 */
	@RequestMapping("onoffWritePro")
	public String onoffWritePro(HttpServletRequest request, 
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
	
	//group insert
	GroupMemberDao gm = new GroupMemberDao();
    System.out.println(studymenu);
    GroupMember gmem = new GroupMember();
    gmem.setBoardnum(studymenu.getBoard_num());
    gmem.setNickname(studymenu.getNickname());
    gm.groupInsert(gmem, 1);
	
	String msg="게시물 등록 실패";
	String url=request.getContextPath()+"/studymenu/onoffStudyWriteForm";
	
	if (num==1) {
		msg="게시물 등록 성공";
		url=request.getContextPath()+"/studymenu/onoffStudyMenuList?pageNum=1";
		
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
		
	
	
		return "/view/alert.jsp";
	}
	
	
	/* 전체검색 */
	/*---------------------------------------------------------------------------*/
	/*
	 * @RequestMapping("allstudySearch") public String
	 * allstudySearch(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * try { request.setCharacterEncoding("utf-8"); } catch
	 * (UnsupportedEncodingException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } String part = request.getParameter("part"); String
	 * searchData = request.getParameter("searchData");
	 * 
	 * Search sh = new Search(); sh.setPart(part); sh.setSearchData("%" + searchData
	 * + "%");
	 * 
	 * StudyMenuDao dao = new StudyMenuDao(); List<StudyMenu> list =
	 * dao.allstudySearch(sh); request.setAttribute("list", list);
	 * 
	 * 
	 * HttpSession session = request.getSession(); String menuid = ""; int pageInt =
	 * 1; int limit = 9;
	 * 
	 * if(request.getParameter("menuid")!= null) { session.setAttribute("menuid",
	 * request.getParameter("menuid")); session.setAttribute("pageNum", "1"); }
	 * 
	 * menuid = (String)session.getAttribute("menuid"); if(menuid == null) { menuid
	 * ="1"; }
	 * 
	 * if (request.getParameter("pageNum")!=null) { session.setAttribute("pageNum",
	 * request.getParameter("pageNum")); }
	 * 
	 * String pageNum =(String)session.getAttribute("pageNum"); if(pageNum == null)
	 * { pageNum = "1"; }
	 * 
	 * pageInt = Integer.parseInt(pageNum);
	 * 
	 * int menuAllCount = dao.allstudySearchCount(); int boardnum = menuAllCount -
	 * limit * (pageInt-1); int bottomLine = 3; int startPage =
	 * (pageInt-1)/bottomLine * bottomLine + 1; int endPage = startPage + bottomLine
	 * -1; int maxPage = (menuAllCount/limit)+(menuAllCount % limit==0? 0:1);
	 * if(endPage > maxPage) endPage = maxPage;
	 * 
	 * String menuName = "전체 스터디";
	 * 
	 * request.setAttribute("menuName",menuName);
	 * request.setAttribute("pageInt",pageInt);
	 * request.setAttribute("menuid",menuid);
	 * request.setAttribute("menuAllCount",menuAllCount);
	 * request.setAttribute("boardnum",boardnum);
	 * request.setAttribute("startPage",startPage);
	 * request.setAttribute("bottomLine", bottomLine);
	 * request.setAttribute("endPage",endPage);
	 * request.setAttribute("maxPage",maxPage);
	 * 
	 * return "/view/study/menuSearchList.jsp"; }
	 */
	
	/*---------------------------------------------------------------------------*/
	@RequestMapping("studySearch")
	public String studySearch(HttpServletRequest request, 
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String part = "";
		String searchData = ""; 
		  
		part = request.getParameter("part");
		searchData = request.getParameter("searchData");
		String menuid = request.getParameter("menuid");
			
		StudyMenuDao smd = new StudyMenuDao();
		smd.studySearch(part,searchData,menuid);
			
		return "/studymenu/studySearchList";
	}
	

	/*---------------------------------------------------------------------------*/
	  @RequestMapping("studySearchList")
	  public String studySearchList(HttpServletRequest request, HttpServletResponse response) {
		  HttpSession session = request.getSession();
		 
		  String menuid = "";
		  int pageInt = 1;
		  int limit = 9;
		  String part = request.getParameter("part"); 
		  String searchData = request.getParameter("searchData"); 
		  
		  
		  if(request.getParameter("menuid")!= null) { 
			  session.setAttribute("menuid", request.getParameter("menuid")); 
			  session.setAttribute("pageNum", "1");	 
		  }
		  
		  menuid = (String)session.getAttribute("menuid");
		  if(menuid == null) {
			  menuid ="1";
		  }
		  
		  if (request.getParameter("pageNum")!=null) {
			  session.setAttribute("pageNum", request.getParameter("pageNum"));
		  }
		  
		  String pageNum =(String)session.getAttribute("pageNum");
		  if(pageNum == null) {
			  pageNum = "1";
		  }
		  
		  pageInt = Integer.parseInt(pageNum);
		  request.setAttribute("part",part);
		  request.setAttribute("searchData",searchData);
		  
		  StudyMenuDao smd = new StudyMenuDao();
		  int menucount = smd.studySearchCount(menuid,part,searchData);
		  List<StudyMenu> searchList = smd.studySearchList(pageInt, limit, menucount, menuid,part,searchData);
		  List<StudyMenu> searchAllList = smd.studySearchAllList(pageInt, limit, menucount, menuid,part,searchData);
		  int menunum = menucount - limit * (pageInt-1);
		  int bottomLine = 3;
		  int startPage = (pageInt-1)/bottomLine * bottomLine + 1;
		  int endPage = startPage + bottomLine -1;
		  int maxPage = (menucount/limit)+(menucount % limit==0? 0:1);
		  if(endPage > maxPage) endPage = maxPage;
		  
			/* 전체페이지 */
		 int menuAllCount = smd.studySearchAllCount(part,searchData);
		 int a_menunum = menuAllCount - (pageInt -1) * limit;
		 int a_bottomLine = 3;
		 int a_startPage = (pageInt -1 )/ a_bottomLine * a_bottomLine + 1;
		 int a_endPage = a_startPage + a_bottomLine -1;
		 int a_maxPage = (menuAllCount / limit) + (menuAllCount % limit == 0 ? 0 : 1);
		 if (a_endPage > a_maxPage) a_endPage = a_maxPage;
		  
		  
			String menuName = "";
			switch (menuid) {
			case "1": menuName="전체 스터디";
			searchList = searchAllList;
			break;
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
		request.setAttribute("searchList", searchList);
		request.setAttribute("menunum", menunum);
		request.setAttribute("startPage", startPage);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("endPage", endPage);
		request.setAttribute("maxPage", maxPage);
		
		request.setAttribute("a_menunum", a_menunum);
		request.setAttribute("a_bottomLine", a_bottomLine);
		request.setAttribute("a_startPage", a_startPage);
		request.setAttribute("a_endPage", a_endPage);
		request.setAttribute("a_maxPage", a_maxPage);

		  
	   return "/view/study/menuSearchList.jsp";
	 }

	  
	  /*---------------------------------------------------------------------------*/
	 @RequestMapping("studyMenuInfo")
	  public String studyMenuInfo(HttpServletRequest request, HttpServletResponse response) {
		  
		  int board_num = Integer.parseInt(request.getParameter("board_num"));
		  StudyMenuDao smd = new StudyMenuDao();
		  StudyMenu s = smd.menuBoardOne(board_num);
		  request.setAttribute("s", s);
		  
		  // session의 닉네임 가져오기
		  HttpSession session = request.getSession();
		  String loginNick = (String)session.getAttribute("memberNickname");
		  request.setAttribute("loginNick", loginNick);
		    
		  
		  return "/view/study/studyMenuInfo.jsp";
	  }			
	 
	 	 
	 /*
	   * 내가 쓴 게시물  스터디 게시물
	   */
	  
	 @RequestMapping("myList2")
		public String myList2(HttpServletRequest request, 
				HttpServletResponse response) {
		
			HttpSession session = request.getSession();
			String msg = "로그인이 필요합니다";
			String url ="studymember/loginForm";
			 if(session.getAttribute("memberNickname")!= null) {
					
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);  
			return "/view/study/myList2.jsp";	
			}
	 

	 /*---------------------------------------------------------------------------*/
	 // 스터디 참가신청 버튼을 누를 때
	  @RequestMapping("studyIn")
	  public String studyIn(HttpServletRequest request, HttpServletResponse response) {
	    try {
	      request.setCharacterEncoding("utf-8");
	    } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	    }
	    int board_num = Integer.parseInt(request.getParameter("board_num"));
	    String nickname_from = (String) request.getParameter("f_nickname");
	    String nickname_to = (String) request.getParameter("t_nickname");

	    System.out.println(nickname_to);
	    NoticeDao nd = new NoticeDao();
	    nd.noticeWrite(board_num, nickname_from, nickname_to);

	    String msg = "참가 요청이 전송되었습니다";
	    String url = request.getContextPath()+"/studymenu/studyMenuList";


	    request.setAttribute("msg", msg);
	    request.setAttribute("url", url);
	    
	    
	    return "/view/alert.jsp";
	  }
}
