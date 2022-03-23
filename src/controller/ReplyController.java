package controller;

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
		
		
		int num = rd.insertReply(reply); //댓글 저장하기
		String msg = "댓글 등록이 되지 않습니다";
		String url = request.getContextPath()+"/community/comBoardInfo";
		
		if(num==1) {
			msg = "댓글이 등록되었습니다";
			url = request.getContextPath() +"/community/comBoardInfo?board_num="+board_num;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
	
		
		return "/view/alert.jsp";	
	}
	
	

	

} // end class
