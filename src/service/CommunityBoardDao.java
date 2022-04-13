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
	  
	  public int myComCount(String nickname) {
			
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
			return sqlSession.selectOne(NS+"myComCount",nickname);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			} 
			return 0;
	  }
	  
	  //검색 수
	  public int comSearchCount(String boardid,String part,String searchData) {
			
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%"+searchData+"%");
				map.put("boardid", boardid);
				
			return sqlSession.selectOne(NS+"comSearchCount",map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			} 
			return 0;
	  }
	  
	  
	  
	  
	  
	  
	  //최신순 나열
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
	  
	  
	  
	  //댓글순 나열
	  	public List<Community> comBoardReply(int pageInt, int limit, int boardcount, String boardid) {
		  
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("boardid", boardid);
				map.put("start", (pageInt-1)*limit+1);
				map.put("end", pageInt*limit);
					
			return sqlSession.selectList(NS+"comBoardReply",map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			} 
			return null;
	  }
	  
	  //조회수순 나열
		public List<Community> comBoardRead(int pageInt, int limit, int boardcount, String boardid) {
			  
			  SqlSession sqlSession = MybatisConnection.getConnection();
				try {
					map.clear();
					map.put("boardid", boardid);
					map.put("start", (pageInt-1)*limit+1);
					map.put("end", pageInt*limit);
						
				return sqlSession.selectList(NS+"comBoardRead",map);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					MybatisConnection.close(sqlSession);
				} 
				return null;
		  }
	  	
	  
	  
	  
	  
	  //검색리스트
	  public List<Community> comSearchList(int pageInt, int limit, int boardcount, String boardid, String part, String searchData) {
		  
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("boardid", boardid);
				map.put("start", (pageInt-1)*limit+1);
				map.put("end", pageInt*limit);
				map.put("part", part);
				map.put("searchData", "%"+searchData+"%");
					
			return sqlSession.selectList(NS+"comSearchList",map);
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
	 
	  
	  
	  
	  public Community comBoardOne(int board_num) {
		 
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				return sqlSession.selectOne(NS+"comBoardOne",board_num);
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
	  
	  
	  public int comBoardUpdate(Community com) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  
		  try {
		  return sqlSession.update(NS+"comBoardUpdate",com);
		  } catch (Exception e) {
			  e.printStackTrace();
		  } finally {
			  MybatisConnection.close(sqlSession);
		  }
		  
		  return 0;
		  
	  }
	  
	  public int comBoardDelete (int board_num) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		 try {
		  return sqlSession.update(NS+"comBoardDelete", board_num);
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(sqlSession);
		 }
		  return 0;
	  }
	  
	  /*조회수 증가*/
	  public void comReadCountUp(int board_num) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
			 try {
			  sqlSession.update(NS+"comReadCountUp",board_num);
			 } catch(Exception e) {
				 e.printStackTrace();
			 } finally {
				 MybatisConnection.close(sqlSession);
			 }
		  
	  }
	  
	  
	  public List<Community> comSearch(String part,String searchData, String boardid) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  
		  List<Community> searchList = null;
		  
		  try {
			  map.clear();
			  map.put("part", part);
			  map.put("searchData", "%"+searchData+"%");
			  map.put("boardid", boardid);
			  
			  searchList = sqlSession.selectList(NS+"comSearch",map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		  
		  return searchList;
		  
	  }
	  
	  
	  
	  
	  
	  
	  
	  /* 메인화면(board) 최신글 출력 관련 Dao */
	   public List<Community> comMainBoardList(String boardid) {
         
         SqlSession sqlSession = MybatisConnection.getConnection();
           try {                 
           return sqlSession.selectList(NS+"comMainBoardList",boardid);
           } catch (Exception e) {
               e.printStackTrace();
           } finally {
               MybatisConnection.close(sqlSession);
           } 
           return null;
     }
	   
	   
	   
	   

	   
	   
	   
	   
	   public List<Community> comBoardmyList1(int pageInt, int limit, int boardcount, String nickname) {
			  
			  SqlSession sqlSession = MybatisConnection.getConnection();
				try {
					map.clear();
					
					map.put("start", (pageInt-1)*limit+1);
					map.put("end", pageInt*limit);
					map.put("nickname", nickname);
	
				return sqlSession.selectList(NS+"comBoardmyList1",map);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					MybatisConnection.close(sqlSession);
				} 
				return null;
		  }
	   
}
