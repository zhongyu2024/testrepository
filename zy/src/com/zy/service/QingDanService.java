package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.Emp;
import com.zy.bean.Foodtable;
import com.zy.bean.Hetable;
import com.zy.bean.Listinfo;
import com.zy.bean.Opentime;
import com.zy.bean.QueryQingDanFenye;
import com.zy.bean.Vip;
import com.zy.bean.ZList;
import com.zy.dao.mapper.QingDanMapper;
import com.zy.dao.mapper.ZzyFoodtableMapper;

@Service
public class QingDanService {
	@Resource
	private QingDanMapper qdMapper;

	public void setZftMapper(QingDanMapper qdMapper) {
		this.qdMapper=qdMapper;
	}
	public List<Opentime> findAllOpentime()
	{
		return qdMapper.findAllOpentime();
	}
	public List<ZList> findAllQingDan()
	{
		return qdMapper.findAllQingDan();
	}
	public List<ZList> findAlllistFenye(int start,int end)
	{
		return qdMapper.findAlllistFenye(start, end);
	}
	public Foodtable findtableByid(int id)
	{
		return qdMapper.findtableByid(id);
	}
	public Emp findempByid(int id)
	{
		return qdMapper.findempByid(id);
	}
	public Vip findvipByid(int id)
	{
		return qdMapper.findvipByid(id);
	}
	public List<ZList> findlistjuqery(QueryQingDanFenye qqdf)
	{
		return qdMapper.findlistjuqery(qqdf);
	}
	public List<ZList> getBylistFenye(QueryQingDanFenye qqdf)
	{
		return qdMapper.getBylistFenye(qqdf);
	}
	public ZList findlistByid(String id)
	{
		return qdMapper.findlistByid(id);
	}
	public List<Listinfo> findListinfo(String id)
	{
		return qdMapper.findListinfo(id);
	}
	public Hetable findAlljiezhang(String bid)
	{
		return qdMapper.findAlljiezhang(bid);
	}
	//根据子台id搜索未结账对象，以获取父is
	public Hetable findhetableByBid(String bid)
	{
		return qdMapper.findhetableByBid(bid);
	}
}
