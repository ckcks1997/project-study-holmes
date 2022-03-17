package model;

public class MemberTag {
  
  private String email; 
  private String tag;
  
  public MemberTag() {
  }

  public MemberTag(String email, String tag) {
    this.email = email;
    this.tag = tag;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getTag() {
    return tag;
  }

  public void setTag(String tag) {
    this.tag = tag;
  }

  @Override
  public String toString() {
    return "{\"email\":\"" + email + "\", \"tag\":\"" + tag + "\"}";
  } 
  
  
}
