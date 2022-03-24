package model;

public class WebChat {

  private int num;
  private String boardnum;
  private String memberNickname;
  private String message;
  private String file;
  public WebChat() {}

  public WebChat(String[] strs) {
    this.boardnum = strs[0];
    this.memberNickname = strs[1];
    this.message = strs[2];
    this.file = strs[3];
  }

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public String getBoardnum() {
    return boardnum;
  }

  public void setBoardnum(String boardnum) {
    this.boardnum = boardnum;
  }

  public String getMemberNickname() {
    return memberNickname;
  }

  public void setMemberNickname(String memberNickname) {
    this.memberNickname = memberNickname;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  
  public String getFile() {
    return file;
  }

  public void setFile(String file) {
    this.file = file;
  }

  @Override
  public String toString() {
    return "{\"num\":\"" + num + "\", \"boardnum\":\"" + boardnum + "\", \"memberNickname\":\""
        + memberNickname + "\", \"message\":\"" + message + "\", \"file\":\"" + file + "\"}";
  }

}
