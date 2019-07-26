package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

/**
 * 
 * Description:
 * This class {phh-seller}  code is all, prohibit other projects that are not the company's project.
 * @author shiquanli
 *    <p>15257129351@163.com</p>
 *    <p>1695446827@qq.com</p>
 *    TITLE ：phh-seller - AppInsBill
 *    DATE ： 2019年4月28日 下午6:28:01
 */
@Data
@Table(name = "ins_bill")
public class AppInsBill implements Serializable{
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -8620591318426326393L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id_;
	
	private Long type_;
	
	private Long ins_id_;
	
	private String munber_;
	
	private Date create_time_;
	
	private String msg_;
	
	private Long mid_;
	
	/**********   订单支付成功获取收益  ***/
	@Transient
	public static final Long ORDER_NUMBER_1 = 1l;    
	
	
	/**********   提现中类型  ***/
	@Transient
	public static final Long ORDER_NUMBER_2 = 2l;   
	
	/**********   提现失败类型  ***/
	@Transient
	public static final Long ORDER_NUMBER_3 = 3l;     
	
	/**********   提现成功类型  ***/
	@Transient
	public static final Long ORDER_NUMBER_4 = 4l;     
	
	/**********   提现失败返款  ***/
	@Transient
	public static final Long ORDER_NUMBER_5 = 5l;     

}
