package service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Report;
import util.MybatisConnection;

public class ReportDao {

	private static final String NS = "report.";
	private Map<String, Object> map = new HashMap<>();
	
	public int reportNextNum() {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
		return sqlSession.selectOne(NS+"reportNextNum");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	public int insertReport(Report report) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.update(NS+"insertReport",report);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
} //end class
