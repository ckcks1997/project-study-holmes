package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import model.Notice;
import util.MybatisConnection;

public class NoticeDao {

  private static final String NS = "notice.";
  private Map<String, Object> map = new HashMap<>();

  public int noticeNew(String id) {

    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.selectOne(NS + "noticeNew", id);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return 0;
  }

  public List<Notice> noticeGet(String id) {

    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.selectList(NS + "noticeGet", id);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return null;
  }

  public int noticeRead(String id) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.update(NS + "noticeRead", id);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return 0;
  }

  public int noticeWrite(int boardid, String from, String to) {
    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      map.clear();
      map.put("boardid", boardid);
      map.put("from", from);
      map.put("to", to);
      
      return sqlSession.insert(NS + "noticeWrite", map);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return 0;
  }
  
  
  
  
  
  public int noticeReportWrite(String info, String from, String to, int board_num) {
	    SqlSession sqlSession = MybatisConnection.getConnection();
	    try {
	      map.clear();
	      map.put("info", info);
	      map.put("from", from);
	      map.put("to", to);
	      map.put("board_num", board_num);
	      
	      return sqlSession.insert(NS + "noticeReportWrite", map);
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      MybatisConnection.close(sqlSession);
	    }
	    return 0;
	  }
  
  
  
  
  
  
  
  public Notice noticeGetByNoticeNum(int noticeNum) {

    SqlSession sqlSession = MybatisConnection.getConnection();
    try {
      return sqlSession.selectOne(NS + "noticeGetByNoticeNum", noticeNum);
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      MybatisConnection.close(sqlSession);
    }
    return null;
  }

}
