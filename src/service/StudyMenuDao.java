package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Community;
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
	 
}
