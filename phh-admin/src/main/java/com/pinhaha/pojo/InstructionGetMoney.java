package com.pinhaha.pojo;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Table(name = "instruction_get_money")
public class InstructionGetMoney {
	   
	@Id
	@GeneratedValue(generator = "JDBC")
      private  Long id;
     
	
      private  Long ins_id;
     
	
      private  String order_sn;
     
      
      private  Integer get_way;
      
      
      private  String account;
      
      private  String real_name;
	
      
      private  BigDecimal amount;
     
	
      private  Date create_time;
     

      private  Integer is_check;
      
      private  Integer is_pay;
     
      
      //查询
      @Transient
      private String ins_name;
      
     
    
}