package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.swing.GroupLayout.Group;
import org.apache.ibatis.session.SqlSession;
import model.Attend;
import model.Community;
import model.GroupMember;
import model.StudyMenu;
import model.group.GroupInList;
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
 
	    public int groupInsert(GroupMember sm, int represent) {
          
	         SqlSession sqlSession = MybatisConnection.getConnection();
	           try {
	             map.clear();
	             map.put("board_num", sm.getBoardnum());
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
	    
	       public List<GroupInList> groupInList(String nickname) {
	          
             SqlSession sqlSession = MybatisConnection.getConnection();
               try {
               return sqlSession.selectList(NS+"groupInList", nickname);
               } catch (Exception e) {
                   e.printStackTrace();
               } finally {
                   MybatisConnection.close(sqlSession);
               } 
               return null;
         }
	       
	       public List<GroupMember> groupListByBoardnum(String id) {
	            
	         SqlSession sqlSession = MybatisConnection.getConnection();
	           try {
	           return sqlSession.selectList(NS+"groupListByBoardnum", id);
	           } catch (Exception e) {
	               e.printStackTrace();
	           } finally {
	               MybatisConnection.close(sqlSession);
	           } 
	           return null;
	     }
	       
	        public int groupDelete(int boardnum, String nickname) {
	          
	             SqlSession sqlSession = MybatisConnection.getConnection();
	               try {
	                 map.clear();
	                 map.put("boardnum", boardnum);
	                 map.put("nickname", nickname); 
	               return sqlSession.delete(NS+"groupDelete", map);
	               } catch (Exception e) {
	                   e.printStackTrace();
	               } finally {
	                   MybatisConnection.close(sqlSession);
	               } 
	               return 0;
	         }
	   
	 	   public int isMemberInGroup(String boardid, String memid) {
		        
	 	         SqlSession sqlSession = MybatisConnection.getConnection();
	 	           try {
	 	        	   map.clear();
	 	        	   map.put("boardnum", boardid);
	 	        	   map.put("nickname", memid);
	 	           return sqlSession.selectOne(NS+"isMemberInGroup", map);
	 	           } catch (Exception e) {
	 	               e.printStackTrace();
	 	           } finally {
	 	               MybatisConnection.close(sqlSession);
	 	           } 
	 	           return 0;
	 	     }
}
