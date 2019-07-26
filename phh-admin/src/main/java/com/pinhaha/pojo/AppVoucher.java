package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_voucher")
public class AppVoucher implements Serializable{
	   
	
      /**
	 * 
	 */
	private static final long serialVersionUID = 8416557446045317821L;
	
	@Id
	@GeneratedValue(generator = "JDBC")
	private  Long id;
     
	 //用户id
      private  Long user_id;
     
	 //代金券金额
      private  BigDecimal voucher_num;
     
	 //是否被领取
      private  Boolean checked;
     
	 //商家id
      private  Long ins_id;
     
	 //课程id
      private  Long course_id;
     
	
      private  Date create_time;
     
      
    
}