package com.zy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zy.bean.VTJSearch;
import com.zy.bean.VTJtable;
import com.zy.bean.vipShuChu;
import com.zy.bean.vipShuRu;
import com.zy.dao.mapper.VtjMapper;

@Service
public class VtjService {
	
	@Resource
	private VtjMapper vm;
	public void setVm(VtjMapper vm) {
		this.vm = vm;
	}
	
	
	/*--1无条件查询*/
	public List<VTJtable> search1(VTJSearch vs){
		return vm.search1(vs);
	}
	/*--2只查询时间*/
	public List<VTJtable> search2(VTJSearch vs){
		return vm.search2(vs);
	}
	/*--3只查询会员名、卡号*/
	public List<VTJtable> search3(VTJSearch vs){
		return vm.search3(vs);
	}
	/*--4只查询会员类型*/
	public List<VTJtable> search4(VTJSearch vs){
		return vm.search4(vs);
	}
	/*--5只查询有记录的*/
	public List<VTJtable> search5(VTJSearch vs){
		return vm.search5(vs);
	}
	/*--6查询时间和会员名*/
	public List<VTJtable> search6(VTJSearch vs){
		return vm.search6(vs);
	}
	/*--7查询时间和会员卡类型*/
	public List<VTJtable> search7(VTJSearch vs){
		return vm.search7(vs);
	}
	/*--8查询时间和有记录*/
	public List<VTJtable> search8(VTJSearch vs){
		return vm.search8(vs);
	}
	/*--9查询会员名和会员卡*/
	public List<VTJtable> search9(VTJSearch vs){
		return vm.search9(vs);
	}
	/*--10查询会员名和有记录*/
	public List<VTJtable> search10(VTJSearch vs){
		return vm.search10(vs);
	}
	/*--11查询会员卡类型和有记录*/
	public List<VTJtable> search11(VTJSearch vs){
		return vm.search11(vs);
	}
	/*--12查询时间和会员名和会员卡*/
	public List<VTJtable> search12(VTJSearch vs){
		return vm.search12(vs);
	}
	/*--13查询时间和会员名和有记录*/
	public List<VTJtable> search13(VTJSearch vs){
		return vm.search13(vs);
	}
	/*--14查询时间和会员卡和有记录*/
	public List<VTJtable> search14(VTJSearch vs){
		return vm.search14(vs);
	}
	/*--15查询会员名和会员卡和有记录*/
	public List<VTJtable> search15(VTJSearch vs){
		return vm.search15(vs);
	}
	/*--16查询时间，会员名，会员卡，有记录*/
	public List<VTJtable> search16(VTJSearch vs){
		return vm.search16(vs);
	}
	
	
	public List<vipShuChu> findByvip(vipShuRu sr){
		return vm.findByvip(sr);
	}
	
	
	
}
