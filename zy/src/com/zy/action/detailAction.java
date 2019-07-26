package com.zy.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.bean.Giver;
import com.zy.bean.ZInfo;
import com.zy.bean.ZOutinfo;
import com.zy.bean.ZSearch;
import com.zy.bean.Zkun;
import com.zy.service.detailService;

@Controller
@RequestMapping("/detail")
public class detailAction {
	@Resource 
	private detailService detailService;

	public void setDetailService(detailService detailService) {
		this.detailService = detailService;
	}
	//显示所有进出明细信息
	@RequestMapping("/inouttableAll")
	public String inouttableAll(Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		//所有供应商
		List<Zkun> detail;
		System.out.println("进行查表");
		List<Zkun> detailinfo=new ArrayList<Zkun>();
		List<ZInfo> into = detailService.ZinDetail();
		List<ZOutinfo> outinfo = detailService.ZouDtail();
		for(ZInfo comi:into){
			detailinfo.add(new Zkun(comi.getCkname(),comi.getTimeall(),comi.getClname(),comi.getClid(),comi.getLxname(),comi.getCount(),comi.getDwname(),0));
		}
		for(ZOutinfo omui:outinfo)
		{
	     detailinfo.add(new Zkun(omui.getCkname(),omui.getTimeall(),omui.getClname(),omui.getClid(),omui.getLxname(),omui.getCount(),omui.getDwname(),1));
		} 
		 //System.out.println(detailinfo.get(0).getCkname()+"++++++++++++");
		 if(detailinfo.size()==1)
		 {
			 detail =detailinfo;  
		 }
		 else{ 
			 detail= detailinfo.subList(detailinfo.size()*(page-1)+1, page*detailinfo.size());  
		 } 
		 //System.out.println(detail.get(0).getCkname()+"+++++++++++++");
		 int cnum=detailinfo.size()/18;
		 if(detailinfo.size()%18!=0){
				cnum=cnum+1;
			}
		model.addAttribute("allInfo",detail);
		model.addAttribute("page", page);
		model.addAttribute("zy", cnum);
		return "/pages/zj/detail.jsp";
	}
	   
	@RequestMapping("/tiaochaxun")
	public String tiaochaxun(String ach,String zhi,String time1,String time2,Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		//所有条件 材料编号 材料名称 仓库 入库日期 出库日期 操作类型
		System.out.println("1");
		String chose="";
		List<ZInfo> detailc;
		List<ZOutinfo> detailc1;
		List<Zkun> detail;
		
		if(ach.equals("操作类型"))
		{
			 if(zhi.equals("入库"))//所有入库信息
			 {
				 System.out.println("1");
				 ZSearch aca1= new ZSearch(time1,time2,chose,zhi); 
				 List<ZInfo> checo = detailService.choseinn(aca1);
				 System.out.println(time1+time2);
				 if(checo.size()==0)
					 return "/pages/zj/erro.jsp";	
				 if(checo.size()==1)
				 {
					 detailc =checo;  
				 }
				 else{
					 detailc = checo.subList(checo.size()*(page-1)+1, page*checo.size());
				 }
				 int cnum=checo.size()/18;
				 if(checo.size()%18!=0){
						cnum=cnum+1;
					}
				  
					model.addAttribute("page", page);
					model.addAttribute("zy", cnum);
					model.addAttribute("allInfo",detailc);  
				 return "/pages/zj/detailajax.jsp";
			 }
			 else{
				 System.out.println("1");
				 ZSearch aca2= new ZSearch(time1,time2,chose,zhi); 
				 List<ZOutinfo> checo = detailService.choseoutt(aca2);
				 if(checo.size()==0)
					 return "/pages/zj/erro.jsp";
				 if(checo.size()==1)
				 {
					 detailc1 =checo;  
				 }
				 else{
					 detailc1 = checo.subList(checo.size()*(page-1)+1, page*checo.size());
				 }
				 int cnum=checo.size()/18;
				 if(checo.size()%18!=0){
						cnum=cnum+1;
					}
				 model.addAttribute("page", page);
					model.addAttribute("zy", cnum);
					model.addAttribute("allInfo",detailc1);  
				 return "/pages/zj/detailajax.jsp";	
				 }
		}
		else{
			if(ach.equals("材料编号"))
			{
				chose="clid"; 	
			}
			if(ach.equals("材料名称"))
			{
				chose="clname";
			}
			if(ach.equals("仓库"))
			{
				chose="ckname";
			}
			
			
			
			System.out.println("zo");
			ZSearch aca= new ZSearch(time1,time2,chose,zhi);
			List<ZInfo> checi = detailService.chosein(aca);
			//System.out.println("+++++++++++++++++++"+chose);
			List<ZOutinfo> checo = detailService.choseout(aca);
			//System.out.println("+++++++++++++++++++"+chose);
			List<Zkun> detailinfo=new ArrayList<Zkun>();
			for(ZInfo ci:checi){
				detailinfo.add(new Zkun(ci.getCkname(),ci.getTimeall(),ci.getClname(),ci.getClid(),ci.getLxname(),ci.getCount(),ci.getDwname(),0));
			}
			for(ZOutinfo c2:checo){
				detailinfo.add(new Zkun(c2.getCkname(),c2.getTimeall(),c2.getClname(),c2.getClid(),c2.getLxname(),c2.getCount(),c2.getDwname(),1));
			} 
			System.out.println(detailinfo.size()+"+++++++++++++++"+detailinfo.get(0).getCkname());
			if(detailinfo.size()==0)
				return "/pages/zj/erro.jsp";
			if(detailinfo.size()==1)
			 {
				  detail = detailinfo;  
			 }
			else{
				  detail = detailinfo.subList(detailinfo.size()*(page-1)+1, detailinfo.size()*page);
				
			}
			 int cnum=detailinfo.size()/18;
			 if(detailinfo.size()%18!=0){
					cnum=cnum+1;
				}
			 model.addAttribute("page", page);
				model.addAttribute("zy", cnum);
			model.addAttribute("allInfo",detail);
			return "/pages/zj/detailajax.jsp";
			
			
			
			
			
			
			
		}
		
	}
	
	
	
	
	
	
}
