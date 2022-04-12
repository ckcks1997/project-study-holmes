package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Report;
import service.ReportDao;

public class ReportController extends MskimRequestMapping{
	
	@RequestMapping("sendReport")
	public String sendReport(HttpServletRequest request, HttpServletResponse response) {
			
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	int report_reason = Integer.parseInt(request.getParameter("report_reason"));
	
	//프론트에서 값 잘 넘어왔는지 확인 -----------
	System.out.println("원 게시글: " + board_num);
	System.out.println("신고사유: " + report_reason);
	//--------------------------------------
	
	HttpSession session = request.getSession();
	Report report = new Report();
	ReportDao rd = new ReportDao();
	
	String memberNickname = (String) session.getAttribute("memberNickname");
	report.setReport_num(rd.reportNextNum());
	report.setNickname(memberNickname);
	report.setReport_reason(report_reason);
	report.setBoard_num(board_num);
	
	
	String msg = "";
	String url = "";
	
	
		//신고 등록하기 
		int num = rd.insertReport(report);
		if(num ==1) {
			System.out.println("신고 정상 등록");
			
		} else {
			System.out.println("신고 DB등록 에러");
		}
	
	
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	return "/view/alert.jsp";
	}

} //end class
