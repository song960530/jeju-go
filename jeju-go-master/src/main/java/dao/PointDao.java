package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.PointMapper;
import logic.Point;

@Repository
public class PointDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.PointMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public List<Point> mypoint(int pageNum, Integer limit, String userid) {
		param.clear();
		param.put("userid", userid);
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		return sqlSession.selectList(NS + "list", param);
	}

	public int mypointcount(String userid) {
		param.clear();
		param.put("userid", userid);
		return sqlSession.selectOne(NS + "count", param);
	}

	public int mypointsum(String userid) {
		return sqlSession.getMapper(PointMapper.class).mypointsum(userid);
	}
}
