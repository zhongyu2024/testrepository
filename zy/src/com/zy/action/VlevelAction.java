package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zy.bean.Vlevel;
import com.zy.service.VipService;
import com.zy.service.VlevelService;
@Controller
@RequestMapping("vip")
public class VlevelAction {
	@Resource
	private VlevelService vlevelservice;
	public void setVlevelservice(VlevelService vlevelservice) {
		this.vlevelservice = vlevelservice;
	}
	@Resource
	private VipService vipservice;
	public void setVipservice(VipService vipservice) {
		this.vipservice = vipservice;
	}
	
	@RequestMapping("m")
	public String findAllLevel(HttpServletRequest req){
		System.out.println("进入findAllLevel");
		List<Vlevel> les=vlevelservice.findAllLevel();
		req.setAttribute("les", les);
		System.out.println("进入findPagenum");
		int p= vipservice.findPagenum();
		int p1=p/10;
		req.setAttribute("pageNum", p1);
		System.out.println(p);
		return "/pages/lw/vipmanage.jsp";
	}
	@RequestMapping("ms")
	public String findLevels(HttpSession req){
		System.out.println("进入findLevels");
		List<Vlevel> vs=vlevelservice.findAllLevel();
		int id=vipservice.findLast();
		req.setAttribute("vs", vs);
		req.setAttribute("id", id);
		System.out.println(id);
		return "redirect:/pages/lw/vip.jsp";
	}
	@RequestMapping("add")
	public String addLevel(Vlevel level,HttpSession session,HttpServletRequest request)throws Exception{
		System.out.println("进入addLevel方法");
		request.setCharacterEncoding("UTF-8");
		String name = java.net.URLDecoder.decode(request.getParameter("name"), "utf-8");//解码
		level.setName(name);
		vlevelservice.addLevel(level);
		System.out.println(level.getName());
		System.out.println(level.getCount());
		System.out.println(level.getMoney());
		return "redirect:/vip/m.do";
	}
	@RequestMapping("delle")
	public String delLevel(int id){
		System.out.println("进入delLevel");
		vlevelservice.delLevel(id);
		return "redirect:/vip/m.do";
		
	}
	@RequestMapping("xiu")
	public String xiuLevel(Vlevel v){
		System.out.println("进入xiuLevel");
		System.out.println(v.getName());
		vlevelservice.xiuLevel(v);
		return "redirect:/vip/m.do";
	}
	@RequestMapping("money")
	public void queryMoney(int id,HttpServletResponse res) throws IOException{
		System.out.println("进入queryMoney");
		double money = vlevelservice.queryMoney(id);
		res.setContentType("html");
		res.setCharacterEncoding("utf-8");
		PrintWriter out = res.getWriter();
		out.print(money);
		out.flush();
		out.close();
		
		//req.setAttribute("money", money);
		
		//return "/pages/lw/vipmanage.jsp";
	}
	
}
