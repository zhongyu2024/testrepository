package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_teacher")
public class AppTeacher implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6752292934230728553L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private String teacher_name;

    private String img_url;
    
    private String introduction;

    private Date create_time;

}