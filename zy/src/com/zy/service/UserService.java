package com.zy.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Emp;
import com.zy.dao.mapper.UserMapper;

@Service
public class UserService {
	@Resource
	private UserMapper userMapper;
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	public Emp getUserByName(String name)
	{
/*		System.out.println("进入service");
*/		return userMapper.findByName(name);
	}
	
/*	public void addUser(User user)
	{
		userMapper.insert(user);//required  事务1
		
		user.setSex(3);
		userMapper.update(user);
	}*/

}
