package model;

import java.util.Date;

public class Report {

	private int report_num;
	private String nickname;
	private String report_reason;
	private int board_num;
	private String writer_nickname;
	private String board_num_title;
	private Date board_num_regdate;
	
	
	

	public Report() {
		super();
	}
	public Report(int report_num, String nickname, String report_reason, int board_num, String writer_nickname,
			String board_num_title, Date board_num_regdate) {
		super();
		this.report_num = report_num;
		this.nickname = nickname;
		this.report_reason = report_reason;
		this.board_num = board_num;
		this.writer_nickname = writer_nickname;
		this.board_num_title = board_num_title;
		this.board_num_regdate = board_num_regdate;
	}
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter_nickname() {
		return writer_nickname;
	}
	public void setWriter_nickname(String writer_nickname) {
		this.writer_nickname = writer_nickname;
	}
	public String getBoard_num_title() {
		return board_num_title;
	}
	public void setBoard_num_title(String board_num_title) {
		this.board_num_title = board_num_title;
	}
	public Date getBoard_num_regdate() {
		return board_num_regdate;
	}
	public void setBoard_num_regdate(Date board_num_regdate) {
		this.board_num_regdate = board_num_regdate;
	}
	
	@Override
	public String toString() {
		return "{\"report_num\":\"" + report_num + "\", \"nickname\":\"" + nickname + "\", \"report_reason\":\""
				+ report_reason + "\", \"board_num\":\"" + board_num + "\", \"writer_nickname\":\"" + writer_nickname
				+ "\", \"board_num_title\":\"" + board_num_title + "\", \"board_num_regdate\":\"" + board_num_regdate
				+ "\"}";
	}
	
	

	
	
	
	
}
