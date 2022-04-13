package model;

import java.util.Date;

public class GroupBoard {


	  private int board_num;
	  private int s_board_num;
	  private String title;
	  private String content;
	  private int replycnt;
	  private String boardid;
	  private Date regdate;
	  private String file1;
	  private int readcnt;
	  private String nickname;
	  
	  
	  
	public GroupBoard() {
	}



	public GroupBoard(int board_num, int s_board_num, String title, String content, int replycnt, String boardid,
			Date regdate, String file1, int readcnt, String nickname) {
		this.board_num = board_num;
		this.s_board_num = s_board_num;
		this.title = title;
		this.content = content;
		this.replycnt = replycnt;
		this.boardid = boardid;
		this.regdate = regdate;
		this.file1 = file1;
		this.readcnt = readcnt;
		this.nickname = nickname;
	}



	public int getboard_num() {
		return board_num;
	}



	public void setboard_num(int board_num) {
		this.board_num = board_num;
	}



	public int getS_board_num() {
		return s_board_num;
	}



	public void setS_board_num(int s_board_num) {
		this.s_board_num = s_board_num;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getReplycnt() {
		return replycnt;
	}



	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}



	public String getBoardid() {
		return boardid;
	}



	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public String getFile1() {
		return file1;
	}



	public void setFile1(String file1) {
		this.file1 = file1;
	}



	public int getReadcnt() {
		return readcnt;
	}



	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	@Override
	public String toString() {
		return "{\"board_num\":\"" + board_num + "\", \"s_board_num\":\"" + s_board_num + "\", \"title\":\""
				+ title + "\", \"content\":\"" + content + "\", \"replycnt\":\"" + replycnt + "\", \"boardid\":\""
				+ boardid + "\", \"regdate\":\"" + regdate + "\", \"file1\":\"" + file1 + "\", \"readcnt\":\"" + readcnt
				+ "\", \"nickname\":\"" + nickname + "\"}";
	}
	  
	
	
	  
}
