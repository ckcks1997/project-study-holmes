package model.group;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GroupInList {

  private int boardnum;
  private int represent;
  private Date regdate;
  private String title;
  
  
  public GroupInList() {  }


  public GroupInList(int boardnum, int represent, Date regdate, String title) {
    this.boardnum = boardnum;
    this.represent = represent;
    this.regdate = regdate;
    this.title = title;
  }


  public int getBoardnum() {
    return boardnum;
  }


  public void setBoardnum(int boardnum) {
    this.boardnum = boardnum;
  }


  public int getRepresent() {
    return represent;
  }


  public void setRepresent(int represent) {
    this.represent = represent;
  }


  public Date getRegdate() {
    return regdate;
  }


  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }


  public String getTitle() {
    return title;
  }


  public void setTitle(String title) {
    this.title = title;
  }


  @Override
  public String toString() {
    return "{\"boardnum\":\"" + boardnum + "\", \"represent\":\"" + represent + "\", \"regdate\":\""
        + regdate + "\", \"title\":\"" + title + "\"}";
  }
  
  

}
