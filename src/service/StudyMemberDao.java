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

   

  public StudyMember studyMemberOne(String id) {
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
      
      System.out.println(m);
      
      return sqlSession.insert(NS + "insertStudyMember", m );
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return 0;
    
  }
  public int studyMemberIdExist(String id) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.selectOne(NS + "studyMemberIdExist", id);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 1;
  }
  
  public int studyMemberNicknameExist(String nickname) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.selectOne(NS + "studyMemberNicknameExist", nickname);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 1;
  }
  
  public int studyMemberIntroUpdate(String email, String intro) {
    
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      map.clear();
      map.put("email", email);
      map.put("intro", intro);
      return sqlSession.update(NS + "studyMemberIntroUpdate", map);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 0;
  }
  
  public int studyMemberDelete(String email) {
    
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
       
      return sqlSession.update(NS + "studyMemberDelete", email);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 0;
  }
  
}
