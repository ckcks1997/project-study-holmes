package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Attend;
import util.MybatisConnection;

public class AttendDao {

	private static final String NS = "attend.";
	  private Map<String, Object> map = new HashMap<>();
	 
	  
	   public List<Attend> attendGet(String id) {
	        
         SqlSession sqlSession = MybatisConnection.getConnection();
           try {
           return sqlSession.selectList(NS+"attendGet", id);
           } catch (Exception e) {
               e.printStackTrace();
           } finally {
               MybatisConnection.close(sqlSession);
           } 
           return null;
     }
	  
	  public int attendInsert(Attend at) {
		
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
			return sqlSession.insert(NS+"attendInsert",at);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			} 
			return 0;
	  }
	  
	   
	  

}
