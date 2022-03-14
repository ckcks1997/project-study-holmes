package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.catalina.connector.Request;
import org.apache.ibatis.session.SqlSession; 
import model.StudyMember;
import util.MybatisConnection;

public class StudyMemberDao {

  private static final String NS = "studymember.";
  private Map<String, Object> map = new HashMap<>();

   

  public StudyMember  studyMemberOne(String id) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.selectOne(NS + "studyMemberOne", id);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return null;
  }

   
  public int insertStudyMember(HttpServletRequest req) {
    SqlSession sqlSession = MybatisConnection.getConnection();
     
    try {
      StudyMember m = new StudyMember();
      m.setEmail(req.getParameter("email"));
      m.setName(req.getParameter("name"));
      m.setNickname(req.getParameter("nickname"));
      m.setPassword(req.getParameter("password"));
      m.setTel(req.getParameter("tel"));
      m.setPicture(req.getParameter("picture"));
      
      
      return sqlSession.insert(NS + "insertStudyMember", m );
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return 0;
    
  }
  
  
}
