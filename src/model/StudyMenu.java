package model;

import java.sql.Date;

public class StudyMenu {
	
	private int board_num;	
	private String nickname;
	private String title;
	private String subject;
	private String price;
	private int pernum;
	private String region;
	private String content;
	private String menuid;
	private Date regdate;
	private String latitude; //위도 
	private String longitude; //경도\
	private int count;
	public StudyMenu() {
		
	}

 

	public StudyMenu(int board_num, String nickname, String title, String subject, String price, int pernum,
			String region, String content, String menuid, Date regdate, String latitude, String longitude, int count) {
 
		this.board_num = board_num;
		this.nickname = nickname;
		this.title = title;
		this.subject = subject;
		this.price = price;
		this.pernum = pernum;
		this.region = region;
		this.content = content;
		this.menuid = menuid;
		this.regdate = regdate;
		this.latitude = latitude;
		this.longitude = longitude;
		this.count = count;
	}



	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
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

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "{\"board_num\":\"" + board_num + "\", \"nickname\":\"" + nickname + "\", \"title\":\"" + title
				+ "\", \"subject\":\"" + subject + "\", \"price\":\"" + price + "\", \"pernum\":\"" + pernum
				+ "\", \"region\":\"" + region + "\", \"content\":\"" + content + "\", \"menuid\":\"" + menuid
				+ "\", \"regdate\":\"" + regdate + "\", \"latitude\":\"" + latitude + "\", \"longitude\":\"" + longitude
				+ "\", \"count\":\"" + count + "\"}";
	}

	
}
