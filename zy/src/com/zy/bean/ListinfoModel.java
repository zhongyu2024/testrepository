package com.zy.bean;

import java.util.List;
/**
 * 清单详细内容管理实体类
 * @author Administrator
 *
 */
public class ListinfoModel {

	private List<Listinfo> lists;

	public List<Listinfo> getLists() {
		return lists;
	}

	public void setLists(List<Listinfo> lists) {
		this.lists = lists;
	}

	public ListinfoModel(List<Listinfo> lists) {
		super();
		this.lists = lists;
	}

	public ListinfoModel() {
		super();
	}
	
}
