package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Table(name = "app_voucher_money")
public class AppVoucherMoney implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1249662830588703781L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;

	// 用户id
	private Long user_id;

	// 代金券金额
	private BigDecimal voucher_num;

	// 商家id
	private Long ins_id;

	// 课程id
	private Long course_id;

	// 创建时间
	private Date create_time;

	// 操作时间
	private Date oprate_time;

	// 提现状态
	private Integer drawed;

	// 折扣课程id
	private Long discount_id;

	// 订单号
	private String order_sn;

	// 课程类型
	private Integer course_type;

	private Integer type;

	private Long voucher_id;

	public BigDecimal getVoucher_num() {
		return voucher_num;
	}

	public void setVoucher_num(BigDecimal voucher_num) {
		this.setVoucher_num_str(voucher_num.toString());
		this.voucher_num = voucher_num;
	}

	@Transient
	private String voucher_num_str;

	private Long refuse_status_;

	private Long refuse_id_;

}