package dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Final;
import logic.Hotel;

public interface HotelMapper {

	@Select("select ifnull(max(no),0) from hotel")
	Integer maxno();

	@Insert("insert into hotel(no,hname,address,lat,lng,content,tel) value(#{no},#{hname},#{address},#{lat},#{lng},#{content},#{tel})")
	boolean insert(Hotel h);

	@Select("select no from hotel")
	List<Integer> nolist();

	@Select("select * from hotel where no = #{no}")
	Hotel selectOne(Integer no);

	@Delete("delete from hotel where no=#{hno}")
	void hoteldelete(int hno);
}
