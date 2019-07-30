package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.FinalMapper;
import logic.Final;
import logic.Package;

@Repository
public class FinalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.FinalMapper.";
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

	public void finish(int no, String roomnum, int rno2) {
		param.clear();
		param.put("no", no);
		param.put("roomnum", roomnum);
		param.put("rno2", rno2);
		sqlSession.getMapper(FinalMapper.class).finish(param);
	}

	public void realFinal(Final fi) {
		sqlSession.getMapper(FinalMapper.class).insert(fi);
	}

	public void setPoint(int point, String userid, int no) {
		param.clear();
		param.put("point", point);
		param.put("userid", userid);
		param.put("no", no);
		sqlSession.getMapper(FinalMapper.class).setPoint(param);
	}

	public int selectTotal(int no) {
		return sqlSession.getMapper(FinalMapper.class).selectTotal(no);
	}

	public void Pfinish(int no, int pno) {
		param.clear();
		param.put("no", no);
		param.put("pno", pno);
		sqlSession.getMapper(FinalMapper.class).Pfinish(param);
	}

	public void cancle(int no) {
		sqlSession.getMapper(FinalMapper.class).cancle(no);
	}

	public int selectPoint(int no) {
		return sqlSession.getMapper(FinalMapper.class).selectPoint(no);

	}

	public List<Final> history(String userid) {
		return sqlSession.getMapper(FinalMapper.class).history(userid);
	}

	public List<Final> cancellationl(String userid) {
		return sqlSession.getMapper(FinalMapper.class).cancellationl(userid);
	}

	public Final selectOne(int no) {
		return sqlSession.getMapper(FinalMapper.class).selectOne(no);
	}

	public void pleasecancle(int no) {
		sqlSession.getMapper(FinalMapper.class).pleasecancle(no);

	}

	public void backPoint(int point2, String userid, int pointno) {
		param.clear();
		param.put("point", -point2);
		param.put("userid", userid);
		param.put("no", pointno);
		sqlSession.getMapper(FinalMapper.class).backPoint(param);
	}

	public int finalcount(Integer no, String userid) {
		param.clear();
		param.put("userid", userid);
		param.put("no", no);
		return sqlSession.getMapper(FinalMapper.class).finalcount(param);
	}

	public List<Final> reservationmanagement(Integer pageNum, int limit) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		return sqlSession.selectList(NS + "list", param);
	}

	public int reservationcount() {
		return sqlSession.getMapper(FinalMapper.class).reservationcount();
	}

	public int acceptcount() {
		return sqlSession.selectOne(NS + "count");
	}
}
