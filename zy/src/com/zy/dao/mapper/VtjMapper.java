package com.zy.dao.mapper;

import java.util.List;

import com.zy.bean.VTJSearch;
import com.zy.bean.VTJtable;
import com.zy.bean.vipShuChu;
import com.zy.bean.vipShuRu;

public interface VtjMapper {
	/*--1无条件查询*/
	public List<VTJtable> search1(VTJSearch vs);
	/*--2只查询时间*/
	public List<VTJtable> search2(VTJSearch vs);
	/*--3只查询会员名、卡号*/
	public List<VTJtable> search3(VTJSearch vs);
	/*--4只查询会员类型*/
	public List<VTJtable> search4(VTJSearch vs);
	/*--5只查询有记录的*/
	public List<VTJtable> search5(VTJSearch vs);
	/*--6查询时间和会员名*/
	public List<VTJtable> search6(VTJSearch vs);
	/*--7查询时间和会员卡类型*/
	public List<VTJtable> search7(VTJSearch vs);
	/*--8查询时间和有记录*/
	public List<VTJtable> search8(VTJSearch vs);
	/*--9查询会员名和会员卡*/
	public List<VTJtable> search9(VTJSearch vs);
	/*--10查询会员名和有记录*/
	public List<VTJtable> search10(VTJSearch vs);
	/*--11查询会员卡类型和有记录*/
	public List<VTJtable> search11(VTJSearch vs);
	/*--12查询时间和会员名和会员卡*/
	public List<VTJtable> search12(VTJSearch vs);
	/*--13查询时间和会员名和有记录*/
	public List<VTJtable> search13(VTJSearch vs);
	/*--14查询时间和会员卡和有记录*/
	public List<VTJtable> search14(VTJSearch vs);
	/*--15查询会员名和会员卡和有记录*/
	public List<VTJtable> search15(VTJSearch vs);
	/*--16查询时间，会员名，会员卡，有记录*/
	public List<VTJtable> search16(VTJSearch vs);
	
	
	
	
	public List<vipShuChu> findByvip(vipShuRu sr);
}
