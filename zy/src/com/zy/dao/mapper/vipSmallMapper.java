package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.vipShuChu;
import com.zy.bean.vipShuRu;

public interface vipSmallMapper {
	public List<vipShuChu> findByvip(vipShuRu sr);
}
