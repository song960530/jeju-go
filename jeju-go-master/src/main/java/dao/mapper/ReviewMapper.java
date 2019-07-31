package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Review;

public interface ReviewMapper {

	@Insert("insert into review(hno,roomnum,pno,userid,name,regdate,content,sepoint) values(#{hno},#{roomnum},#{pno},#{userid},#{name},now(),#{content},#{sepoint})")
	void insert(Review review);

	@Select("select * from review where hno=#{no}")
	List<Review> selectList(Integer no);

	@Select("select sum(sepoint)/count(*) from review where hno=#{no}")
	int sumSepoint(Integer no);
}
