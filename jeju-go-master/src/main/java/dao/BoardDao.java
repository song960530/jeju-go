package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.User;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BoardMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();
	
	public int boardcount(int type) {
		param.clear();
		param.put("type", type);
		return sqlSession.selectOne(NS + "count", param);
	}

	public List<Board> list(Integer pageNum, int limit, int type) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("type", type);
		return sqlSession.selectList(NS + "list", param);
	}

	public Board selectone(Integer no) {
		param.clear();
		param.put("no", no);
		return sqlSession.selectOne(NS + "list", param);
	}

	public void noticewrite(Board board) {
		sqlSession.getMapper(BoardMapper.class).insert(board);
	}
	
	public int maxnum() {
		return sqlSession.getMapper(BoardMapper.class).maxnum();
	}

	public void noticeupdate(Board board) {
		sqlSession.getMapper(BoardMapper.class).noticeupdate(board);
	}

	public void noticedelete(Board board) {
		sqlSession.getMapper(BoardMapper.class).noticedelete(board.getNo());
	}

	public String getUser(String userid) {
		return sqlSession.getMapper(BoardMapper.class).getUser(userid);
	}

	public int count(int type, String userid, Integer type2) {
		param.clear();
		param.put("type", type);
		param.put("type2", type2);
		param.put("userid", userid);
		return sqlSession.selectOne(NS + "count", param);
	}

	public List<Board> qnalist(Integer pageNum, int limit, int type, String userid, Integer type2) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("type", type);
		param.put("type2", type2);
		param.put("userid", userid);
		return sqlSession.selectList(NS + "list", param);
	}

	public int count(int type, Integer type2) {
		param.clear();
		param.put("type", type);
		param.put("type2", type2);
		return sqlSession.selectOne(NS + "count", param);
	}

	public List<Board> adqnalist(Integer pageNum, int limit, int type, Integer type2) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("type", type);
		param.put("type2", type2);
		return sqlSession.selectList(NS + "list", param);
	}

	public void updaterefstep(Board board) {
		sqlSession.getMapper(BoardMapper.class).updaterefstep(board);
	}

	public List<Board> boardlist(Integer pageNum, int limit, int type, int no) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("type", type);
		param.put("no", no);
		return sqlSession.selectList(NS + "replist", param);
	}

	public Board qnablist(Integer no) {
		return sqlSession.getMapper(BoardMapper.class).getQnA(no);
	}

	public int qnacount(Integer no) {
		return sqlSession.getMapper(BoardMapper.class).getQnACount(no);
	}

	public Board qnarlist(Integer no, int reflevel) {
		param.clear();
		param.put("no",no);
		param.put("reflevel", reflevel);
		return sqlSession.getMapper(BoardMapper.class).getRQnA(param);
	}
}



