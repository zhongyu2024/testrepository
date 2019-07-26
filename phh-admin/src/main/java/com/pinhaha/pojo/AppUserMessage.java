package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;



@Data
@Table(name = "app_user_message")
public class AppUserMessage implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 70903305529800048L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Integer type;

    private String title;

    private String context;

    private Date create_time;

    private Boolean is_read;

}