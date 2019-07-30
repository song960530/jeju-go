package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Final;
import logic.Package;

public interface FinalMapper {

	@Select("select ifnull(max(no),0) from finally")
	int maxno();

	@Insert("insert into finally(no,hno,name,pno,pnum,rno,total,userid,username,start,end,day,checked,regdate,point,hname,roomnum)"
			+ " values(#{no},#{hno},#{name},#{pno},#{pnum},#{rno},#{total},#{userid},#{username},#{start},#{end},#{day},'���δ��',now(),#{point},#{hname},#{roomnum})")
	void insert(Final f1);

	@Select("select * from finally where checked='���δ��'")
	List<Final> acceptList();

	@Update("update finally set roomnum=#{roomnum},checked='���οϷ�' where no=#{no}")
	void finish(Map<String, Object> param);

	@Insert("insert into point(no, userid, point, regdate, type) values(#{no}, #{userid}, #{point}, now(), '����')")
	void setPoint(Map<String, Object> param);

	@Select("select total from finally where no=#{no}")
	int selectTotal(int no);

	@Update("update finally set pno=#{pno},checked='���οϷ�' where no=#{no}")
	void Pfinish(Map<String, Object> param);

	@Update("update finally set checked='�������' where no=#{no}")
	void cancle(int no);

	@Select("select point from finally where no=#{no}")
	int selectPoint(int no);
	
	@Select("select * from finally where userid = #{userid}")
	List<Final> history(String userid);

	@Update("update finally set checked='�������' where no=#{no}")
	List<Final> cancellationl(String userid);
}
