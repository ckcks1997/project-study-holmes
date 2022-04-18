package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Community;
import model.Report;
import service.CommunityBoardDao;
import service.NoticeDao;
import service.ReportDao;

public class ReportController extends MskimRequestMapping{
	
	@RequestMapping("sendReport")
	public String sendReport(HttpServletRequest request, HttpServletResponse response) {
			
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	int report_option = Integer.parseInt(request.getParameter("report_reason"));
	
	//프론트에서 값 잘 넘어왔는지 확인 -----------
	System.out.println("원 게시글: " + board_num);
	System.out.println("신고사유: " + report_option);
	//--------------------------------------
	
	//신고사유 한번 정리-----------
	String report_reason = "영리목적/스팸홍보성";
	switch (report_option) {
	case 2 :   report_reason = "음란성/선정성"; break;
	case 3 :   report_reason = "욕설/비방/혐오"; break;
	case 4 :   report_reason = "개인정보 노출"; break;
	case 5 :   report_reason = "도배성(같은 내용의 반복 게시)"; break;
	}
	//---------------------------------
	
	
	HttpSession session = request.getSession();
	Report report = new Report();
	ReportDao rd = new ReportDao();
	
	String memberNickname = (String) session.getAttribute("memberNickname");
	
	report.setNickname(memberNickname);
	report.setReport_reason(report_reason);
	report.setBoard_num(board_num);
			//원 게시글 정보 report에 넣기
			CommunityBoardDao cbd = new CommunityBoardDao();
			Community com = cbd.comBoardOne(board_num); 
	report.setWriter_nickname(com.getNickname());
	report.setBoard_num_title(com.getTitle());
	report.setBoard_num_regdate(com.getRegdate());
	
		//신고테이블에 등록하기 
		int num = rd.insertReport(report);
		if(num ==1) {
			System.out.println("신고 정상 등록");
			
		} else {
			System.out.println("신고 DB등록 에러");
		}
		
		
		
		//3번째 신고가 들어오면 알림주고 게시글 삭제 
		List<String> nicknameList = rd.reportNickname(board_num);
		if(nicknameList.size()==3) {
			
			//board_num에 해당하는 원 게시글 정보 찾기
			com = cbd.comBoardOne(board_num);
			//원 게시글 정보에서 작성자 닉네임만 가져오기 
			String writer_nickname = com.getNickname();
														//System.out.println(com); 정보확인
														//System.out.println(writer_nickname); 닉네임 확인
			
			NoticeDao nd = new NoticeDao();
			String from = "관리자";
			String info = "신고요청에 의한 게시물 삭제";
			//알림테이블에 등록하기
			nd.noticeReportWrite(info, from, writer_nickname,board_num); 
			
			cbd.comBoardDelete(board_num); //삭제하기
		} 
		
	//어떤 jsp로 보내든 상관없음
	return "/single/num.jsp";
	}

} //end class
