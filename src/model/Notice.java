package model;

import java.util.Date;

public class Notice {

  private int notice_num;
  private String nickname_to;
  private String nickname_from;
  private String info;
  private String info2;
  private int isread;
  private Date regdate;
   
  public Notice() {  }

   
  public Notice(int notice_num, String nickname_to, String nickname_from, String info, String info2,
      int isread, Date regdate) {
    super();
    this.notice_num = notice_num;
    this.nickname_to = nickname_to;
    this.nickname_from = nickname_from;
    this.info = info;
    this.info2 = info2;
    this.isread = isread;
    this.regdate = regdate;
  }


  public int getNotice_num() {
    return notice_num;
  }

  public void setNotice_num(int notice_num) {
    this.notice_num = notice_num;
  }

  public String getNickname_to() {
    return nickname_to;
  }

  public void setNickname_to(String nickname_to) {
    this.nickname_to = nickname_to;
  }

  public String getNickname_from() {
    return nickname_from;
  }

  public void setNickname_from(String nickname_from) {
    this.nickname_from = nickname_from;
  }

  public String getInfo() {
    return info;
  }

  public void setInfo(String info) {
    this.info = info;
  }

  public int getIsread() {
    return isread;
  }

  public void setIsread(int isread) {
    this.isread = isread;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }


  public String getInfo2() {
    return info2;
  }


  public void setInfo2(String info2) {
    this.info2 = info2;
  }
  
 
  
 
  
}
