package dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.ReviewMapper;
import logic.Review;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.ReviewMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public void insert(Review review) {
		sqlSession.getMapper(ReviewMapper.class).insert(review);
	}

	public List<Review> selectList(Integer no) {
		return sqlSession.getMapper(ReviewMapper.class).selectList(no);
	}

	public int sumSepoint(Integer no) {
		return sqlSession.getMapper(ReviewMapper.class).sumSepoint(no);
	}

}
