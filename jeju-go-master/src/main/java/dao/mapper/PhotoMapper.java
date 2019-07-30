package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Photo;

public interface PhotoMapper {
	@Insert("insert into photo(no,hno,roomnum,type,photourl,photoname) values(#{no},#{hno},#{roomnum},#{type},#{photourl},#{photoname})")
	void insert(Photo p);

	@Select("select * from photo where no = #{no}")
	List<Photo> selectOne(Integer no);

	@Select("select * from photo where hno = #{hno} and roomnum=#{roomnum}")
	List<Photo> selectOne2(Map<String, Object> param);

	@Select("select ifnull(max(no),0) from photo")
	int maxno();

	@Select("select * from photo where hno = #{hno} and type=#{type}")
	List<Photo> selectOne3(Map<String, Object> param);

	@Delete("delete from photo where hno=#{hno}")
	void photodelete(int hno);
	@Delete("delete from photo where hno=#{hno} and type=#{name}")
	void photodelete2(Map<String, Object> param);

}
