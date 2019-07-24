package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Final;

public interface FinalMapper {

	@Select("select ifnull(max(no),0) from finally")
	int maxno();

	@Insert("insert into finally(no,hno,name,pno,pnum,rno,total,userid,username,start,end,day,checked,regdate,point,hname,roomnum)"
			+ " values(#{no},#{hno},#{name},#{pno},#{pnum},#{rno},#{total},#{userid},#{username},#{start},#{end},#{day},'½ÂÀÎ´ë±â',now(),#{point},#{hname},#{roomnum})")
	void insert(Final f1);

}
