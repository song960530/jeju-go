package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Room;
import logic.Room2;

public interface RoomMapper {
	@Insert("insert into room(hno,roomnum,name,price,convenient,bed,bedcount,max) values(#{hno},#{roomnum},#{name},#{price},#{convenient},#{bed},#{bedcount},#{max})")
	boolean insert(Room room);

	@Select("select * from room where hno = #{no}")
	List<Room> selectList(Integer no);

	@Select("select count(*) from room where hno=#{no}")
	Integer count(Integer no);

	@Select("select * from room where hno=#{hno} and name=#{name}")
	Room selectOne(Map<String, Object> param);

	@Select("select h.no,h.hname,r.roomnum,r.name,r.max from hotel h,room r where h.no=#{hno} and r.hno=#{hno}")
	List<Room2> selectRoom2(Integer hno);
}
