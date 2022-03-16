package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

   
  public int insertStudyMember(StudyMember m) {
    SqlSession sqlSession = MybatisConnection.getConnection();
     
    try {
      return sqlSession.insert(NS + "insertStudyMember", m);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return 0;
    
  }
  
}
