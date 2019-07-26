package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "app_user_partner_num")
public class AppUserPartnerNum implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7382560787452384339L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Integer parent_num;

    private Date create_time;

}