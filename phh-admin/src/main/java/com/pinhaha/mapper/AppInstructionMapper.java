package com.pinhaha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.AppInstruction;

import tk.mybatis.mapper.common.Mapper;

public interface AppInstructionMapper extends Mapper<AppInstruction>{
	public List<AppInstruction> getInsList();

	public List<AppInstruction> insList();
}