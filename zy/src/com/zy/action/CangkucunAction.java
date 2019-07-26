package com.zy.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.service.CangkucunService;

@Controller
@RequestMapping("/Cangkucun")
public class CangkucunAction {
	
	@Resource
	private CangkucunService ckcs;

	public void setCkcs(CangkucunService ckcs) {
		this.ckcs = ckcs;
	}
	
	@RequestMapping("/showByPage")
	public String showByPage(Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		List<Cangkucun> ckctable=ckcs.findByPage(page);
		int cnum=ckcs.findPAll()/20;
		if(ckcs.findPAll()%20!=0){
			cnum=cnum+1;
		}
		model.addAttribute("ckctable", ckctable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/sjl/kucun.jsp";
	}
	
	@RequestMapping("/findByText")
	public String findByText(Model model,String text,String type,@RequestParam(defaultValue="1")int page)throws Exception{
		System.out.println(type);
		List<Cangkucun> ckctable;
		int cnum;
		if(type.equals("0")){
			System.out.println("ceshi");
			ckctable=ckcs.findByPage(page);
			cnum=ckcs.findPAll()/20;
			if(ckcs.findPAll()%20!=0){
				cnum=cnum+1;
			}
		}else{
			CangkucunSearch ckcsearch=new CangkucunSearch("ckname",text, page, 0);
			if(type.equals("2")){
				System.out.println("ceshi2");
				ckcsearch=new CangkucunSearch("mname", text, page, 0);
			}
			if(type.equals("3")){
				System.out.println("ceshi3");
				ckcsearch=new CangkucunSearch("materialsid",text, page, 0);
			}
			System.out.println(type+"--"+text+"--"+page);
			ckctable=ckcs.findByText(ckcsearch);
			cnum=ckcs.findTAll(ckcsearch)/20;
			if(ckcs.findTAll(ckcsearch)%20!=0){
				cnum=cnum+1;
			}
		}
		System.out.println(ckctable.size());
		model.addAttribute("ckctable", ckctable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/sjl/ajaxkucun.jsp";
	}
	
}
