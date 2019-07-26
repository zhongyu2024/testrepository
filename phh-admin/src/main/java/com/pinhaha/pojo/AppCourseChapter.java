package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Table(name = "app_course_chapter")
public class AppCourseChapter implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5420586654404665164L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;

	private Long course_id;

	private String tittle;

	private String vedio_url;

	private Date create_time;

	private Date end_time;

	private Long is_deleted;
	
	private Long teacher_id;
	
	@Transient
	private String isDeleteStr;
	
	

}