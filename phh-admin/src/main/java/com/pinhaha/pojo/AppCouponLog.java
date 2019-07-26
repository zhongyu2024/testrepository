package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_coupon_log")
public class AppCouponLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3895883245988065763L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

	private Long user_id;

	private Integer change_num;

	private Integer before_num;
	
	private Date create_time;
	
	private Integer type;
	
	private String message;
	
	private Long produce_user_id;

}