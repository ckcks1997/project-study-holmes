package model;


import java.io.Serializable;

public class StudyMenu implements Serializable {
	

	private String subject;
	private int free;
	private int pernum;
	private String region;
	private String menuid;
	
	
	  
	public StudyMenu() {

	}



	public StudyMenu(String subject, int free, int pernum, String region, String menuid) {
		super();
		this.subject = subject;
		this.free = free;
		this.pernum = pernum;
		this.region = region;
		this.menuid = menuid;
	}



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
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



	public String getMenuid() {
		return menuid;
	}



	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}



	@Override
	public String toString() {
		return "StudyMenu [subject=" + subject + ", free=" + free + ", pernum=" + pernum + ", region=" + region
				+ ", menuid=" + menuid + "]";
	}








	
	
}
