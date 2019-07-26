package com.pinhaha.pojo;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
@Data
@Table(name = "app_user_account")
public class AppUserAccount{
	   
	@Id
	@GeneratedValue(generator = "JDBC")
      private  Long id;
     
	
      private  Long user_id;
     
	
      private  BigDecimal total_amount;
     
	
      private  Date create_time;
     
	
      private  Date update_time;
     
      
    
}