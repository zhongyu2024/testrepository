package com.zy.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.XdBean;
import com.zy.service.XdService;

@Controller
@RequestMapping("/detail")
public class XdAction {
  @Resource
  private XdService xdservice;

public void setXdservice(XdService xdservice) {
	this.xdservice = xdservice;
}
@RequestMapping("/xdtableAll")
public String xdtableAll(Model model)throws Exception{ 
	   //���˼�¼����
	//System.out.println(1);
	XdBean listAll = xdservice.xdsearchAll();
	 //System.out.println(listAll);
	//System.out.println(listAll.getDanshu()+"++++++++++"+listAll.getDiscount()+listAll.getPersoncount()+listAll.getRealcount());
	model.addAttribute("listAl", listAll); 
	return "/pages/lxd/yybb.jsp";
	 
}
@RequestMapping("/xdtiaojian")
public String xdtiaojian(String time1,String time2,Model model)throws Exception{ 
	XdBean list;
	if(time1.length()==0)
	{
		  list = xdservice.xdsearchAll();
	}
	else{
		  list = xdservice.xdsearchA(time1,time2);
	}
	
	if(list==null)
	{
		
		System.out.println("+++++dasggsdgsadfgsfdgaf");
	}
	System.out.println(list.getDanshu()+"++++++++++"+list.getDiscount());
	model.addAttribute("lisAl", list); 
	model.addAttribute("time1",time1);
	model.addAttribute("time2",time2);
	return "/pages/lxd/xdajax.jsp";
	 
}
}
