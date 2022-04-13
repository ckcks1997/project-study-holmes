package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.Report;
import util.MybatisConnection;

public class ReportDao {

	private static final String NS = "report.";
	private Map<String, Object> map = new HashMap<>();
	
	
	public int insertReport(String nickname, int report_reason, int board_num) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("nickname", nickname);
			map.put("report_reason", report_reason);
			map.put("board_num",board_num);
			
			return sqlSession.update(NS+"insertReport",map);			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	//닉네임리스트 가져와서 비교할때 사용
	public List<String> reportNickname(int board_num){
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectList(NS + "reportNickname",board_num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		
		return null;
	}
	
	//알림으로 신고사유 보여줄때 사용 
	public List<String> reportReason(int board_num){
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.selectList(NS + "reportReason",board_num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		
		return null;
	}
	
	
	
	
} //end class
