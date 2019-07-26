package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "member_level")
public class MemberLevel implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -8588719997523437946L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;
	
	private String member_name;

	private BigDecimal member_price;

	private Integer member_coupon_number;

	private Integer get_coupon_number;

	private Boolean share_buy_use_coupon;

	private BigDecimal one_level_return;

	private BigDecimal two_level_return;

	private BigDecimal return_point;
	
	private BigDecimal province_return;
	
	private BigDecimal city_return;

	private Date create_time;

	private Date update_time;

	private Integer levle_grade;
	
	private Integer type;

	private Integer time_unit;
	
	private Integer send_partner_num;

}