package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import model.WebChat;
import util.MybatisConnection;

public class ChatMybatisDao {

  private static final String NS = "webchat.";
  private Map<String, Object> map = new HashMap<>();

  public int nextNum() {
    SqlSession sqlSession = MybatisConnection.getConnection();
    
    try { 
      return sqlSession.selectOne(NS + "nextNum", map);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 0;

  }
  
  public int insertWebChat(WebChat webchat) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    
    try {
 
      return sqlSession.insert(NS + "insertWebChat", webchat);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return 0;

  }

  
  public List<WebChat> listWebChat(String groupId) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    
    try {
      return sqlSession.selectList(NS + "listWebChat", groupId);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }

    return null;

  }

  
}
