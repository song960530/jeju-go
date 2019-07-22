package dao;

import dao.mapper.PhotoMapper;
import java.util.*;
import logic.Photo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PhotoDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.PhotoMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public void insert(Photo p) {
		sqlSession.getMapper(PhotoMapper.class).insert(p);
	}

	public List<Photo> selectOne(Integer i) {
		return sqlSession.getMapper(PhotoMapper.class).selectOne(i);
	}
	public List<Photo> selectOne2(Integer hno,String roomnum) {
		param.clear();
		param.put("hno", hno);
		param.put("roomnum", roomnum);
		return sqlSession.getMapper(PhotoMapper.class).selectOne2(param);
	}
	public List<Photo> selectOne3(Integer hno,String type) {
		param.clear();
		param.put("hno", hno);
		param.put("type", type);
		return sqlSession.getMapper(PhotoMapper.class).selectOne3(param);
	}

	public int maxno() {
		return sqlSession.getMapper(PhotoMapper.class).maxno();
	}
}
