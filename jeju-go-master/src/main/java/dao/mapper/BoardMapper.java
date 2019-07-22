package dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

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

	@Delete("delete from board where no = #{no}")
	void noticedelete(int no);
}
