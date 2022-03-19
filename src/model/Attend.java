package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Attend {

  private String id;
  
  private Date day; 
  
  public Attend() { 
  }
   
  public Attend(String id, Date day) { 
    this.id = id;
    this.day = day;
  } 
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public Date getDate() {
    return day;
  }
  public void setDate(Date day) {
    this.day = day;
  } 
  
  @Override
  public String toString() {
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String strNowDate = df.format(day);

    return "{\"id\":\"" + id + "\", \"day\":\"" + strNowDate + "\"}";
  } 
}
