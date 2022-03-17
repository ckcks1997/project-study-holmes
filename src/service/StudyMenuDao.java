package service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import java.util.ArrayList;
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

	/* 메뉴 페이지 수 */
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

	/* 페이지 리스트 */
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

	public int nextNum() {

		SqlSession sqlSession = MybatisConnection.getConnection();

		try {

			return sqlSession.selectOne(NS + "nextNum");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			MybatisConnection.close(sqlSession);
		}

		return 0;

	}

	/* 게시물추가 */
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
	
	public ArrayList<StudyMenu> selectList(String field, String value) {
	
		ArrayList<StudyMenu> list = new ArrayList<StudyMenu>();
		Connection conn = null;
		conn = this.getConnection();
		PreparedStatement pstmt = null;
		String sql1 = "select * from study_menu";
		String sql2 = "select * from board where " + field +" like ?";
		
		try {
			if(value==null || value=="") {
				pstmt = conn.prepareStatement(sql1);
			} else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1,  "%"+value+"%");			
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String subject = rs.getString("subject");
				int free = rs.getString("free");
				int pernum = rs.getString("pernum");
				String region = rs.getString("region");
				String menuid = rs.getString("menuid");
				
				
			}
		}
	}
	
	/* 검색 */
	
}
