package dao;

import dao.mapper.UserMapper;
import java.util.*;

import logic.Point;
import logic.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.UserMapper.";
	private Map<String, Object> param = new HashMap<String, Object>();

	public void insert(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);

	}

	public User selectOne(String userId) {
		return sqlSession.getMapper(UserMapper.class).selectOne(userId);
	}

	public List<User> list(String d) {
		param.clear();
		param.put("delete", d);
		return sqlSession.selectList(NS + "list", param);
	}

	public void delete(String id) {
		sqlSession.getMapper(UserMapper.class).delete(id);
	}

	public User check(User user) {
		return sqlSession.getMapper(UserMapper.class).check(user);
	}

	public User useridcheck(User user) {
		return sqlSession.getMapper(UserMapper.class).useridcheck(user);
	}

	public void getNewPwd(String password, String userid) {
		User user = new User();
		user.setPassword(password);
		user.setUserid(userid);
		sqlSession.getMapper(UserMapper.class).getNewPwd(user);
	}

	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}

	public void deleterequest(User user) {
		sqlSession.getMapper(UserMapper.class).deleterequest(user);
	}

	public void admindelete(User user) {
		sqlSession.getMapper(UserMapper.class).admindelete(user);
	}

	public void updatepw(User user) {
		sqlSession.getMapper(UserMapper.class).updatepw(user);
	}

	public Point getPoint(String userid) {
		return sqlSession.getMapper(UserMapper.class).getPoint(userid);
	}

	public int countPoint(String userid) {
		return sqlSession.getMapper(UserMapper.class).countPoint(userid);
	}

	public void insert(String userid, int no) {
		param.clear();
		param.put("userid", userid);
		param.put("no", no);
		sqlSession.getMapper(UserMapper.class).wish(param);
	}

	public int pointmaxno() {
		return sqlSession.getMapper(UserMapper.class).pointmaxno();
	}

	public void point(int no, String userid, int point, String type) {
		param.clear();
		param.put("no", no);
		param.put("userid", userid);
		param.put("point", -point);
		param.put("type", type);
		sqlSession.getMapper(UserMapper.class).setPoint(param);
	}

	public User idchk(User user) {
		return sqlSession.getMapper(UserMapper.class).idchk(user);
	}

	public Object history() {
		return null;
	}

	public void deletewish(String userid, int no) {
		param.clear();
		param.put("userid", userid);
		param.put("no", no);
		sqlSession.getMapper(UserMapper.class).deletewish(param);
	}

	public List<Integer> nolist(String userid) {
		return sqlSession.getMapper(UserMapper.class).selectNo(userid);
	}
}
