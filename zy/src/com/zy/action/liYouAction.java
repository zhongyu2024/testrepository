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
import com.zy.dao.mapper.liYouMapple;

@Controller
@RequestMapping("/liYou")
public class liYouAction {
	@Resource
	private liYouMapple lym;
	public void setLym(liYouMapple lym) {
		this.lym = lym;
	}
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Mode> list=lym.findAll();
		model.addAttribute("liyou", list);
		return "/pages/wh/liyou.jsp";
	}
	@RequestMapping("/findName")
	public void findName(String name,HttpServletResponse response) throws IOException{
		String str="";
		List<Mode> list=lym.findName(name);
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
	@RequestMapping("/addLiYou")
	public void addSpecial(String name,HttpServletResponse response) throws IOException{
		String str="";
		if(lym.addLiYou(name)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/editLiYou")
	public void editSpecial(String name,int id,HttpServletResponse response) throws IOException{
		String str="";
		if(lym.editLiYou(name,id)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/deleteLiYou")
	public void deleteSpecial(int id,HttpServletResponse response) throws IOException{
		String str="";
		if(lym.deleteLiYou(id)){
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
