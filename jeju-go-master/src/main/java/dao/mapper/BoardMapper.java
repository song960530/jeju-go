package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.User;

public interface BoardMapper {

	@Select("select ifnull(max(no),0) from board")
	int maxnum();
	
	@Insert("insert into board (no, userid, subject, content, regdate, ref, reflevel, refstep, type, type2) "
			+ "values(#{no}, #{userid}, #{subject}, #{content}, now(), #{ref}, #{reflevel}, #{refstep}, #{type}, #{type2})")
	void insert(Board board);

	@Select("select * from board where no = #{no})")
	Board selectOne(Integer No);

	@Update("update board set subject = #{subject}, content = #{content} where no = #{no}")
	void noticeupdate(Board board);

	@Delete("delete from board where ref = #{no}")
	void noticedelete(int no);

	@Select("select userid from member where userid = #{userid}")
	String getUser(String userid);

	@Update("update board set refstep = refstep + 1 where ref = #{ref} and refstep > #{refstep}")
	void updaterefstep(Board board);

	
	@Select("select count(*) from board where (ref = #{ref} or reflevel = 1) and ref = #{ref}")
	int getQnACount(Integer no);
	
	@Select("select * from board where no = #{no}")
	Board getQnA(Integer no);
	
	@Select("select * from board where ref = #{no} and reflevel = #{reflevel}")
	Board getRQnA(Map<String, Object> param);

}
