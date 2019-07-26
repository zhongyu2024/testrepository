package com.zy.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.bean.CookBook;
import com.zy.bean.Cooktype;
import com.zy.bean.Food;
import com.zy.bean.Materials;
import com.zy.bean.Ycldetaisecond;
import com.zy.bean.ZCaipudetail;
import com.zy.bean.ZcaiLiaoDetail;
import com.zy.service.ZCpService;

@Controller
@RequestMapping("/zcaipu")
public class ZCpAction {
	@Resource
	private ZCpService zcpservice;

	public void setZcpservice(ZCpService zcpservice) {
		this.zcpservice = zcpservice;
	}
	//锟斤拷始锟斤拷息
		@RequestMapping("/ininfo")
		public String ininfo(Model model,@RequestParam(defaultValue="1")int no)throws Exception{
			//锟斤拷询锟斤拷系
			List<Cooktype> caixi = zcpservice.findcaipustyle();
			//锟斤拷询锟剿碉拷
		      List<Food> caidang = zcpservice.findfood(no);
		      //System.out.println(caidang.get(0).getName()+"------------"+caidang.get(0).getPrice());
		      List<ZCaipudetail> cdet = zcpservice.findAllcshi(no);
		      System.out.println("cailiao");
		    //锟斤拷锟斤拷锟斤拷械牟锟斤拷锟�
//		      List<Ycldetaisecond> clsecond = zcpservice.findAllycee();
//		      model.addAttribute("clsecond",clsecond);
		      model.addAttribute("cdetail",cdet);
		      model.addAttribute("cdAll",caidang);
			model.addAttribute("cxAll",caixi);
			model.addAttribute("no",no);
			return "/pages/zj/caipu.jsp";
		}
        //锟斤拷锟揭诧拷系锟斤拷应锟斤拷品
		@RequestMapping("/findfoodcd")
		public String findfoodcd(String cxname,Model model,@RequestParam(defaultValue="1")int no)throws Exception{
			  List<Food> cxfood = zcpservice.findfoodc(cxname, no);
		    model.addAttribute("cdfood",cxfood);
			model.addAttribute("no",no);
			return "/pages/zj/caipinajax.jsp";
		}
		//锟斤拷锟揭诧拷品锟斤拷应锟斤拷锟斤拷
		@RequestMapping("/findallycl")
		public String findallycl(String yclname,Model model,@RequestParam(defaultValue="1")int no)throws Exception{
			//System.out.println("jinru safaslgjs ");
			 List<ZCaipudetail> clfood = zcpservice.findAllcl(yclname, no);
			 /*if(clfood.size()==0)//锟侥憋拷状态
				{
					zcpservice.updatepushi2(yclname);
				}*/
		    model.addAttribute("yclfood",clfood);
			model.addAttribute("no",no);
			//System.out.println(clfood.size()+"+++++++++++++++++++");
			return "/pages/zj/caipuajax.jsp";
		}
		
