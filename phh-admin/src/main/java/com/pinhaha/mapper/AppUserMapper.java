package com.pinhaha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppUser;
import com.pinhaha.pojo.MemberLevel;
import com.pinhaha.pojo.UserGetMoney;

import tk.mybatis.mapper.common.Mapper;


public interface AppUserMapper extends Mapper<AppUser>{

	AppUser selectByInviteUserId(@Param("userId")Long userId);
	
	List<Map<String,Object>> getNextLevelByUserId(@Param("userId")Long userId);
	
	AppUser selectByInviteCode(@Param("inviteCode")String inviteCode);
	
	AppUser selectByPhone(@Param("phone")String phone);
	
	AppUser selectByUserName(@Param("userName")String userName);
	
	List<Map<String,Object>> getMemberListByMemberType(@Param("type")Integer type,@Param("phone")String phone,@Param("userName")String userName);
	
	List<AppUser> userList(@Param("page")int page,@Param("limit")int limit);
	
	int userListNum();
	
	void updateUser(int is_active,int is_delete,int user_id);
	
	List<AppUser> getUserByParams(Map<String,Object> map);
	
	int getUserByParamsCount(Map<String,Object> map);
	
	List<AppUser> getVipUser(Map<String,Object> map);
	
	List<MemberLevel> getlevel();
	
	List<UserGetMoney> allgetmoneyinfo(Map<String,Object> map);
	
	void updateGetMoney(int is_pay,String order_sn,int id);
	
}