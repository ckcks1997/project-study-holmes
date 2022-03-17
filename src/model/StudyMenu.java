package model;

import java.sql.Date;

public class StudyMenu {
	
	int num;	
	private String subject;
	private int langue;
	private int free;
	private int pernum;
	private String region;
	private String content;
	private String menuid;
	private Date regdate;
	private int readcnt;
	private int ref;
	private int reflevel;
	private int refstep;
	
	
	  
	public StudyMenu() {

	}



	public StudyMenu(int num, String subject, int langue, int free, int pernum, String region, String content,
			String menuid, Date regdate, int readcnt, int ref, int reflevel, int refstep) {
		super();
		this.num = num;
		this.subject = subject;
		this.langue = langue;
		this.free = free;
		this.pernum = pernum;
		this.region = region;
		this.content = content;
		this.menuid = menuid;
		this.regdate = regdate;
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



	public int getLangue() {
		return langue;
	}



	public void setLangue(int langue) {
		this.langue = langue;
	}



	public int getFree() {
		return free;
	}



	public void setFree(int free) {
		this.free = free;
	}



	public int getPernum() {
		return pernum;
	}



	public void setPernum(int pernum) {
		this.pernum = pernum;
	}



	public String getRegion() {
		return region;
	}



	public void setRegion(String region) {
		this.region = region;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getMenuid() {
		return menuid;
	}



	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
		return "{\"num\":\"" + num + "\", \"subject\":\"" + subject + "\", \"langue\":\"" + langue + "\", \"free\":\""
				+ free + "\", \"pernum\":\"" + pernum + "\", \"region\":\"" + region + "\", \"content\":\"" + content
				+ "\", \"menuid\":\"" + menuid + "\", \"regdate\":\"" + regdate + "\", \"readcnt\":\"" + readcnt
				+ "\", \"ref\":\"" + ref + "\", \"reflevel\":\"" + reflevel + "\", \"refstep\":\"" + refstep + "\"}";
	}



	
	
}
