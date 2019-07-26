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
import com.zy.bean.Giver;
import com.zy.bean.InCailiao;
import com.zy.bean.InCangku;
import com.zy.service.InCangkuService;

@Controller
@RequestMapping("/Incangku")
public class InCangkuAction {
	
	@Resource
	private InCangkuService incks;

	public void setIncks(InCangkuService incks) {
		this.incks = incks;
	}
	List<Cangkucun> ckc=new ArrayList<Cangkucun>();
	String bianma="";
	String date3 = "";
	int num=10001;
	/*进入首页*/
	@RequestMapping("/showAll")
	public String showAll(Model model)throws Exception{
		List<Emp> emp=incks.findAllEmp();
		List<Giver> giver= incks.findAllGiver();
		List<Cangku> ck=incks.findAllCangku();
		List<InCangku> inck=incks.findByPage(1);
		List<Cailiao> cailiao=incks.findCailiao(1);
		int page=1;
		int zy=incks.findP()/20;
		if(incks.findP()%20!=0){
			zy=zy+1;
		}
		int zy1=incks.findAll()/20;
		if(incks.findAll()%20!=0){
			zy1=zy1+1;
		}
		model.addAttribute("page", page);
		model.addAttribute("zy", zy);
		model.addAttribute("zy1", zy1);
		model.addAttribute("page1", page);
		model.addAttribute("emp", emp);
		model.addAttribute("giver", giver);
		model.addAttribute("ck", ck);
		model.addAttribute("inck", inck);
		model.addAttribute("cailiao", cailiao);
	
		return "/pages/sjl/inck.jsp";
	}
	/*点击增加按钮的ajax*/
	@RequestMapping("/tianjia")
	public String tianjia(Model model)throws Exception{
		
		SimpleDateFormat sff=new SimpleDateFormat("yyyyMMdd");
		Date date2=new Date();
		String date21=sff.format(date2);
		
		if(!(date3.equals(date21))){
			date3=date21;
			num=10001;
		}else{
			do{
				/*System.out.println("****"+num);*/
				bianma="rk"+date21+num;
				if(incks.findById(bianma)!=null){
				num+=1;}
			}while(incks.findById(bianma)!=null);
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
		System.out.println(date11);
		
		List<Emp> emp=incks.findAllEmp();
		List<Giver> giver= incks.findAllGiver();
		List<Cangku> ck=incks.findAllCangku();
		
		
		model.addAttribute("bianma", bianma);
		model.addAttribute("date", date11);
		model.addAttribute("emp", emp);
		model.addAttribute("giver", giver);
		model.addAttribute("ck", ck);
		
		return "/pages/sjl/ajaxintt1.jsp";
	}
	/*材料列表的搜索按钮的ajax*/
	@RequestMapping("/cailiaoSearch")
	public String cailiaoSearch(Model model,int type,@RequestParam(defaultValue="1")int page,String text)throws Exception{
		/*System.out.println(type+"--------------"+text);*/
		String typp="";
		List<Cailiao> cailiao=new ArrayList<Cailiao>();
		CangkucunSearch ckcs;
		int zy;
		if(type==0){
		cailiao=incks.findCailiao(page);
		zy=incks.findAll();
		}else{
			if(type==1){
				typp="name";
			}
			if(type==2){
				typp="mtypename";
			}
			ckcs=new CangkucunSearch(typp, text,"","", page);
			cailiao=incks.findCailiaoByType(ckcs);
			zy=incks.findType(ckcs);
		}
		int zy1=zy/20;
		if(zy%20!=0){
			zy1=zy1+1;
		}
		System.out.println(zy1+"(--)"+page);
		System.out.println(cailiao.size());
		model.addAttribute("cailiao", cailiao);
		model.addAttribute("zy1", zy1);
		model.addAttribute("page1", page);
		return "/pages/sjl/ajaxintt2.jsp";
	}
	/*新增材料的确认按钮的ajax*/
	@RequestMapping("/cailiaoAdd")
	public String cailiaoAdd(Model model,int ckid,int id,int number,float money,String cid,@RequestParam(defaultValue="1")int type)throws Exception{
		
		if(type==1)
		{
			System.out.println(ckid+"--------------"+number);
			InCailiao inck1=new InCailiao(0, id, number, money, cid);
			incks.addNewCailia(inck1);
			ckc.add(new Cangkucun(ckid, id, number));
		}else{
			System.out.println("shanchudeyemian");
			System.out.println(id+"**********"+cid);
			incks.deleteById(id);
		}
		
	
		List<InCailiao> clll=incks.findByMid(cid);
		System.out.println(clll.size());
		model.addAttribute("cl", clll);
		
		return "/pages/sjl/ajaxintt3.jsp";
	}
	
	@RequestMapping("/ajaxinck1")
	public String ajaxinck1(Model model,String id,@RequestParam(defaultValue="1")int page)throws Exception{
		/*System.out.println("**********"+id);*/
		
		incks.deleteByMid(id);
		int zy=incks.findP()/20;
		if(incks.findP()%20!=0){
			zy=zy+1;
		}
		List<InCangku> inck=incks.findByPage(1);
		ckc=new ArrayList<Cangkucun>();
		model.addAttribute("inck", inck);
		/*System.out.println("^^^^^"+inck.size());*/
		model.addAttribute("inck", inck);
		model.addAttribute("page",page);
		model.addAttribute("zy", zy);
		return "/pages/sjl/ajaxintt4.jsp";
	}
	
	@RequestMapping("/ajaxinck2")
	public String ajaxinck2(Model model,String id,String intime,int cangkuid,int giverid,int byid,int inid,String info,
			@RequestParam(defaultValue="1")int page)throws Exception{
//		System.out.println("***-"+id+"***-"+intime+"***-"+cangkuid+"***-"+giverid+"***-"+byid+"***-"+inid+"***-"+info);
		InCangku ck=new InCangku(id, cangkuid, intime, giverid,byid,inid, info);
		
		incks.addNewInck(ck);
		
		for(Cangkucun c:ckc){
			System.out.println(c.getCangkuid()+"---"+c.getMaterialsid()+"--"+c.getNum());
			if(incks.findCangkucnByType(c)==null){
				//未找到数据，插入数据
				System.out.println("未找到");
				incks.addNewCangkucun(c);
			}else{
				//找到数据，对其进行更新
				System.out.println("找到");
				incks.updateNewCangkucun(c);
			}
		}
		int zy=incks.findP()/20;
		if(incks.findP()%20!=0){
			zy=zy+1;
		}
		System.out.println("ccc");
		ckc=new ArrayList<Cangkucun>();
		List<InCangku> inck=incks.findByPage(1);
		System.out.println("!!!!!^"+inck.size());
		model.addAttribute("inck", inck);
		model.addAttribute("page",page);
		model.addAttribute("zy", zy);
		return "/pages/sjl/ajaxintt4.jsp";
	}
	
	@RequestMapping("/ajaxsearch")
	public String ajaxsearch(Model model,String time1,String time2,int tt,String text,
			@RequestParam(defaultValue="1")int page)throws Exception{
		System.out.println("***-"+time1+"***-"+time2+"***-"+tt+"***-"+text);
		List<InCangku> ick;
		String type="";
		CangkucunSearch cs;
		int zy;
		if(tt==0&&time1.length()==0){
			ick=incks.findByPage(page);
			zy=incks.findP();
		}else{
			if(tt==1){
				type="id";
			}
			if(tt==2){
				type="ckname";
			}
			if(tt==3){
				type="inman";
			}
			if(time1.length()>0&&text.length()>0){
				System.out.println("111");
				cs=new CangkucunSearch(type, text, time1, time2, page);
				ick=incks.selectAll(cs);
				zy=incks.selectT3(cs);
			}else if(time1.length()>0&&text.length()==0){
				System.out.println("222");
				cs=new CangkucunSearch(type, text, time1, time2, page);
				ick=incks.selectTime(cs);
				zy=incks.selectT1(cs);
			}else{
				System.out.println("333");
				cs=new CangkucunSearch(type, text, time1, time2, page);
				ick=incks.selectType(cs);
				zy=incks.selectT2(cs);
			}
		}
		int zzy=zy/20;
		if(zy%20!=0){
			zzy=zzy+1;
		}
		System.out.println(page+"--"+zzy+"--"+zy);
		System.out.println(ick.size());
		model.addAttribute("inck", ick);
		model.addAttribute("page", page);
		model.addAttribute("zy", zzy);
		return "/pages/sjl/ajaxintt4.jsp";
	}
	
	@RequestMapping("/shuangjiajax")
	public String shuangjiajax(Model model,String id)throws Exception{
		System.out.println("**********"+id);
		InCangku inc=incks.findById2(id);
		List<InCailiao> ic=incks.findByMid(id);
		model.addAttribute("inc", inc);
		model.addAttribute("ic", ic);
		return "/pages/sjl/tankuangajax.jsp";
	}
	
	
}
