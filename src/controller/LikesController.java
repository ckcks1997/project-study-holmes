package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Likes;
import service.LikesDao;

public class LikesController extends MskimRequestMapping {

@RequestMapping("likesPro")

public String likesPro(HttpServletRequest request, HttpServletResponse response) {
	Likes likes = new Likes();
	HttpSession session = request.getSession();
	likes.setNickname(String.valueOf(session.getAttribute("memberNickname")));
	
	LikesDao ld = new LikesDao();
	
	
	return "/view/alert.jsp";
}
	
}
