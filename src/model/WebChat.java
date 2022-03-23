package model;

public class WebChat {

  private int num;
  private String groupId;
  private String userId;
  private String message;

  public WebChat() {}

  public WebChat(String[] strs) {
    this.groupId = strs[0];
    this.userId = strs[1];
    this.message = strs[2];
  }

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public String getGroupId() {
    return groupId;
  }

  public void setGroupId(String groupId) {
    this.groupId = groupId;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  @Override
  public String toString() {
    return "{\"num\":\"" + num + "\", \"groupId\":\"" + groupId + "\", \"userId\":\"" + userId
        + "\", \"message\":\"" + message + "\"}";
  }



}
