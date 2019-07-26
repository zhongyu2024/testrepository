package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Table(name = "app_course_comment")
@Data
public class AppCourseComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5996553347493088305L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;

	private Long course_id;

	private Long parent_id;

	private String context;

	private Date create_time;

	private Boolean is_deleted;

}