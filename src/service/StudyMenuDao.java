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
	
	public int myStudyCount(String nickname) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "myStudyCount", nickname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	
	public int onAllCount() {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "onAllCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	public int offAllCount() {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "offAllCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	public int onoffAllCount() {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectOne(NS + "onoffAllCount");
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
	
	/*추가됨*/
	public List<StudyMenu> menuList2(int pageInt, int limit, int menucount, String menuid) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("menuid", menuid);
			map.put("start", (pageInt - 1) * limit + 1);
			map.put("end", pageInt * limit);
			return sqlSession.selectList(NS + "menuList2", map);
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
	  
	 
		/*-----------------------------------------------------------------------------------------------------------------		*/ 
	 public List<StudyMenu> studySearch(String part, String searchData, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			List<StudyMenu> searchlist = null;
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				searchlist = sqlSession.selectList(NS + "studySearch", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return searchlist;
		}
	 
	 
	 public int studySearchCount(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				return sqlSession.selectOne(NS + "studySearchCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
		}
	 
	 public List<StudyMenu> studySearchList(int pageInt, int limit, int menucount, String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				return sqlSession.selectList(NS + "studySearchList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
		}
	 
	 /*-----------------------------------------------------------------------------------------------------------------		*/ 
	 public List<StudyMenu> onAllSearch(String part, String searchData, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			List<StudyMenu> searchlist = null;
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				searchlist = sqlSession.selectList(NS + "onAllSearch", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return searchlist;
		}
	 
	 
	 public int onAllSearchCount(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				return sqlSession.selectOne(NS + "onAllSearchCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
		}
	 
	 public List<StudyMenu> onAllSearchList(int pageInt, int limit, int menucount, String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				return sqlSession.selectList(NS + "onAllSearchList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
		}
	 	 	 
	 /*-----------------------------------------------------------------------------------------------------------------		*/ 
	 
	 public List<StudyMenu> offAllSearch(String part, String searchData, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			List<StudyMenu> searchlist = null;
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				searchlist = sqlSession.selectList(NS + "offAllSearch", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return searchlist;
		}
	 
	 public int offAllSearchCount(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				return sqlSession.selectOne(NS + "offAllSearchCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
		}
	 
	 public List<StudyMenu> offAllSearchList(int pageInt, int limit, int menucount, String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				return sqlSession.selectList(NS + "offAllSearchList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
		}
	 	 	 
	 /*-----------------------------------------------------------------------------------------------------------------		*/ 
	 
	 public List<StudyMenu> onoffAllSearch(String part, String searchData, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			List<StudyMenu> searchlist = null;
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				searchlist = sqlSession.selectList(NS + "onoffAllSearch", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return searchlist;
		}
	 
	 
	 public int onoffAllSearchCount(String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				map.put("menuid", menuid);
				return sqlSession.selectOne(NS + "onoffAllSearchCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return 0;
		}
	 
	 public List<StudyMenu> onoffAllSearchList(int pageInt, int limit, int menucount, String menuid, String part, String searchData) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				map.put("part", part);
				map.put("searchData", "%" +searchData+ "%");
				return sqlSession.selectList(NS + "onoffAllSearchList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
		}
	 	 	 
	 /*-----------------------------------------------------------------------------------------------------------------		*/ 
	 
	 public List<StudyMenu> onallList(int pageInt, int limit, int menuAllCount, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				return sqlSession.selectList(NS + "onallList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	 }	 
	 

	 
	 public List<StudyMenu> offallList(int pageInt, int limit, int menuAllCount, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				return sqlSession.selectList(NS + "offallList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	 }	 
 
	 /*추가*/
	 public List<StudyMenu> offallList2(int pageInt, int limit, int menuAllCount, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				return sqlSession.selectList(NS + "offallList2", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	 }	
	 
	 public List<StudyMenu> onoffallList(int pageInt, int limit, int menuAllCount, String menuid) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				map.put("menuid", menuid);
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				return sqlSession.selectList(NS + "onoffallList", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
	 }	 
	 
	
	 public List<StudyMenu> mylist2(int pageInt, int limit, int menucount, String nickname) {
			SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				map.clear();
				
				map.put("start", (pageInt - 1) * limit + 1);
				map.put("end", pageInt * limit);
				map.put("nickname",nickname);
				return sqlSession.selectList(NS + "mylist2", map);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			return null;
		}
	 
	 
	 

	 

	 public int studyUpdate(StudyMenu sm) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		  
		  try {
		  return sqlSession.update(NS+"studyUpdate",sm);
		  } catch (Exception e) {
			  e.printStackTrace();
		  } finally {
			  MybatisConnection.close(sqlSession);
		  }
		  
		  return 0;
		  
	  }
	 
	 public StudyMenu studyMenuOne(int board_num) {
		 
		  SqlSession sqlSession = MybatisConnection.getConnection();
			try {
				return sqlSession.selectOne(NS+"studyMenuOne",board_num);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MybatisConnection.close(sqlSession);
			}
			
			return null;
		  
	  }
	 
	 public int studyDelete (int board_num) {
		  SqlSession sqlSession = MybatisConnection.getConnection();
		 try {
		  return sqlSession.update(NS+"studyDelete", board_num);
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 MybatisConnection.close(sqlSession);
		 }
		  return 0;
	  }
	 

	 
     public List<StudyMenu> mainNewStudy3() {

       SqlSession sqlSession = MybatisConnection.getConnection();
       
       List<StudyMenu> list = null;
       try {
       list = sqlSession.selectList(NS + "mainNewStudy3");
       return list;

       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           MybatisConnection.close(sqlSession);
       }

       return null;
}   

}

		 	