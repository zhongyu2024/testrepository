package com.zy.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.dao.mapper.EmpMapper;

@Service
public class EmpService {

	@Resource
	private EmpMapper em;
	public void setEm(EmpMapper em) {
		this.em = em;
	}
}
