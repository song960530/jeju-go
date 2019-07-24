package dao;

import java.util.HashMap;
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

}
