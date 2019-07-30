package dao;

import dao.mapper.HotelMapper;
import java.util.*;

import logic.Final;
import logic.Hotel;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.HotelMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public int maxno() {
		return sqlSession.getMapper(HotelMapper.class).maxno();
	}

	public boolean insert(Hotel h) {
		return sqlSession.getMapper(HotelMapper.class).insert(h);
	}

	public List<Hotel> list() {
		return sqlSession.selectList(NS + "list");
	}

	public List<Integer> nolist() {
		return sqlSession.getMapper(HotelMapper.class).nolist();
	}

	public Hotel selectOne(Integer i) {
		return sqlSession.getMapper(HotelMapper.class).selectOne(i);
	}

	public void hoteldelete(int hno) {
		sqlSession.getMapper(HotelMapper.class).hoteldelete(hno);

	}

	public int selectwish(String userid, Integer no) {
		param.clear();
		param.put("userid", userid);
		param.put("no", no);
		return sqlSession.getMapper(HotelMapper.class).selectwish(param);
	}
}
