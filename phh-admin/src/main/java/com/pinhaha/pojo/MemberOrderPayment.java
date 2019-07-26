package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "member_order_payment")
public class MemberOrderPayment  implements Serializable{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2926268313789310397L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

	private Long userId;

	private String orderSn;

	private String memberOrderNo;

	private String payType;

	private BigDecimal payAmount;

	private Boolean isPay;

	private Date createTime;

	private Date overTime;

	private Date payTime;


}