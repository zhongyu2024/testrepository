package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "admin_send_sms")
public class AdminSendSms implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -1799438233967450691L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;

    private String code;

    private String phone;

    private Date create_time;

    private Date end_time;

}