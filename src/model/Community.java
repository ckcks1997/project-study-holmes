package model;

import java.sql.Date;

public class Community {
 
	private int board_num;
	private String title;
	private String content;
	private String boardid;
	private Date regdate;
	private String ip;
	private int readcnt;
	private String nickname;
	private int replycnt;
	private String picture;
	
	
	
	public Community() {
		
	}

	


	public Community(int board_num, String title, String content, String boardid, Date regdate, String ip, int readcnt,
			String nickname, int replycnt, String picture) {
		super();
		this.board_num = board_num;
		this.title = title;
		this.content = content;
		this.boardid = boardid;
		this.regdate = regdate;
		this.ip = ip;
		this.readcnt = readcnt;
		this.nickname = nickname;
		this.replycnt = replycnt;
		this.picture = picture;
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


	


	public int getReplycnt() {
		return replycnt;
	}




	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}



	

	public String getPicture() {
		return picture;
	}




	public void setPicture(String picture) {
		this.picture = picture;
	}




	@Override
	public String toString() {
		return "{\"board_num\":\"" + board_num + "\", \"title\":\"" + title + "\", \"content\":\"" + content
				+ "\", \"boardid\":\"" + boardid + "\", \"regdate\":\"" + regdate + "\", \"ip\":\"" + ip
				+ "\", \"readcnt\":\"" + readcnt + "\", \"nickname\":\"" + nickname + "\", \"replycnt\":\"" + replycnt
				+ "\", \"picture\":\"" + picture + "\"}";
	}




	










	
	

	
	
	
	
	

	
	
}
