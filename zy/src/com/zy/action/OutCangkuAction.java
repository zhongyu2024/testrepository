package com.zy.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.bean.Cailiao;
import com.zy.bean.Cangku;
import com.zy.bean.Cangkucun;
import com.zy.bean.CangkucunSearch;
import com.zy.bean.Emp;
import com.zy.bean.InCangku;
import com.zy.bean.OutCailiao;
import com.zy.bean.OutCangku;
import com.zy.service.OutCangkuService;

@Controller
@RequestMapping("/outCangku")
public class OutCangkuAction {
	@Resource
	private OutCangkuService ocks;

	public void setOcks(OutCangkuService ocks) {
		this.ocks = ocks;
	}
	
	List<Cangkucun> ckc=new ArrayList<Cangkucun>();
	String bianma="";
	String date3 = "";
	int num=10001;


	@RequestMapping("/showByPage")
	public String showByPage(Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		List<OutCangku> oc=ocks.findAllByPage(page);
		int zy=ocks.findAllOC()/20;
		if(ocks.findAllOC()%20!=0){
			zy=zy+1;
		}
		model.addAttribute("zy", zy);
		model.addAttribute("page", page);
		model.addAttribute("oc", oc);
		
		return "/pages/sjl/outck.jsp";
	}
	/*点击确认*/
	@RequestMapping("/addCangkucun")
	public String addCangkucun(Model model,@RequestParam(defaultValue="1")int page,
			String id,int cangkuid,String outtime,int doman,String info)throws Exception{
		System.out.println(id+"--"+cangkuid+"--"+outtime+"--"+doman+"--"+info);
		OutCangku ockk=new OutCangku(id, cangkuid, null, outtime, doman, null, info);
		ocks.addNewCk(ockk);
		
		for(Cangkucun cc:ckc){
			if(ocks.searchKkucun(cc.getMaterialsid())==0)
			{
				ocks.addKkucun(cc.getMaterialsid(), cc.getNum());
			}else{
				ocks.updateKkucun(cc.getMaterialsid(), cc.getNum());
			}
		}
		
		ckc=new ArrayList<Cangkucun>();
		List<OutCangku> oc=ocks.findAllByPage(page);
		model.addAttribute("oc", oc);
		int zy=ocks.findAllOC()/20;
		if(ocks.findAllOC()%20!=0){
			zy=zy+1;
		}
		
		model.addAttribute("zy", zy);
		model.addAttribute("page", page);
		return "/pages/sjl/ztableAjax.jsp";
	}
	
	/*点击放弃*/
	@RequestMapping("/deleteOutCailao")
	public String deleteOutCailao(Model model,@RequestParam(defaultValue="1")int page,String ckid)throws Exception{
		ocks.deleteByCkid(ckid);
		for(Cangkucun cc:ckc){
			Cangkucun ck=new Cangkucun(cc.getCangkuid(), cc.getMaterialsid(), -cc.getNum());
			ocks.updateCangkucun(ck);
		}
		ckc=new ArrayList<Cangkucun>();
		List<OutCangku> oc=ocks.findAllByPage(page);
		int zy=ocks.findAllOC()/20;
		if(ocks.findAllOC()%20!=0){
			zy=zy+1;
		}
		model.addAttribute("zy", zy);
		model.addAttribute("page", page);
		model.addAttribute("oc", oc);
		
		return "/pages/sjl/ztableAjax.jsp";
	}
	
	
	
	/*点击添加按钮后ajax*/
	@RequestMapping("/tianjiaajax")
	public String tianjiaajax(Model model)throws Exception{
		SimpleDateFormat sff=new SimpleDateFormat("yyyyMMdd");
		Date date2=new Date();
		String date21=sff.format(date2);
		
		if(!(date3.equals(date21))){
			date3=date21;
			num=10001;
		}else{
			do{
				/*System.out.println("****"+num);*/
				bianma="ck"+date21+num;
				if(ocks.findById(bianma)!=null){
				num+=1;}
			}while(ocks.findById(bianma)!=null);
			/*if(incks.findById(bianma)!=null)
			{
				num+=1;
			}*/
			
		}
		/*bianma="rk"+date3+num;*/
		System.out.println(bianma);
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1=new Date();
		String date11=sf.format(date1);
		/*System.out.println(date11);*/
		
		List<Emp> emp =ocks.findAllEmp();
		List<Cangku> ck=ocks.findAllCangku();
		
		model.addAttribute("date11", date11);
		model.addAttribute("bianma",bianma);
		model.addAttribute("emp", emp);
		model.addAttribute("ck", ck);
/*
		int zy=ocks.findAllOC()/20;
		if(ocks.findAllOC()%20!=0){
			zy=zy+1;
		}
		model.addAttribute("zy", zy);
		model.addAttribute("page", 1);*/
		
		return "/pages/sjl/tianjiaajax.jsp";
	}
	
