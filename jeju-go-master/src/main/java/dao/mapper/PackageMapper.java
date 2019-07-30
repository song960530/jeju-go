package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Package;

public interface PackageMapper {
	@Select("select ifnull(max(no),0) from package")
	Integer maxno();

	@Insert("insert into package(no,name,content,travelday, price, mon, startday, regdate, max, photourl, photoname) "
			+ "values (#{no},#{name},#{content},#{travelday},#{price},#{mon},#{startday},now(),#{max},#{photourl}, #{photoname})")
	boolean insert(Package pack);

	@Select("select * from package where no = #{no}")
	Package getPack(Integer no);

	@Select("select startday from package where no = #{no}")
	List<Package> packday(Integer no);

	@Update("update package p inner join finally f on p.no = f.pno set p.max = p.max - f.pnum where p.max > 0")
	void minermax(Map<String, Object> param);

	@Select("select * from package")
	List<Package> packlist();

	@Select("select ifnull(sum(pnum),0) from finally where start = #{startday} and pno = #{no}")
	int getPeople(Map<String, Object> param);

	@Delete("delete from package where no = #{no}")
	void packdelete(Integer no);
}
