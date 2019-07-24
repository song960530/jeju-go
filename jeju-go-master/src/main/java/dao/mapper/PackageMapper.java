package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Package;

public interface PackageMapper {
	
	@Select("select ifnull(max(no),0) from package")
	Integer maxno();
	
	@Insert("insert into package(no,name,content,travelday, price, mon, startday, regdate, max, photourl, photoname) "
			+ "value(#{no},#{name},#{content},#{travelday},#{price},#{mon},#{startday},now(),#{max},#{photourl},#{photoname})")
	boolean insert(Package pack);
}
