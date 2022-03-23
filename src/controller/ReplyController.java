package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		List<Reply> list = rd.replyWriteList(board_num);
		request.setAttribute("list", list);
		
		
		return "/view/alert.jsp";	
	}
	
	
	
	

} // end class
