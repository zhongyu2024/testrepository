package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;


@Data
@Table(name = "app_course_order")
public class AppCourseOrder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5201233721427744539L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

	private Long user_id;

	private Long course_id;

	private String order_no;

	private BigDecimal order_price;

	private BigDecimal reduction_price;

	private Date create_time;

	private Date over_time;

	private Boolean is_closed;

	private Boolean is_pay;

	private Date pay_time;

}