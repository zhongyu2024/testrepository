package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "app_course_watch_history")
public class AppCourseWatchHistory implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -3505127320195515010L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Long course_id;

    private Date create_time;

}