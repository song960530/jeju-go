package dao;

import dao.mapper.HreserveMapper;
import logic.Hreserve;
import logic.Room;
import logic.Room2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HreserveDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.HreserveMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public int maxno() {
		return sqlSession.getMapper(HreserveMapper.class).maxno();
	}

	public void insert(Hreserve hreserve) {
		sqlSession.getMapper(HreserveMapper.class).insert(hreserve);
	}

	public List<Hreserve> searchroom(int mon, int startday, int endday, int countday,int people) {
		param.clear();
		param.put("mon", mon);
		param.put("startday", startday);
		param.put("endday", endday);
		param.put("countday", countday);
		param.put("people", people);
		return sqlSession.getMapper(HreserveMapper.class).searchroom(param);
	}

	public List<Hreserve> searchroom2(int stmon, int enmon, int startday, int lastday, int endday, int countday,
			int countday2, int people) {
		param.clear();
		param.put("stmon", stmon);
		param.put("enmon", enmon);
		param.put("startday", startday);
		param.put("endday", endday);
		param.put("lastday", lastday);
		param.put("countday", countday);
		param.put("countday2", countday2);
		param.put("people", people);
		
		return sqlSession.getMapper(HreserveMapper.class).searchroom2(param);
	}
}
