package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;



@Data
@Table(name = "app_course_order_payment")
public class AppCourseOrderPayment implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -9146210215788260259L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private String order_sn;

    private String course_order_no;

    private String pay_type;

    private BigDecimal pay_amount;

    private Boolean is_pay;

    private Date create_time;

    private Date over_time;

    private Date pay_time;

}