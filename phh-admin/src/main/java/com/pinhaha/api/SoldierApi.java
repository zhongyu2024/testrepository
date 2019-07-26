package com.pinhaha.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pinhaha.mapper.AppSoldierApplyMapper;
import com.pinhaha.pojo.AppSoldierApply;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("SoldierApi")
@Slf4j
public class SoldierApi {
	@Autowired
	private AppSoldierApplyMapper appSoldierApplyMapper;
	
	@RequestMapping("getApplyAll")
	public Map<String,Object> getApplyAll (@RequestParam Map<String,Object> map){
		log.info(map.toString());
		Map<String,Object> json = new HashMap<String, Object>();
		Integer page = Integer.parseInt(map.get("page").toString());
		Integer limit = Integer.parseInt(map.get("limit").toString());
		
		
		PageHelper.startPage(page, limit);
		List<AppSoldierApply> list=appSoldierApplyMapper.selectAllApply(map);
		PageInfo<AppSoldierApply> info=new PageInfo<>(list);
		
		json.put("code", 0);
		json.put("msg", "");
		json.put("count",info.getTotal());
		json.put("data", info.getList());
		return json;
	}
	
	@RequestMapping("up_app_soldier_apply")
	public Map<String,Object> up_app_soldier_apply (@RequestBody AppSoldierApply info){
		
		Map<String,Object> json = new HashMap<String, Object>();
		int a = appSoldierApplyMapper.updateByPrimaryKey(info);
		if(a>0){
			json.put("code", 0);
			json.put("msg", "完成拒绝审核");
			return json;
		}
		json.put("code", 1);
		json.put("msg", "审核失败");
		return json;
	}
}
