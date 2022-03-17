package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import model.MemberTag;
import util.MybatisConnection;

public class MemberTagDao {

  private static final String NS = "membertag.";
  private Map map = new HashMap();

   

  public List<MemberTag> getMemberTag(String id) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
 
      return sqlSession.selectList(NS + "getMemberTag", id);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return null;
  }

  public int addMemberTag(String id, String tag) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      map.clear();
      map.put("id", id);
      map.put("tag", tag);
      return sqlSession.insert(NS + "addMemberTag", map);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 0;
  }
}
