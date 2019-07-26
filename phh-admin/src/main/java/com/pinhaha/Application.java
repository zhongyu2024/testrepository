package com.pinhaha;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.spring.annotation.MapperScan;


@SpringBootApplication
@EnableTransactionManagement
@MapperScan(basePackages = "com.pinhaha.mapper", markerInterface = Mapper.class)
public class Application {

//	public static void main(String[] args) {
//		SpringApplication.run(Application.class, args);
//	}
//	
	
	
	
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(Application.class);
	}


	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}


}
