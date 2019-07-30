package dao;

import dao.mapper.HotelMapper;
import dao.mapper.HreserveMapper;
import logic.Final;
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

	public List<Hreserve> searchroom(int mon, int startday, int endday, int countday, int people) {
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

	public int delayRoomnum(Final f1) {
		param.clear();
		param.put("hno", f1.getHno());
		param.put("name", f1.getName());
		param.put("mon", f1.getStart().split("-")[1]);
		param.put("day", f1.getStart().split("-")[2]);
		return sqlSession.getMapper(HreserveMapper.class).minNo(param);
	}

	public void insertdelayRoom(int rno) {
		sqlSession.getMapper(HreserveMapper.class).insertdelayRoom(rno);

	}

	public List<String> selectRooms(int hno, String name, int stmon, int startday, int endday) {
		param.clear();
		param.put("hno", hno);
		param.put("name", name);
		param.put("stmon", stmon);
		param.put("startday", startday);
		param.put("endday", endday);
		return sqlSession.getMapper(HreserveMapper.class).selectRooms(param);
	}

	public List<String> selectRooms2(int hno, String name, int stmon, int startday, int lastday, int enmon,
			int endday) {
		param.clear();
		param.put("hno", hno);
		param.put("name", name);
		param.put("stmon", stmon);
		param.put("startday", startday);
		param.put("lastday", lastday);
		param.put("enmon", enmon);
		param.put("endday", endday);
		return sqlSession.getMapper(HreserveMapper.class).selectRooms2(param);
	}

	public void nullRoomnum(int rno) {
		param.clear();
		param.put("rno", rno);
		sqlSession.getMapper(HreserveMapper.class).nullRoomnum(param);

	}

	public int selectno(int hno, String roomnum, int stmon, int startday, String name) {
		param.clear();
		param.put("hno", hno);
		param.put("roomnum", roomnum);
		param.put("stmon", stmon);
		param.put("startday", startday);
		param.put("name", name);
		return sqlSession.getMapper(HreserveMapper.class).selectno(param);
	}

	public void insertfinish(int i, String username) {
		param.clear();
		param.put("no", i);
		param.put("username", username);
		sqlSession.getMapper(HreserveMapper.class).insertfinish(param);
	}

	public int deleteForm(int hno, int stmon, int today) {
		param.clear();
		param.put("hno", hno);
		param.put("stmon", stmon);
		param.put("today", today);
		return sqlSession.getMapper(HreserveMapper.class).deleteForm(param);
	}

	public void hoteldelete(int hno) {
		sqlSession.getMapper(HreserveMapper.class).hoteldelete(hno);
	}

	public int roomdeleteForm(int hno, int stmon, int today, String name) {
		param.clear();
		param.put("hno", hno);
		param.put("stmon", stmon);
		param.put("today", today);
		param.put("name", name);
		return sqlSession.getMapper(HreserveMapper.class).roomdeleteForm(param);
	}

	public void hoteldelete2(int hno, String name) {
		param.clear();
		param.put("hno", hno);
		param.put("name", name);
		sqlSession.getMapper(HreserveMapper.class).hoteldelete2(param);
		
	}
}
