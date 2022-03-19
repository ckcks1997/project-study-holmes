package model;

import java.sql.Date;

public class Community {
 
	private int board_num;
	private String title;
	private String content;
	private int likes;
	private String boardid;
	private Date regdate;
	private String ip;
	private int readcnt;
	private String nickname;
	
	public Community() {
		
	}

	
	
	
	public Community(int board_num, String title, String content, int likes, String boardid, Date regdate, String ip,
			int readcnt, String nickname) {
		super();
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.likes = likes;
		this.boardid = boardid;
		this.regdate = regdate;
		this.ip = ip;
		this.readcnt = readcnt;
		this.nickname = nickname;
	}


	
	


	public int getBoard_num() {
		return board_num;
	}




	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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




	public int getLikes() {
		return likes;
	}




	public void setLikes(int likes) {
		this.likes = likes;
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




	public String getIp() {
		return ip;
	}




	public void setIp(String ip) {
		this.ip = ip;
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
		return "Community [board_num=" + board_num + ", title=" + title + ", content=" + content + ", likes=" + likes
				+", boardid=" + boardid + ", regdate=" + regdate + ", ip=" + ip + ", readcnt="
				+ readcnt + ",nickname=" + nickname + "]";
	}

	
	

	
	
	
	
	

	
	
}
