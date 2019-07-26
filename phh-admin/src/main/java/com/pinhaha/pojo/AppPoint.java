package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_point")
public class AppPoint implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 5340992008109593288L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Integer change_num;

    private Date create_time;

}