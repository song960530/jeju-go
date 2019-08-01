package dao.mapper;

import org.apache.ibatis.annotations.Select;

public interface PointMapper {

	@Select("select ifnull(sum(point),0) from point where userid=#{userid}")
	int mypointsum(String userid);

}