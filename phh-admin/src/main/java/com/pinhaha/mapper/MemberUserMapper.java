package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberUserMapper {

	List<Map<String,Object>> member_user_all(Map<String,Object> map);
	
	int member_user_all_count(Map<String,Object> map);
	List<Map<String,Object>> can_add_province();
	int up_province(Map<String,Object> map);
	int add_app_area_agent(Map<String,Object> map);
	List<Map<String,Object>> can_add_city();
}
