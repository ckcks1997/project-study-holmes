package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Search;
import model.StudyMenu;
import util.MybatisConnection;

public class StudyMenuDao {
	private static final String NS = "studymenu.";
	private Map<String, Object> map = new HashMap<>();

	
	public int menuCount(String menuid) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "menuCount", menuid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	
	
	public int menuAllCount() {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "menuAllCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}

	
	
	public List<StudyMenu> menuList(int pageInt, int limit, int menucount, String menuid) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("menuid", menuid);
			map.put("start", (pageInt - 1) * limit + 1);
			map.put("end", pageInt * limit);
			return sqlSession.selectList(NS + "menuList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return null;
	}
	

	
	public int menuNextNum() {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "menuNextNum");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}

	
	
	public int insertMenu(StudyMenu studymenu) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.update(NS + "insertMenu", studymenu);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	
	
	public List<StudyMenu> studySearch(Search sh) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		List<StudyMenu> list = null;
		try {
		list = sqlSession.selectList(NS + "studySearch", sh);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return list;
	}
	
	
	
	 public StudyMenu menuBoardOne(int board_num) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				return sqlSession.selectOne(NS+"menuBoardOne",board_num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	  }
 

	 public List<StudyMenu> list2(String list2) {

			SqlSession sqlSession = MybatisConnection.getConnection();
			
			List<StudyMenu> list = null;
			try {
				
			list = sqlSession.selectList(NS + "list2", list2);
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			
			return list;

		}
	  
	 
		/*
		 * public List<StudyMenu> allList() {
		 * 
		 * SqlSession sqlSession = MybatisConnection.getConnection();
		 * 
		 * try { return sqlSession.selectList(NS + "allList"); } catch (Exception e) {
		 * e.printStackTrace(); } finally { MybatisConnection.close(sqlSession); }
		 * 
		 * return null; }
		 */
 
	 
	 
	 
	 public List<StudyMenu> studySearchList(int pageInt, int limit, int menucount, String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				map.put("part", part);
				map.put("searchData", "%" + searchData + "%");
				return sqlSession.selectList(NS + "studySearchList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
		}
	 
	 
	 
	 public int studySearchCount(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" + searchData + "%");
				map.put("menuid", menuid);
				return sqlSession.selectOne(NS + "studySearchCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
		}
	 
	 
	 
	 public List<StudyMenu> studySearch(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			List<StudyMenu> list = null;
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" + searchData + "%");
				map.put("menuid", menuid);
				list = sqlSession.selectList(NS + "studySearch", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return list;
		}
	 
	 
	 
	 public List<StudyMenu> allList(int pageInt, int limit, int menuAllCount, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				return sqlSession.selectList(NS + "allList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	 }	 
	 
	 
		/* 전체검색 */	 
	 public List<StudyMenu> allstudySearch(Search sh) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			List<StudyMenu> list = null;
			try {
			list = sqlSession.selectList(NS + "allstudySearch", sh);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return list;
		}
	 
	 public int allstudySearchCount(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" + searchData + "%");
				map.put("menuid", menuid);
				return sqlSession.selectOne(NS + "allstudySearchCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
		}
	 
	 public List<StudyMenu> studySearchAllList(int pageInt, int limit, int menuAllCount, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				return sqlSession.selectList(NS + "studySearchAllList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	 }	 
	 
	 public List<StudyMenu> mylist2(String mylist2) {

			SqlSession sqlSession = MybatisConnection.getConnection();
			
			List<StudyMenu> list = null;
			try {
				
			list = sqlSession.selectList(NS + "mylist2", mylist2);
			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			
			return list;

		}
}

		 	