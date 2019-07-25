package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.FinalMapper;
import logic.Final;

@Repository
public class FinalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.FinallyDao.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public int maxno() {
		return sqlSession.getMapper(FinalMapper.class).maxno();
		
	}

	public void insert(Final f1) {
		sqlSession.getMapper(FinalMapper.class).insert(f1);
		
	}

	public List<Final> acceptList() {
		return sqlSession.getMapper(FinalMapper.class).acceptList();

	}

	public void finish(int no, String roomnum) {
		param.clear();
		param.put("no", no);
		param.put("roomnum", roomnum);
		sqlSession.getMapper(FinalMapper.class).finish(param);
		
	}

}
