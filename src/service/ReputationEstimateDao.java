package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import model.ReputationEstimate;
import model.Search;
import model.StudyMenu;
import util.MybatisConnection;

public class ReputationEstimateDao {
	private static final String NS = "reputationestimate.";
	private Map<String, Object> map = new HashMap<>();

	
	public int insertReputation(ReputationEstimate rep) {
		SqlSession sqlSession = MybatisConnection.getConnection();
		try {
			return sqlSession.insert(NS + "insertReputation", rep);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(sqlSession);
		}
		return 0;
	}
	
	
	public List<ReputationEstimate> getReputation(String nick) {
      SqlSession sqlSession = MybatisConnection.getConnection();
      try {
          return sqlSession.selectList(NS + "getReputation", nick);
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          MybatisConnection.close(sqlSession);
      }
      return null;
  }
	 
}

		 	