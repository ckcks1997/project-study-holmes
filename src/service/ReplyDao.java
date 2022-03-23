package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Reply;
import util.MybatisConnection;

public class ReplyDao {
	
	private static final String NS = "reply.";
	  //private Map<String, Object> map = new HashMap<>();
	
	  
	  /*댓글등록*/
	  public int insertReply(Reply reply) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
			return sqlSession.update(NS+"insertReply", reply);	
			} catch(Exception e ) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
			}
	  
	  
	  public int replyNextNum() {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  try {
			  return sqlSession.selectOne(NS+"replyNextNum");
		  } catch(Exception e) {
			  e.printStackTrace();
		  } finally {
			  MybatisConnection.close(sqlSession);
		  }
		  return 0;
	  }
	  
	  
	  
	  public List<Reply> replyWriteList(int board_num) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  try {
			  return sqlSession.selectList(NS+"replyWriteList", board_num);
		  } catch(Exception e) {
			  e.printStackTrace();
		  } finally {
			  MybatisConnection.close(sqlSession);
		  }
		  return null;		  
		  
	  }
	  
	  
	  public int replyCount(int board_num) {
		  
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  try {
			  return sqlSession.selectOne(NS+"replyCount", board_num);
		  } catch(Exception e) {
			  e.printStackTrace();
		  } finally {
			  MybatisConnection.close(sqlSession);
		  }
		  return 0;		  
		  
	  }
		  
}
	 