		//锟斤拷锟斤拷选锟斤拷锟斤拷希锟絀D/NAME锟斤拷
		@RequestMapping("/chaxuncp")
		public String chaxuncp(String caiming,String caipty,String zhi,@RequestParam(defaultValue="1")int no,Model model)throws Exception
		{
			
			List<ZcaiLiaoDetail> caiputu;
			//锟斤拷询 
			if(caipty.equals("编号")){
				 
				   caiputu = zcpservice.tiaojiancaipuInfoId(caiming,zhi);
				 //System.out.println("-------------"+caiputu.size()); 
			}
			else{
				caiputu =zcpservice.tiaojiancaipuInfoName(caiming,zhi, no);  
			}
			model.addAttribute("caiputiao",caiputu);
			model.addAttribute("no", no);
			return "/pages/zj/tiaojian.jsp";	
		}
		//为锟斤拷前锟斤拷品锟斤拷锟皆拷锟斤拷锟絚aibianhao clbianhao shuliang beizhuwarning
		@RequestMapping("/nowcaipuyc")
		public String nowcaipuyc(String cdbiem,Integer caibianhao,Integer clbianhao,double shuliang,@RequestParam(defaultValue="1")int no,Model model)throws Exception
		{
			//System.out.println(1);
			CookBook cchicken=new CookBook(0,caibianhao,clbianhao,shuliang);
			zcpservice.addcaipushicai(cchicken);
			zcpservice.updatepushi(cdbiem);
			List<ZCaipudetail> clfood = zcpservice.findAllcl(cdbiem, no);
			/*if(clfood.size()==0)//锟侥憋拷状态
			{
				zcpservice.updatepushi2(cdbiem);
			}*/
		    model.addAttribute("yclfood",clfood);
			model.addAttribute("no", no);
			return "/pages/zj/caipuajax.jsp";
		}
		//删锟斤拷说牟锟斤拷锟斤拷浞�删锟斤拷之锟斤拷锟斤拷锟缴撅拷辏拷透谋锟阶刺�
		@RequestMapping("/delecaipuyuancl")
		public String delecaipuyuancl(int ccpuid,String cmdsa,Model model,@RequestParam(defaultValue="1")int no)throws Exception{
			System.out.println("锟斤拷锟斤拷删锟斤拷");
			zcpservice.delecaipuycl(ccpuid);
			List<ZCaipudetail> clfood = zcpservice.findAllcl(cmdsa, no);
			/*if(clfood.size()==0)//锟侥憋拷状态
			{
				zcpservice.updatepushi2(cmdsa);
			}*/
			model.addAttribute("yclfood",clfood);  
			model.addAttribute("no",no);
			return "/pages/zj/caipuajax.jsp";
		}
		//锟睫改碉拷前锟斤拷品锟斤拷锟皆拷锟斤拷锟絚aibianhao clbianhao shuliang beizhuwarning
				@RequestMapping("/xiugaicaipuyc")
				public String xiugaicaipuyc(String cdbiem,int id,Integer caibianhao,Integer clbianhao,double shuliang,@RequestParam(defaultValue="1")int no,Model model)throws Exception
				{
					//System.out.println(1);
				   //System.out.println(shuliang);
					CookBook cchickenr=new CookBook(id,caibianhao,clbianhao,shuliang);
					System.out.println(cchickenr.getId()+"333333"+cchickenr.getNum());
					zcpservice.xiugai(cchickenr);
					zcpservice.updatepushi(cdbiem);
					List<ZCaipudetail> clfood = zcpservice.findAllcl(cdbiem, no);
					 for(ZCaipudetail s:clfood)
					 {
						 System.out.println(s.getNum());
					 }
				    model.addAttribute("yclfood",clfood);
					model.addAttribute("no", no);
					return "/pages/zj/caipuajax.jsp";
				}
		
				@RequestMapping("/kongbai")
				public String kongbai(Model model,@RequestParam(defaultValue="1")int no)throws Exception{
					System.out.println("kongbai");
					return "/pages/zj/empty.jsp";
				}
				@RequestMapping("/genxinzhaugntai")
				public String genxinzhaugntai(String cmdsa,String caixi,Model model,@RequestParam(defaultValue="1")int no)throws Exception{
					System.out.println("kongbai");
					List<ZCaipudetail> clfood = zcpservice.findAllcl(cmdsa, no);
					if(clfood.size()==0)//锟侥憋拷状态
					{
						zcpservice.updatepushi2(cmdsa);
					}
					 model.addAttribute("yclfood",clfood);
					 List<Food> cxfood = zcpservice.findfoodc(caixi, no);
					    model.addAttribute("cdfood",cxfood);
					return "/pages/zj/caipinajax.jsp";
				}
				
				
				
				@RequestMapping("/genxinzhaugntai2")
				public String genxinzhaugntai2(String cmdsa,String caixi,Model model,@RequestParam(defaultValue="1")int no)throws Exception{
					System.out.println("kongbai");
					List<ZCaipudetail> clfood = zcpservice.findAllcl(cmdsa, no);
					if(clfood.size()!=0)//锟侥憋拷状态
					{
						zcpservice.updatepushi(cmdsa);
					}
					 model.addAttribute("yclfood",clfood);
					 List<Food> cxfood = zcpservice.findfoodc(caixi, no);
					    model.addAttribute("cdfood",cxfood);
					return "/pages/zj/caipinajax.jsp";
				}
				 
		 
				//锟斤拷锟铰诧拷锟斤拷)
				@RequestMapping("/latelypuyuancll")
				public String latelypuyuancll(int cmid,Model model)throws Exception{
					List<Ycldetaisecond> sdfd = zcpservice.dately(cmid);
					//System.out.println(sdfd.get(0).getCln());
					model.addAttribute("fd", sdfd);
					return "/pages/zj/chicailately.jsp";
				}
				//锟睫改革拷锟铰诧拷锟斤拷
				@RequestMapping("/latelypuyuancxll")
				public String latelypuyuancxll(int cmid,Model model)throws Exception{
					List<Ycldetaisecond> sdfd = zcpservice.dately(cmid);
					//System.out.println(sdfd.get(0).getCln());
					model.addAttribute("fd", sdfd);
					return "/pages/zj/xiugaide.jsp";
				}
		  
		
//		@RequestMapping("/caidetail")
//		public String caidetail(String name,Model model,@RequestParam(defaultValue="1")int no)throws Exception{
//			List<ZCaipudetail> caidetail_1 = zcpservice.findAllcl(name,no);
//		    model.addAttribute("cp_detail",caidetail_1);
//			model.addAttribute("no",no);
//			return "/pages/zj/caipuajax.jsp";
//		}
		
}
