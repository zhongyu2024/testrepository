package com.pinhaha.pojo;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "app_area_agent")
public class AppAreaAgent implements Serializable{



	/**
	 * 
	 */
	private static final long serialVersionUID = 1521863396417269915L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long province_id;

    private Long city_id;

    private Long user_id;

    private Date create_time;

    private Date update_time;

}