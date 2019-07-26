package com.zy.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.service.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpAction {

	@Resource
	private EmpService es;
	public void setEs(EmpService es) {
		this.es = es;
	}
	/*@RequestMapping("/e")
	public String addEmp(){
		System.out.println("1");
		return "pages/lw/Vip.jsp";
		
		
	}*/
}
