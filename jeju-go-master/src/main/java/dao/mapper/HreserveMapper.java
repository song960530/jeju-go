package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Final;
import logic.Hreserve;
import logic.Room;
import logic.Room2;

public interface HreserveMapper {
	@Select("select ifnull(max(no),0) from hreserve")
	int maxno();

	@Insert("insert into hreserve(no,hno,roomnum,name,mon,day,max) values(#{no},#{hno},#{roomnum},#{name},#{mon},#{day},#{max})")
	void insert(Hreserve hreserve);

	@Select("select hno,roomnum,name from hreserve h where mon=#{mon} and day between #{startday} and #{endday} and subscriber is null and max>=#{people} group by hno,name,roomnum having count(*)=${countday} order by hno")
	List<Hreserve> searchroom(Map<String, Object> param);

	@Select("select hno,roomnum,name from hreserve where (mon=#{stmon}) and (day between #{startday} and #{lastday}) and (subscriber is null) and (max>=#{people})" + 
			" group by hno,name,roomnum having count(*)=#{countday} " + 
			"INTERSECT " + 
			"select hno,roomnum,name from hreserve where (mon=#{enmon}) and (day between 1 and #{endday}) and (subscriber is null) and (max>=#{people}) " + 
			"group by hno,name,roomnum having count(*)=#{countday2} order by hno" + 
			"")
	List<Hreserve> searchroom2(Map<String, Object> param);

	@Select("select min(no) from hreserve where hno=#{hno} and name=#{name} and mon=#{mon} and day=#{day} and subscriber is null")
	int minNo(Map<String, Object> param);

	@Update("update hreserve set subscriber='½ÂÀÎ´ë±â' where no=#{rno}")
	void insertdelayRoom(int rno);

}
