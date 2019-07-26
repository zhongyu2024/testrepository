package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Table(name = "app_course_good")
public class AppCourseGood implements Serializable{
	   
	
      /**
	 * 
	 */
	private static final long serialVersionUID = -6309721971375063202L;
	
	@Id
	@GeneratedValue(generator = "JDBC")
	private  Long id;
     
	 //课程id
      private  Long course_id;
      
	 //图片
      private  String img;
     
	 //排序
      private  Long sort_id;
      
      @Transient
      private  String title; 
     
      
     
    
}