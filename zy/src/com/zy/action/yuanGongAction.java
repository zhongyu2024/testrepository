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
import com.zy.bean.Yuangong;
import com.zy.dao.mapper.yuanGongMapple;

@Controller
@RequestMapping("/Yuangong")
public class yuanGongAction {
	@Resource
	private yuanGongMapple ym;
	public void setYm(yuanGongMapple ym) {
		this.ym = ym;
	}
	@RequestMapping("/findAll")
	public String findAll(Model model){
		List<Yuangong> list=ym.findAll();
		List<Yuangong> l=list;
		for(int i=0;i<list.size();i++){
			String a=list.get(i).getBirthday();
			String b=list.get(i).getHiredate();
			String c=a.substring(0, 11);
			String d=b.substring(0, 11);
			l.get(i).setBirthday(c);
			l.get(i).setHiredate(d);
		}
		List<Mode> mode=ym.findAllPower();
		model.addAttribute("power", mode);
		model.addAttribute("yuangong",l);
		return "/pages/wh/employee.jsp";
	}
	@RequestMapping("/findAll1")
	public String findAll1(Model model){
		List<Mode> mode=ym.findAllPower();
		model.addAttribute("power", mode);
		return "/pages/wh/emppower.jsp";
	}
	@RequestMapping("finds")
	public String finds(Model model){
		List<Yuangong> list=ym.findAll();
		List<Yuangong> l=list;
		for(int i=0;i<list.size();i++){
			String a=list.get(i).getBirthday();
			String b=list.get(i).getHiredate();
			String c=a.substring(0, 11);
			String d=b.substring(0, 11);
			l.get(i).setBirthday(c);
			l.get(i).setHiredate(d);
		}
		model.addAttribute("yuangong",l);
		return "/pages/wh/empInfo.jsp";
	}
	@RequestMapping("/findOthers")
	public String showOthers(Model model,String name)throws Exception{
		List<Yuangong> list=ym.findOthers(name);
		List<Yuangong> l=list;
		for(int i=0;i<list.size();i++){
			String a=list.get(i).getBirthday();
			String b=list.get(i).getHiredate();
			String c=a.substring(0, 11);
			String d=b.substring(0, 11);
			l.get(i).setBirthday(c);
			l.get(i).setHiredate(d);
		}
		model.addAttribute("yuangong",l);
		return "/pages/wh/empInfo.jsp";
	}
	@RequestMapping("/addEmp")
	public String addEmp(Model model,Yuangong yuangong,String powername){
		//System.out.println(yuangong.getName()+"++"+yuangong.getUsername()+"++"+powername+"++"+yuangong.getSex()+"++"+yuangong.getTel()+"++"+yuangong.getBirthday()+"++"+yuangong.getUserpass());
		int id=ym.searchIdByName(powername);
		yuangong.setPowerid(id);
		System.out.println(id);
		ym.addEmp(yuangong);
		System.out.println("成功");
		List<Yuangong> list=ym.findAll();
		List<Yuangong> l=list;
		for(int i=0;i<list.size();i++){
			String a=list.get(i).getBirthday();
			String b=list.get(i).getHiredate();
			String c=a.substring(0, 11);
			String d=b.substring(0, 11);
			l.get(i).setBirthday(c);
			l.get(i).setHiredate(d);
		}
		model.addAttribute("yuangong",l);
		return "/pages/wh/empInfo.jsp";
	}
	@RequestMapping("/editEmp")
	public String editEmp(Model model,Yuangong yuangong,String powername){
		int id=ym.searchIdByName(powername);
		yuangong.setPowerid(id);
		System.out.println(yuangong.getSex());
		ym.editEmp(yuangong);
		List<Yuangong> list=ym.findAll();
		List<Yuangong> l=list;
		for(int i=0;i<list.size();i++){
			String a=list.get(i).getBirthday();
			String b=list.get(i).getHiredate();
			String c=a.substring(0, 11);
			String d=b.substring(0, 11);
			l.get(i).setBirthday(c);
			l.get(i).setHiredate(d);
		}
		model.addAttribute("yuangong",l);
		return "/pages/wh/empInfo.jsp";
	}
	@RequestMapping("/deleteEmp")
	public String deleteEmp(int id,Model model){
		ym.deleteEmp(id);
		List<Yuangong> list=ym.findAll();
		List<Yuangong> l=list;
		for(int i=0;i<list.size();i++){
			String a=list.get(i).getBirthday();
			String b=list.get(i).getHiredate();
			String c=a.substring(0, 11);
			String d=b.substring(0, 11);
			l.get(i).setBirthday(c);
			l.get(i).setHiredate(d);
		}
		model.addAttribute("yuangong", l);
		return "/pages/wh/empInfo.jsp";
	}
	//职级搜索
	@RequestMapping("/findAllPower")
	public String findAllPower(Model model){
		List<Mode> list=ym.findAllPower();
		model.addAttribute("power", list);
		return "/pages/wh/power.jsp";
	}
	//ajax搜索职级
	@RequestMapping("/searchPower")
	public void searchPower(String name,HttpServletResponse response) throws IOException{
		String str="";
		if(ym.searchPower(name).size()>0){
			str="111";
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	//添加职级
	@RequestMapping("/addPower")
	public String addPower(Mode mode,Model model){
		ym.addPower(mode);
		List<Mode> c=ym.findAllPower();
		model.addAttribute("power", c);
		return "/pages/wh/power.jsp";
	}
	//删除职级
	@RequestMapping("deletePower")
	public String deletePower(String name,Model model){
		int id=ym.searchIdByName(name);
		ym.deleteEmpByPower(id);
		ym.deletePower(name);
		List<Mode> c=ym.findAllPower();
		model.addAttribute("power", c);
		return "/pages/wh/power.jsp";
	}
	//编辑职级
	@RequestMapping("/editPower")
	public String editPower(String name,String name1,Model model){
		ym.editPower(name, name1);
		List<Mode> list=ym.findAllPower();
		model.addAttribute("power",list);
		return "/pages/wh/power.jsp";
	}
}
