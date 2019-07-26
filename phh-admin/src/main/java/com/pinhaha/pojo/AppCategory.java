package com.pinhaha.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Table(name = "app_category")
public class AppCategory implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 2050348183591347364L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id; 

    private String name;
    
    private String img_url;

    private Long parent_id;

    private String level_tree;

    private Boolean is_deleted;

    private Integer sort;
    
    private Integer sort_index;
    
    private Boolean is_index;
    

}