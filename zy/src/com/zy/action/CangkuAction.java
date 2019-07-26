package com.zy.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.bean.Cangku;
import com.zy.service.CangkuService;

@Controller
@RequestMapping("/Cangku")
public class CangkuAction {
	
	@Resource
	private CangkuService cks;

	public void setCks(CangkuService cks) {
		this.cks = cks;
	}
	
	@RequestMapping("/showByPage")
	public String showByPage (Model model,@RequestParam(defaultValue="1")int page) throws Exception{
		List<Cangku> cktable= cks.findByPage(page);
		int cnum=cks.findAll()/20;
		if(cks.findAll()%20!=0){
			cnum=cnum+1;
		}
		
		model.addAttribute("cktable", cktable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		
		return "/pages/sjl/cangwei.jsp";
	}
	
	@RequestMapping("/addNews")
	public String addNews (Model model,int page,String name,String info) throws Exception{
		Cangku ck=new Cangku(0, name, info);
		cks.addNew(ck);
		List<Cangku> cktable= cks.findByPage(page);
		/*System.out.println(cktable.size());
		model.addAttribute("cktable", cktable);
		model.addAttribute("page", page);*/
		int cnum=cks.findAll()/20;
		if(cks.findAll()%20!=0){
			cnum=cnum+1;
		}
		
		model.addAttribute("cktable", cktable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/sjl/ajaxcangwei.jsp";
		
	}
	
	@RequestMapping("/updateById")
	public String updateById (Model model,int page,String name,String info,int id) throws Exception{
		Cangku ck=new Cangku(id, name, info);
		cks.updateById(ck);
		List<Cangku> cktable= cks.findByPage(page);
		/*System.out.println(cktable.size());*/
		int cnum=cks.findAll()/20;
		if(cks.findAll()%20!=0){
			cnum=cnum+1;
		}
		
		model.addAttribute("cktable", cktable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/sjl/ajaxcangwei.jsp";
		
	}
	
	@RequestMapping("/deleteById")
	public String deleteById (Model model,int page,int id) throws Exception{
		cks.deleteById(id);
		List<Cangku> cktable= cks.findByPage(page);
		/*System.out.println(cktable.size());*/
		int cnum=cks.findAll()/20;
		if(cks.findAll()%20!=0){
			cnum=cnum+1;
		}
		
		model.addAttribute("cktable", cktable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/sjl/ajaxcangwei.jsp";
	}
	
	@RequestMapping("/pageById")
	public String pageById (Model model,int page) throws Exception{
		List<Cangku> cktable= cks.findByPage(page);
		/*System.out.println(cktable.size());*/
		int cnum=cks.findAll()/20;
		if(cks.findAll()%20!=0){
			cnum=cnum+1;
		}
		
		model.addAttribute("cktable", cktable);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/sjl/ajaxcangwei.jsp";
	}
	
	
	
	@RequestMapping("/findById")
	public void findById (Integer id,HttpServletResponse response) throws Exception{
		Cangku ck=cks.findById(id);
		JSONArray js = JSONArray.fromObject(ck);
		
		System.out.println(js.toString());
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		PrintWriter out = response.getWriter();
		out.write(js.toString());
		out.flush();
		out.close();
	}
}
