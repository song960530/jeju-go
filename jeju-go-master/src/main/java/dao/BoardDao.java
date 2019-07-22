package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.BoardMapper;
import logic.Board;

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

	public List<Board> boardlist(Integer pageNum, int limit, int type) {
		param.clear();
		param.put("startrow", (pageNum - 1) * limit);
		param.put("limit", limit);
		param.put("type", type);
		return sqlSession.selectList(NS + "list", param);
	}

	public Board selectone(Integer no) {
		param.clear();
		param.put("no", no);
		Board b = sqlSession.selectOne(NS + "list", param);
		return b;
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
}



