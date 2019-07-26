package com.pinhaha.pojo;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Table(name = "user_get_voucher_money")
public class UserGetVoucherMoney {
	   
	@Id
	@GeneratedValue(generator = "JDBC")
      private  Long id;
     
	
      private  Long user_id;
     
	
      private  String order_sn;
     
      
      private  Integer get_way;
      
      
      private  String account;
      
      private  String real_name;
	
      
      private  BigDecimal amount;
     
	
      private  Date create_time;
     

      private  Integer is_check;
      
      private  Integer is_pay;
      
      private String order_no;
      
      //查询
      @Transient
      private String user_name;
      
     
    
}