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
		
			System.out.println("------------------------");
			
			  String path = request.getServletContext().getRealPath("/")+"/comboardupload/";
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
			
			
		  // 로그인이 되면 조건 추가해야함 

		Reply reply = new Reply();
			
		 HttpSession session = request.getSession();
		// 로그인한 세션의 닉네임 가져오기
		reply.setNickname(String.valueOf(session.getAttribute("memberNickname")));
					
		  int board_num = Integer.parseInt(multi.getParameter("board_num"));
		  reply.setBoard_num(board_num);
		
		  
		  ReplyDao rd = new ReplyDao();
		  reply.setReply_num(rd.replyNextNum());
		  
		  reply.setContent(multi.getParameter("reply_content"));
		  
		 // CommunityBoardDao cbd = new CommunityBoardDao();
		 // Community com = cbd.comBoardOne(board_num);
		 // request.setAttribute("com", com);
		  
	
			
			

			
			int num = rd.insertReply(reply);
			String msg = "댓글 등록실패";
			String url = request.getContextPath()+"/community/comBoardList";
			if(num==1) {
				msg = "댓글 등록 성공";
				url = request.getContextPath()+"/community/comBoardInfo?board_num="+board_num;
			}
		
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
			
	}
	
	

	

} // end class
