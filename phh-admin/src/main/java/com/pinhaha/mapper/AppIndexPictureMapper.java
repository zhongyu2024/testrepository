package com.pinhaha.mapper;

import java.util.List;

import com.pinhaha.pojo.AppIndexPicture;

import tk.mybatis.mapper.common.Mapper;

public interface AppIndexPictureMapper  extends Mapper<AppIndexPicture>{
	List<AppIndexPicture> selectByOrder();
}