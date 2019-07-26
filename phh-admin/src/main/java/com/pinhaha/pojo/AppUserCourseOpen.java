package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "app_user_course_open")
public class AppUserCourseOpen implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -1753895114926469945L;
	
	
	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Long course_id;

    private Date update_time;

    private Date start_time;

    private Date over_time;

   
}