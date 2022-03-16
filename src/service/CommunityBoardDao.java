package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Community;
import util.MybatisConnection;

public class CommunityBoardDao {

	private static final String NS = "community.";
	  private Map<String, Object> map = new HashMap<>();
	
	  
	   
	  
	  public int comBoardCount(String boardid) {
		
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
			return sqlSession.selectOne(NS+"comBoardCount",boardid);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			} 
			return 0;
	  }
	  
	  
	  public List<Community> comBoardList(int pageInt, int limit, int boardcount, String boardid) {
		  
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("boardid", boardid);
				map.put("start", (pageInt-1)*limit+1);
				map.put("end", pageInt*limit);
					
			return sqlSession.selectList(NS+"comBoardList",map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			} 
			return null;
	  }
	  
	  
	  public int comInsertBoard(Community com) {
		  
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
			return sqlSession.update(NS+"comInsertBoard", com);	
			} catch(Exception e ) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
			}
	 
	  
	  
	  
	  public Community comBoardOne(int num) {
		 
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				return sqlSession.selectOne(NS+"comBoardOne",num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			
			return null;
		  
	  }
	  
	  
	  public int comNextNum() {
		  
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  try {
			  return sqlSession.selectOne(NS+"comNextNum");
		  } catch(Exception e) {
			  e.printStackTrace();
		  } finally {
			  MybatisConnection.close(sqlSession);
		  }
		  
		  return 0;
	  }
}
