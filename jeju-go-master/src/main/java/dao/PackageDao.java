package dao;

import java.util.HashMap;
import java.util.List;
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
	private final String NS = "dao.mapper.PackageMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public int maxno() {
		return sqlSession.getMapper(PackageMapper.class).maxno();
	}
	
	public boolean insert(Package pack) {
		return sqlSession.getMapper(PackageMapper.class).insert(pack);
	}

	public List<Package> packlist() {
		param.clear();
		return sqlSession.getMapper(PackageMapper.class).packlist();
	}

	public Package getPack(Integer no) {
		return sqlSession.getMapper(PackageMapper.class).getPack(no);
	}

	public List<Package> packday(Integer no) {
		return sqlSession.getMapper(PackageMapper.class).packday(no);
	}

	public void minermax(Package pack, int pnum) {
		param.clear();
		param.put("pack", pack);
		param.put("pnum", pnum);
		sqlSession.getMapper(PackageMapper.class).minermax(param);
	}

	public void packregist(Package pack) {
		sqlSession.getMapper(PackageMapper.class).insert(pack);
	}

	public int getPeople(String startday, Integer no) {
		param.clear();
		param.put("startday", startday);
		param.put("no", no);
		return sqlSession.getMapper(PackageMapper.class).getPeople(param);
	}

	public void packdelete(Integer no) {
		sqlSession.getMapper(PackageMapper.class).packdelete(no);
	}
}
