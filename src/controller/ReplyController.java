package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Community;
import model.Reply;
import service.ReplyDao;

public class ReplyController extends MskimRequestMapping {

	
	@RequestMapping("writeReply")
	public String writeReply(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		
		String nickname = (String) session.getAttribute("memberNickname");
		String board_num = request.getParameter("board_num");
		String reply_content = request.getParameter("reply_content");
		
		ReplyDao rd = new ReplyDao();
		int reply_num = rd.replyNextNum();
		
		Reply reply = new Reply();
		reply.setBoard_num(Integer.parseInt(board_num));
		reply.setReply_num(reply_num);
		reply.setNickname(nickname);
		reply.setContent(reply_content);
		
		rd.insertReply(reply); //댓글 저장하기
		
		
		//원글의 replycnt에 +1하기 
		rd.comReplyCountUp(Integer.parseInt(board_num));
		System.out.println("board_num:" + board_num);
		

		//reply_num은 댓글의 번호
		request.setAttribute("reply_num", reply_num);
		
		return "/single/num.jsp";	
	}
	
	@RequestMapping("deleteReply")
	public String deleteReply(HttpServletRequest request, HttpServletResponse response) {
		
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		
		System.out.println(reply_num);
		
		
		ReplyDao rd = new ReplyDao();
		Reply reply =  rd.replyOne(reply_num);
		request.setAttribute("reply", reply);
		rd.deleteReply(reply_num);
		
		
		

		return "/view/alert.jsp";
	}
	
	

} // end class
