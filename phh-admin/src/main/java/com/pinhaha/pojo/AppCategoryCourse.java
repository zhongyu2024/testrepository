package com.pinhaha.pojo;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "app_category_course")
public class AppCategoryCourse implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 4665803726990755781L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long category_id;

    private Long course_id;

}