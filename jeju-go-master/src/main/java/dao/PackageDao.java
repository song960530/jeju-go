package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.HotelMapper;
import dao.mapper.PackageMapper;
import logic.Hotel;
import logic.Package;

@Repository
public class PackageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.HotelMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public int maxno() {
		return sqlSession.getMapper(PackageMapper.class).maxno();
	}
	
	public boolean insert(Package pack) {
		return sqlSession.getMapper(PackageMapper.class).insert(pack);
	}


}
