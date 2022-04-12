package model;

public class Report {

	private int report_num;
	private String nickname;
	private int report_reason;
	private int board_num;
	
	public Report() {
		super();
	}

	public Report(int report_num, String nickname, int report_reason, int board_num) {
		super();
		this.report_num = report_num;
		this.nickname = nickname;
		this.report_reason = report_reason;
		this.board_num = board_num;
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

	public int getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(int report_reason) {
		this.report_reason = report_reason;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	@Override
	public String toString() {
		return "{\"report_num\":\"" + report_num + "\", \"nickname\":\"" + nickname + "\", \"report_reason\":\""
				+ report_reason + "\", \"board_num\":\"" + board_num + "\"}";
	}
	
	
	
	
	
}
