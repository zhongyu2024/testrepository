package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
@Data
@Table(name = "app_instruction")
public class AppInstruction implements Serializable{
	   
	/**
	 * 
	 */
	private static final long serialVersionUID = 8775649544385962226L;

	@Id
	@GeneratedValue(generator = "JDBC")
      private  Long id;
     
	 //账户名
      private  String account_name;
     
	 //密码
      private  String pwd;
     
	 //手机号
      private  String mobile;
     
	 //真实姓名
      private  String real_name;
     
	 //机构名称
      private  String ins_name;
     
	 //头像
      private  String img_url;
     
	 //身份证号
      private  String id_card;
     
	 //身份证正面
      private  String id_card_up;
     
	 //身份证反面
      private  String id_card_down;
     
	 //状态 0：审核中 1： 通过 2： 锁定
      private  Long status = 0L;
     
	 //创建时间
      private  Date create_time;
     
     //营业执照
      private String bus_lisence;
      
      private String address;
     
      private Boolean deleted;
     
      private Integer sort;
     
      private Integer get_percent;
    
}