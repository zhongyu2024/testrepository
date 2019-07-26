package com.pinhaha.pojo;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
/**
 * 是否免费
 * @author jdandian.com
 * @date 2018年11月16日
 */

@Data
@Table(name="app_course")
public class AppCourse {
	
	@Id
	@GeneratedValue(generator = "JDBC")
      private  Long id;
	
	  private 	Long category_id;
     
	 //课程名称
      private  String title;
     
	 //课程介绍
      private  String context;
      
     //类型
      private Integer type;
     
	 //图片链接
      private  String image_url;
     
	 //排序
      private  Long sort;
     
	 //销量
      private  Long sales;
     
	 //课程价格
      private  BigDecimal price;
     
	 //创建时间
      private  Date create_time;
     
	 //课程结束时间
      private  Date end_time;
     
	 //删除状态
      private  Boolean is_deleted;
     
	 //是否支持会员
      private  Boolean is_member;
     
	 //是否免费
      private  Boolean is_free;
      
     //是否上架 
      private  Boolean is_show;
      
      //是否显示在首页
      private  Boolean is_index;
      
      //是否精品
      private  Boolean is_good;
     
     
    

}