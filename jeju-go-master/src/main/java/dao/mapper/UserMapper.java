package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Point;
import logic.User;

public interface UserMapper {

	@Insert("insert into member(userid,username,password,phone) values(#{userid},#{username},#{password},#{phone})")
	void insert(User user);

	@Select("select * from member where userid =#{userid}")
	User selectOne(String userid);

	@Select("select * from member where username = #{username} and phone = #{phone}")
	User check(User user);

	@Delete("delete from member where userid=#{id}")
	void delete(String id);

	@Select("select * from member where username = #{username} and phone = #{phone}")
	User useridcheck(User user);

	@Update("update member set password=#{password} where userid=#{userid}")
	void getNewPwd(User user);

	@Update("update member set phone=#{phone} where userid=#{userid}")
	void update(User user);

	@Update("update member set deleterequest='Y' where userid=#{userid}")
	void deleterequest(User user);

	@Delete("delete from member where userid=#{userid}")
	void admindelete(User user);

	@Update("update member set password=#{password} where userid=#{userid}")
	void updatepw(User user);

	@Select("select * from point where userid=#{userid}")
	Point getPoint(String userid);
	
	@Select("select ifnull(sum(point),0) from point where userid=#{userid}")
	int countPoint(String userid);

	@Insert("insert into wish(userid,no) values(#{userid},#{no})")
	void wish(Map<String, Object> param);
	
	@Select("select ifnull(max(no),0) from point")
	int pointmaxno();

	@Insert("insert into point(no,userid,point,regdate,type) values(#{no},#{userid},#{point},now(),#{type})")
	void setPoint(Map<String, Object> param);

	@Select("select * from Member")
	User select();

	@Update("update point")
	void givePoint(double point);
}
