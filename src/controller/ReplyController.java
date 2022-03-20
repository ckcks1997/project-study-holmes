package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import model.Community;
import model.Reply;
import service.CommunityBoardDao;
import service.ReplyDao;
import util.MybatisConnection;

public class ReplyController extends MskimRequestMapping {

	
	@RequestMapping("writeReply")
	public String writeReply(HttpServletRequest request, HttpServletResponse response) {
		
	
		HttpSession session = request.getSession();
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath() + "/studymember/loginForm";

		if (session.getAttribute("memberNickname") != null) { // 로그인이 되면

			Reply reply = new Reply();
			ReplyDao rd = new ReplyDao();

			reply.setReply_num(rd.replyNextNum());

			// 로그인한 세션의 닉네임 가져오기
			reply.setNickname(String.valueOf(session.getAttribute("memberNickname")));
			reply.setContent(request.getParameter("content"));

			CommunityBoardDao cbd = new CommunityBoardDao();
			
			
			
			//reply.setBoard_num(request.getParameter("board_num"));

			msg = "댓글이 등록되지 않습니다.";
			url = request.getContextPath() + "/community/comWriteForm";

			int num = rd.insertReply(reply);

			if (num == 1) { //저장이 되면
				msg = "댓글이 등록되었습니다";
				url = request.getContextPath() + "/community/comBoardInfo";
				}

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/view/alert.jsp";

	}

} // end class
