package com.pinhaha.api;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pinhaha.mapper.AppIndexPictureMapper;
import com.pinhaha.pojo.AppCategory;
import com.pinhaha.pojo.AppIndexPicture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("indexPicApi")
public class IndexPicApi {
	@Autowired
	private AppIndexPictureMapper appIndexPictureMapper;
	
	
	@RequestMapping("addIndexPic")
	public int addIndexPic(String intro,Integer sort,String img_url,String jump_url){
		AppIndexPicture pic=new AppIndexPicture();
		pic.setCreate_time(new Date());
		pic.setImg_url(img_url);
		pic.setIntroduce(intro);
		pic.setIs_deleted(false);
		pic.setJump_url(jump_url);
		pic.setSort(sort);
		return appIndexPictureMapper.insert(pic);
	}
	
	
	@RequestMapping("getAllIndexPic")
	public Map<String, Object> getAllIndexPic(@RequestParam("page") int page,@RequestParam("limit") int limit
			,@RequestParam(required=false)String name){
		PageHelper.startPage(page, limit);
		List<AppIndexPicture> list = appIndexPictureMapper.selectByOrder();
		PageInfo<AppIndexPicture> pageInfo = new PageInfo<AppIndexPicture>(list);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", pageInfo);
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	@RequestMapping("delIndePic")
	public int delIndePic(Long id){
		AppIndexPicture pic = appIndexPictureMapper.selectByPrimaryKey(id);
		if(pic==null){
			return 0;
		}
		pic.setIs_deleted(true);
		appIndexPictureMapper.updateByPrimaryKey(pic);
		return 1;
	}
	
	@RequestMapping("updateCategory")
	public int updateIndePic(Long id,String name,
			@RequestParam(required=false)Integer sort,@RequestParam(required=false)String img_url,
			@RequestParam(required=false)String jump_url){
		
		AppIndexPicture pic = appIndexPictureMapper.selectByPrimaryKey(id);
		pic.setImg_url(img_url);
		pic.setIntroduce(name);
		pic.setJump_url(jump_url);
		pic.setSort(sort);
		appIndexPictureMapper.updateByPrimaryKey(pic);
		return 1;
	}
}
