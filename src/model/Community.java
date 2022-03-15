package model;

import java.sql.Date;

public class Community {

	private int num;
	private String subject;
	private String content;
	private String tag;
	private int likes;
	private String boardid;
	private Date regdate;
	private String ip;
	private int readcnt;
	private int ref;
	private int reflevel;
	private int refstep;
	
	public Community() {
		
	}

	public Community(int num, String subject, String content,
			 String tag, int likes, String boardid, Date regdate, String ip, int readcnt, int ref,
			int reflevel, int refstep) {
		super();
		this.num = num;
		this.subject = subject;
		this.content = content;
		this.tag = tag;
		this.likes = likes;
		this.boardid = boardid;
		this.regdate = regdate;
		this.ip = ip;
		this.readcnt = readcnt;
		this.ref = ref;
		this.reflevel = reflevel;
		this.refstep = refstep;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReflevel() {
		return reflevel;
	}

	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}

	public int getRefstep() {
		return refstep;
	}

	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}

	@Override
	public String toString() {
		return "Community [num=" + num + ", subject=" + subject + ", content=" + content + ", tag=" + tag
				+ ", likes=" + likes + ", boardid=" + boardid + ", regdate=" + regdate + ", ip=" + ip + ", readcnt="
				+ readcnt + ", ref=" + ref + ", reflevel=" + reflevel + ", refstep=" + refstep + "]";
	}

	
	

	
	
	
	
	

	
	
}
