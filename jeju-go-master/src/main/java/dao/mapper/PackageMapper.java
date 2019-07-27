package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Package;

public interface PackageMapper {
	@Select("select ifnull(max(no),0) from package")
	Integer maxno();

	@Insert("insert into package(no,name,content,travelday, price, mon, startday, regdate, max, photourl, photoname, chk, first, sub) "
			+ "values (#{no},#{name},#{content},#{travelday},#{price},#{mon},#{startday},now(),#{max},#{photourl}, #{photoname}, #{check}, #{first},#{sub})")
	boolean insert(Package pack);

	@Select("select no,name,content,travelday, price, mon, startday, regdate, max, photourl, photoname, chk as 'check' from package where no = #{no}")
	Package getPack(Integer no);

	@Select("select startday from package where no = #{no}")
	List<Package> packday(Integer no);

	@Update("update package p inner join finally f on p.no = f.pno set p.max = p.max - f.pnum where p.max > 0")
	void minermax(Map<String, Object> param);

	@Update("update package set chk = 0 where max < 1")
	int chkset(Package pack);

	@Select("select no,name,content,travelday, price, mon, startday, regdate, max, photourl, photoname, chk as 'check' from package where sub = 0")
	List<Package> packlist();

	@Select("select no,name,content,travelday, price, mon, startday, regdate, max, photourl, photoname, chk as 'check' from package where first = #{no} and sub > 0")
	List<Package> subpacklist(Integer no);
}
