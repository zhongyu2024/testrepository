package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Mode;
import com.zy.dao.mapper.specialMapple;

@Controller
@RequestMapping("/special")
public class specialAction {
	@Resource
	private specialMapple sm;
	public void setSm(specialMapple sm) {
		this.sm = sm;
	}
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Mode> list=sm.findAll();
		model.addAttribute("info", list);
		return "/pages/wh/special.jsp";
	}
	@RequestMapping("/findName")
	public void findName(String name,HttpServletResponse response) throws IOException{
		String str="";
		List<Mode> list=sm.findName(name);
		if(list.size()>0){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/addSpecial")
	public void addSpecial(String name,HttpServletResponse response) throws IOException{
		String str="";
		if(sm.addSpecial(name)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/editSpecial")
	public void editSpecial(String name,int id,HttpServletResponse response) throws IOException{
		String str="";
		if(sm.editSpecial(name,id)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/deleteSpecial")
	public void deleteSpecial(int id,HttpServletResponse response) throws IOException{
		String str="";
		if(sm.deleteSpecial(id)){
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
