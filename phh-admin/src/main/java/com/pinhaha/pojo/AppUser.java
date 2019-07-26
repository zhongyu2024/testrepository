package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;



@Table(name = "app_user")
@Data
public class AppUser implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4260059634595977784L;

	@Id
	@GeneratedValue(generator = "JDBC")
	private Long id;

	private String user_name;

	private String real_name;
	
	private String phone;

	private String password;

	private Date create_time;

	private Long invitation_user_id;

	private String invite_code;
	
	private String img_url;

	private Long member_level_id;
	
	private Date member_level_end_time;
	
	private Long province_id;
	
	private String province_name;
	
	private Long city_id;
	
	private String city_name;
	
	private Long is_active;
	
	private Long is_delete;
	
	@Transient
	private String upPhone;
	

}