package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;

import model.Community;
import model.Reply;
import service.CommunityBoardDao;
import service.ReplyDao;
import util.MybatisConnection;

public class ReplyController extends MskimRequestMapping {

	
	@RequestMapping("writeReply")
	public String writeReply(HttpServletRequest request, HttpServletResponse response) {
		String a = request.getParameter("board_num");
		String b = request.getParameter("reply_content");
		
		System.out.println(a);
		System.out.println(b);
		return "/view/aaa.jsp";	
	}
	
	

	

} // end class
