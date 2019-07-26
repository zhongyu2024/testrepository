package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Foodtable;
import com.zy.dao.mapper.canTaiMapper;

@Controller
@RequestMapping("/cantai")
public class canTaiAction {
	@Resource
	private canTaiMapper ctm;
	public void setCtm(canTaiMapper ctm) {
		this.ctm = ctm;
	}
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Foodtable> list=ctm.findAll();
		model.addAttribute("cantai", list);
		return "/pages/wh/cantai.jsp";
	}
	@RequestMapping("/findOthers")
	public String findOthers(String name,Model model){
		if(name.equals("全部")){
			List<Foodtable> list=ctm.findAll();
			model.addAttribute("cantai1", list);
		}else if(name.equals("大厅")){
			List<Foodtable> list=ctm.findDaTing();
			model.addAttribute("cantai1", list);
		}else if(name.equals("包厢")){
			List<Foodtable> list=ctm.findBaoXiang();
			model.addAttribute("cantai1", list);
		}
		return "/pages/wh/cantaishow.jsp";
	}
	@RequestMapping("/findByName")
	public void findByName(String name,HttpServletResponse response) throws IOException{
		String str="";
		if(ctm.findByName(name)>0){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/addCanTai")
	public void addCanTai(String name,int area,int seatsize,double minpay,HttpServletResponse response)throws IOException /*throws IOException*/{
		System.out.println(name+"---"+area+"---"+seatsize+"---"+minpay);
			//System.out.println(name);
			String str="";
			if(ctm.addCanTai(name, area, seatsize, minpay)){
				str="111";
			}
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(str);
			out.flush();
			out.close();
		
	}
	@RequestMapping("/editCanTai")
	public void editCanTai(int id,String name,int area,int seatsize,double minpay,Model model,HttpServletResponse response) throws IOException{
		String str="";
		if(ctm.editCanTai(id, name, area, seatsize, minpay)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/deleteCanTai")
	public void deleteCanTai(int id,HttpServletResponse response) throws IOException{
		String str="";
		if(ctm.deleteCanTai(id)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	
}
