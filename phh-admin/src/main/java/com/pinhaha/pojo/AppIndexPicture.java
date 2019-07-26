package com.pinhaha.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Builder;
import lombok.Data;

@Data
@Table(name = "app_index_picture")
public class AppIndexPicture implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -713957885781396918L;

	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;

    private Integer sort;

    private String introduce;

    private String img_url;

    private String jump_url;

    private Date create_time;
    
    private Boolean is_deleted;

}