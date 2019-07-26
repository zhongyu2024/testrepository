package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;



@Data
@Table(name = "app_soldier_apply")
public class AppSoldierApply implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 5375421168359322371L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private String real_name;

    private Integer type;
    
    private Integer sexy_type;

    private Integer soldier_type;

    private String card_no;

    private String card_img_url;

    private Date bir_date_time;

    private Date create_time;

    private Date update_time;

    private Integer apply_type;
}