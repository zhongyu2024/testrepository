package com.zy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Waitnum;
import com.zy.dao.mapper.whCanpaiMapper;


@Controller
@RequestMapping("/whCanPai")
public class whCanPaiAction {
	@Resource
	private whCanpaiMapper wcp;
	public void setWcp(whCanpaiMapper wcp) {
		this.wcp = wcp;
	}
	@RequestMapping("/showCanPai")
	public String showCanPai(Model model)throws Exception{
		List<Waitnum> canpai=wcp.findAllCanPai();
		//System.out.println(canpai.size());
		model.addAttribute("canpai",canpai);
		return "/pages/wh/canpai.jsp";
	}
	@RequestMapping("/addCanpai")
	public String addCanpai(Model model,Waitnum waitnum)throws Exception{
//		if(wcp.addCanpai(waitnum)){
		//wcp.addCanpai(waitnum);
		wcp.addCanpai(waitnum);
		return "/whCanPai/showCanPai.do";
		//}
	}
	@RequestMapping("/deleteCanpai")
	public String deletecanpai(Model model,HttpServletRequest req)throws Exception{
		//System.out.println("ddddddddddddddddd");
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		wcp.deleteCanpai(id);
		return "/whCanPai/showCanPai.do";
	}
}
