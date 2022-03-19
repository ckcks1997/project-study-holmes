package model;

import java.util.Date;

public class StudyMember {
  private String email; 
  private String password; 
  private String nickname; 
  private String name; 
  private String tel; 
  private String picture;
  private Date regdate;
  private int point;
  private String profile_intro;//자기소개
  
  public StudyMember() {  }
   
  public StudyMember(String email, String password, String nickname, String name, String tel,
      String picture, Date regdate, int point, String profile_intro) {
    super();
    this.email = email;
    this.password = password;
    this.nickname = nickname;
    this.name = name;
    this.tel = tel;
    this.picture = picture;
    this.regdate = regdate;
    this.point = point;
    this.profile_intro = profile_intro;
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

  public Date getregdate() {
    return regdate;
  }

  public void setregdate(Date regdate) {
    this.regdate = regdate;
  }

  public int getPoint() {
    return point;
  }

  public void setPoint(int point) {
    this.point = point;
  }

  public String getProfile_intro() {
    return profile_intro;
  }

  public void setProfile_intro(String profile_intro) {
    this.profile_intro = profile_intro;
  }

  @Override
  public String toString() {
    return "StudyMember [email=" + email + ", password=" + password + ", nickname=" + nickname
        + ", name=" + name + ", tel=" + tel + ", picture=" + picture + ", regdate=" + regdate
        + ", point=" + point + ", profile_intro=" + profile_intro + "]";
  }
  
  
}
