package model;

public class StudyMember {
  private String email; 
  private String password; 
  private String nickname; 
  private String name; 
  private String tel; 
  private String picture;
  
  
  
  
  public StudyMember() {  }
  public StudyMember(String email, String password, String nickname, String name, String tel,
      String picture) {
    this.email = email;
    this.password = password;
    this.nickname = nickname;
    this.name = name;
    this.tel = tel;
    this.picture = picture;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getPicture() {
    return picture;
  }
  public void setPicture(String picture) {
    this.picture = picture;
  }
  
  @Override
  public String toString() {
    return "StudyMember [email=" + email + ", password=" + password + ", nickname=" + nickname
        + ", name=" + name + ", tel=" + tel + ", picture=" + picture + "]";
  } 
  
  
}