package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Table(name = "member_order")
@Data
public class MemberOrder implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4939746471510007597L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;

	private Long user_id;

	private Long member_id;

	private String order_no;

	private BigDecimal order_price;

	private BigDecimal reduction_price;

	private Date create_time;

	private Date over_time;

	private Boolean is_closed;

	private Boolean is_pay;
	
	private Integer return_type;

	private Date pay_time;
	
	private Integer order_type;


}