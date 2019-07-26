package com.zy.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.dao.mapper.MimayzMapper;

@Service
public class MimayzService {
	@Resource
	private MimayzMapper mm;
	public void setMm(MimayzMapper mm) {
		this.mm = mm;
	}
	public String huoquPass(String name){
		System.out.println("进入pass");
		return mm.huoquPass(name);
	}
	public boolean changePass(String pass,int id){
		System.out.println("进入chang");
		return mm.changePass(pass,id);
	}
}
