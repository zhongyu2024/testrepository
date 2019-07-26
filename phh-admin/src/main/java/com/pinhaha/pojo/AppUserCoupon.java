package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;





@Table(name = "app_user_coupon")
@Data
public class AppUserCoupon implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2454966743778723364L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Integer course_total;

    private Date create_time;

    private Date update_time;

}