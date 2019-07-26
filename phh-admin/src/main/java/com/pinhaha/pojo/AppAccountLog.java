package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_account_log")
public class AppAccountLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6744109277169204196L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private BigDecimal change_amount;
    
    private BigDecimal before_amount;

    private Date create_time;
    
    private Integer type;
    
    private String message;
    
    private Long producu_user_id;

}