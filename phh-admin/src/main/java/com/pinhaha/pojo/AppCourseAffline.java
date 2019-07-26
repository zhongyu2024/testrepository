package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_course_affline")
public class AppCourseAffline implements Serializable{
	   
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2604131338468454805L;

	@Id
	@GeneratedValue(generator = "JDBC")

	
      private  Long id;
     
	 //商家id
      private  Long ins_id;
     
	 //课程名称
      private  String title;
     
	 //课程介绍
      private  String context;
     
	 //介绍视频链接
      private  String context_url;
     
	 //图片链接
      private  String image_url;
     
	 //排序
      private  Long sort;
     
	 //课程价格
      private  BigDecimal price;
     
	 //删除状态
      private  Boolean deleted;
     
	 //平台提取百分比
      private  Long percent = 0L;
     
     
     
    
}