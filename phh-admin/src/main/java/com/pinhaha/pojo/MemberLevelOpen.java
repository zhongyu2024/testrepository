package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;


@Data
@Table(name = "member_level_open")
public class MemberLevelOpen implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 6516464997689891434L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Long user_id;

    private Long invite_user_id;
    
    private Long invite_member_id;

    private Long member_id;

    private Date open_time;

    private Date end_time;

}