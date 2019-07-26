package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Opentime;
import com.zy.dao.mapper.timeMapple;

@Controller
@RequestMapping("/time")
public class timeAction {

	@Resource
	private timeMapple tm;
	public void setTm(timeMapple tm) {
		this.tm = tm;
	}
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Opentime> list=tm.findAll();
		model.addAttribute("time", list);
		return "/pages/wh/time.jsp";
	}
	@RequestMapping("/findName")
	public void findName(HttpServletResponse response,String name) throws IOException{
		String str="";
		if(tm.findthis(name).size()>0){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/addTime")
	public void addTime(HttpServletResponse response,Opentime opentime) throws IOException{
		String str="";
		if(tm.addTime(opentime)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/editTime")
	public void editTime(HttpServletResponse response,Opentime opentime) throws IOException{
		String str="";
		if(tm.editTime(opentime)){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/deleteTime")
	public void deleteTime(HttpServletResponse response,int id) throws IOException{
		String str="";
		if(tm.deleteTime(id)){
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
