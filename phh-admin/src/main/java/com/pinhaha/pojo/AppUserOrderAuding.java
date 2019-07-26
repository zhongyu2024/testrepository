package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;



@Data
@Table(name = "app_user_order_auding")
public class AppUserOrderAuding implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4496363754935150777L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

	private String order_no;

	private Long user_id;

	private Long invite_id;

	private Integer auding_type;

	private Long admin_user_id;

	private Date create_time;

}