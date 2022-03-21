package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import model.Attend;
import model.Community; 
import model.StudyMenu;
import util.MybatisConnection;

public class GroupMemberDao {

	private static final String NS = "groupmember.";
	  private Map<String, Object> map = new HashMap<>();
	 
	  
	   public int groupCount(String id) {
	        
         SqlSession sqlSession = MybatisConnection.getConnection();
           try {
           return sqlSession.selectOne(NS+"groupCount", id);
           } catch (Exception e) {
               e.printStackTrace();
           } finally {
               MybatisConnection.close(sqlSession);
           } 
           return 0;
     }
 
	    public int groupInsert(StudyMenu sm, int represent) {
          
	         SqlSession sqlSession = MybatisConnection.getConnection();
	           try {
	             map.clear();
	             map.put("board_num", sm.getBoard_num());
                 map.put("nickname", sm.getNickname());
	             map.put("represent", represent); 
	           return sqlSession.insert(NS+"groupInsert", map);
	           } catch (Exception e) {
	               e.printStackTrace();
	           } finally {
	               MybatisConnection.close(sqlSession);
	           } 
	           return 0;
	     }
	   
}
