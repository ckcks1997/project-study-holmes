package model;

import java.util.Date;

public class GroupMember {

  private int group_member;
  private int boardnum;
  private String nickname;
  private Date regdate;
  
  public GroupMember() {
  }
  
  public GroupMember(int group_member, int boardnum, String nickname, Date regdate) {
    this.group_member = group_member;
    this.boardnum = boardnum;
    this.nickname = nickname;
    this.regdate = regdate;
  }

  public int getGroup_member() {
    return group_member;
  }

  public void setGroup_member(int group_member) {
    this.group_member = group_member;
  }

  public int getBoardnum() {
    return boardnum;
  }

  public void setBoardnum(int boardnum) {
    this.boardnum = boardnum;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  @Override
  public String toString() {
    return "{\"group_member\":\"" + group_member + "\", \"boardnum\":\"" + boardnum
        + "\", \"nickname\":\"" + nickname + "\", \"regdate\":\"" + regdate + "\"}";
  }
  
  
  
  
}
