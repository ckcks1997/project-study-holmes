package model;

import java.util.Date;

public class StudyCheck {

	private String id;
	private Date day;
	
	public StudyCheck () {}

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"day\":\"" + day + "\"}";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public StudyCheck(String id, Date day) {
		
		this.id = id;
		this.day = day;
	}
	
	
}
