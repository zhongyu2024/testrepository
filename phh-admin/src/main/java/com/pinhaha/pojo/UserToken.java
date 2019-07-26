package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "user_token")
public class UserToken implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8147947457895650850L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long userId;

    private String token;

    private Date creatTime;

    private Date endTime;

}