	@RequestMapping("/cailiaoAjax")
	public String cailiaoAjax(Model model,@RequestParam(defaultValue="1")int page,int ckid)throws Exception{
		List<Cailiao> cl=ocks.findcailiao(page, ckid);
		System.out.println(cl.size());
		int zy1=ocks.findCL(ckid)/20;
		if(ocks.findCL(ckid)%20!=0){
			zy1=zy1+1;
		}
		model.addAttribute("zy1", zy1);
		model.addAttribute("page1", page);
		model.addAttribute("cl", cl);
		return "/pages/sjl/cailiaoAjax.jsp";
	}
	
	@RequestMapping("/tankuang")
	public String tankuang(Model model,String id)throws Exception{
		List<OutCailiao> cl=ocks.findByCkid(id);
		OutCangku ck=ocks.findById1(id);
		model.addAttribute("cl", cl);
		model.addAttribute("ck", ck);
		return "/pages/sjl/tankuangajax1.jsp";
	}
	
	
	
	@RequestMapping("/cailiaoByType")
	public String cailiaoByType(Model model,@RequestParam(defaultValue="1")int page,int ckid,int tt,String text)throws Exception{
		List<Cailiao> cl;
		CangkucunSearch cks;
		int zy;
		if(tt==0){
			cl=ocks.findcailiao(page, ckid);
			zy=ocks.findCL(ckid);
		}else{
			String type="name";
			if(tt==2){
				type="mtypename";
			}
			
			cks=new CangkucunSearch(type, text, page, ckid);
			cl=ocks.findByType(cks);
			zy=ocks.findCLT(cks);
		}
		int zy1=zy/20;
		if(zy%20!=0){
			zy1=zy1+1;
		}
		
		/*CangkucunSearch cks=new CangkucunSearch(type, text, page, ckid);*/
		/*cl=ocks.findcailiao(page, ckid);*/
		/*System.out.println(cl.size());*/
		
		model.addAttribute("zy1", zy1);
		model.addAttribute("page1", page);
		
		model.addAttribute("cl", cl);
		return "/pages/sjl/cailiaoAjax.jsp";
	}
	
	@RequestMapping("/mingxiAjax")
	public String mingxiAjax(Model model,int ckid,String outckid,int num,Integer materialsid,@RequestParam(defaultValue="1")int type,@RequestParam(defaultValue="0")int mid)throws Exception{
		System.out.println(materialsid+"---"+num+"---"+outckid+"---"+ckid+"---"+mid);
		if(type==1){
		OutCailiao ocl=new OutCailiao(materialsid, num, outckid);
		ocks.addNewCl(ocl);
		Cangkucun ck=new Cangkucun(ckid, materialsid, num);
		ckc.add(ck);
		ocks.updateCangkucun(ck);
		}else{
			Cangkucun ck=new Cangkucun(ckid, materialsid, -num);
			ckc.add(ck);
			ocks.updateCangkucun(ck);
			ocks.deleteNewCl(mid);
		}
		
		List<OutCailiao> cck=ocks.findByCkid(outckid);
		System.out.println(cck.size());
		model.addAttribute("cck", cck);
		return "/pages/sjl/mingxiAjax.jsp";
	}
	
	
	@RequestMapping("/ajaxsearch")
	public String ajaxsearch(Model model,String time1,String time2,int tt,String text,
			@RequestParam(defaultValue="1")int page)throws Exception{
		System.out.println("***-"+time1+"***-"+time2+"***-"+tt+"***-"+text);
		List<OutCangku> oc;
		String type="";
		CangkucunSearch cs;
		int zy;
		if(tt==0&&time1.length()==0){
			oc=ocks.findAllByPage(page);
			zy=ocks.findAllOC()/20;
		}else{
			if(tt==1){
				type="id";
			}
			if(tt==2){
				type="ckname";
			}
			if(tt==3){
				type="doname";
			}
			if(time1.length()>0&&text.length()>0){
				System.out.println("111");
				cs=new CangkucunSearch(type, text, time1, time2, page);
				oc=ocks.selectAll(cs);
				zy=ocks.selectAllOC(cs)/20;
			}else if(time1.length()>0&&text.length()==0){
				System.out.println("222");
				cs=new CangkucunSearch(type, text, time1, time2, page);
				oc=ocks.selectTime(cs);
				zy=ocks.selectTimeOC(cs)/20;
			}else{
				System.out.println("333");
				cs=new CangkucunSearch(type, text, time1, time2, page);
				oc=ocks.selectType(cs);
				zy=ocks.selectTypOC(cs)/20;
			}
		}
		System.out.println(oc.size());
		
		if(ocks.findAllOC()%20!=0){
			zy=zy+1;
		}
		model.addAttribute("zy", zy);
		model.addAttribute("page", page);
		model.addAttribute("oc", oc);
		return "/pages/sjl/ztableAjax.jsp";
	}
	
	
	
	
	
	
	
	
	
}
