package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Caipin;

import com.zy.bean.Mode;
import com.zy.dao.mapper.caiPinMapple;

@Controller
@RequestMapping("/caiPin")
public class caiPinAction {
	@Resource
	private caiPinMapple cpm;
	public void setCpm(caiPinMapple cpm) {
		this.cpm = cpm;
	}
	/**
	 * 菜品
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAllFood")
	public String findAllFood(Model model)throws Exception{
		List<Caipin> list=cpm.findAllFood();
		model.addAttribute("food", list);
		return "/pages/wh/caipin.jsp";
	}
	@RequestMapping("/finds")
	public String finds(Model model)throws Exception{
		List<Caipin> list=cpm.findAllFood();
		model.addAttribute("food1", list);
		return "/pages/wh/typeshow.jsp";
	}
	/**
	 * ajax查询分类
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/showOthers")
	public String showOthers(Model model,String name)throws Exception{
		List<Caipin> list=cpm.showOthers(name);
		model.addAttribute("food1", list);
		return "/pages/wh/typeshow.jsp";
	}
	@RequestMapping("/searchCai")
	public void searchCai(String name,HttpServletResponse response) throws IOException{
		String str="";
		if(cpm.searchCai(name).size()>0){
			str="111";
		}
		//System.out.println(str);
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/addFood")
	public String addFood(String name,String type,Double price,Model model) throws IOException{
		int typeid=cpm.searchthis(type);
		//System.out.println(typeid);
		cpm.addFood(name,typeid,price);
		List<Caipin> list=cpm.findAllFood();
		model.addAttribute("food1", list);
		return "/pages/wh/typeshow.jsp";
	}
	
	@RequestMapping("/deleteFood")
	public String deleteFood(int id,Model model) throws IOException{
		cpm.deleteFood(id);
		List<Caipin> list=cpm.findAllFood();
		model.addAttribute("food1", list);
		return "/pages/wh/typeshow.jsp";
		
	}
	@RequestMapping("/editFood")
	public String editFood(String name,String name1,Double price,Model model) throws IOException{
		cpm.editFood(name, name1, price);
		List<Caipin> list=cpm.findAllFood();
		model.addAttribute("food1", list);
		return "/pages/wh/typeshow.jsp";
		
	}
	
	/**
	 * 菜系
	 */
	@RequestMapping("/findAllCookType")
	public String findAllCookType(Model model)throws Exception{
		List<Mode> list=cpm.findAllCookType();
		model.addAttribute("type",list);
		return "/caiPin/findAllFood.do";
	}
	@RequestMapping("/findAllCookType1")
	public String findAllCookType1(Model model)throws Exception{
		List<Mode> list=cpm.findAllCookType();
		System.out.println(list.size());
		for(Mode l:list){
			System.out.println(l.getName());
		}
		model.addAttribute("type1",list);
		return "/pages/wh/caiType.jsp";
	}
	
	@RequestMapping("/searchType")
	public void searchType(String name,HttpServletResponse response)throws IOException{
		String str="";
		if(cpm.searchType(name).size()>0){
			str="111";//有该用户
		}
		//System.out.println(str);
	//	System.out.println(cpm.searchType(name).size());
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	/**
	 * ajax添加种类
	 * @throws IOException 
	 */
	@RequestMapping("/addCookType")
	public String addCookType(Mode mode,Model model) throws IOException{
		cpm.addCookType(mode);
		List<Mode> list=cpm.findAllCookType();
		model.addAttribute("type", list);
		return "/pages/wh/caipingshow.jsp";
	}
	//删除种类并且删除删除该种类的菜品
	@RequestMapping("/deleteCookType")
	public String deleteCookType(String name,Model model)throws IOException{
		int id=cpm.searchthis(name);
		//System.out.println(id);
		//int a=cpm.searchFoodByName(id).size();
		if(cpm.searchFoodByName(id)>0){
			cpm.deleteAllFood(id);
			cpm.deleteCookType(name);
		}else{
			cpm.deleteCookType(name);
		}
		List<Mode> list=cpm.findAllCookType();
		model.addAttribute("type", list);
		return "/pages/wh/caipingshow.jsp";
	}
	@RequestMapping("/editCookType")
	public String editCookType(Model model,String name,String name1)throws IOException{
		cpm.editCookType(name,name1);
		List<Mode> list=cpm.findAllCookType();
		model.addAttribute("type", list);
		return "/pages/wh/caipingshow.jsp";
	}

	
	
}
