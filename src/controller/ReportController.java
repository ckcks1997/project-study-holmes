package controller;

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
	
	//프론트에서 값 잘 넘어왔는지 확인 ----
	System.out.println(board_num);
	System.out.println(report_reason);
	//-----
	
	HttpSession session = request.getSession();
	Report report = new Report();
	ReportDao rd = new ReportDao();
	
	report.setNickname((String) session.getAttribute("memberNickname"));
	report.setBoard_num(board_num);
	report.setReport_num(rd.reportNextNum());
	report.setReport_reason(report_reason);
	int num = rd.insertReport(report);
	System.out.println(num);
	
	
	
	
	return "/view/main.jsp";
	}

} //end class
