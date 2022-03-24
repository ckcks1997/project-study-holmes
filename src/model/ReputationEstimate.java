package model;

import java.util.Date;

public class ReputationEstimate {

  private int num;
  private int group_num;
  private String nickname_to;
  private String nickname_from;
  private int score;
  private String info;
  private Date regdate;
  
  public ReputationEstimate() { }
  
   

  public ReputationEstimate(int num, int group_num, String nickname_to, String nickname_from,
      int score, String info, Date regdate) {
    super();
    this.num = num;
    this.group_num = group_num;
    this.nickname_to = nickname_to;
    this.nickname_from = nickname_from;
    this.score = score;
    this.info = info;
    this.regdate = regdate;
  }



  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public int getGroup_num() {
    return group_num;
  }

  public void setGroup_num(int group_num) {
    this.group_num = group_num;
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

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  
  public String getInfo() {
    return info;
  }

  public void setInfo(String info) {
    this.info = info;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }
 
  @Override
  public String toString() {
    return "{\"num\":\"" + num + "\", \"group_num\":\"" + group_num + "\", \"nickname_to\":\""
        + nickname_to + "\", \"nickname_from\":\"" + nickname_from + "\", \"score\":\"" + score
        + "\", \"info\":\"" + info + "\", \"regdate\":\"" + regdate + "\"}";
  }
 
}
