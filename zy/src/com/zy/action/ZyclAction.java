package com.zy.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.bean.Giver;
import com.zy.bean.Materials;
import com.zy.bean.Materialstype;
import com.zy.bean.Unit;
import com.zy.bean.ZcaiLiaoDetail;
import com.zy.service.ZyclService;

@Controller
@RequestMapping("/zycl")
public class ZyclAction {
	@Resource 
	private ZyclService zyclservice;

	public void setZyclservice(ZyclService zyclservice) {
		this.zyclservice = zyclservice;
	}
	//����ԭ����Ϣ
	@RequestMapping("/findAllYclInfo")
	public String findAllGiverInfo(Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		List<ZcaiLiaoDetail> cl = zyclservice.findAllcl(page);
		List<Materialstype> clstyle = zyclservice.findAllscstyle(); 
		model.addAttribute("stylec",clstyle);
		List<Unit> cldanwei = zyclservice.findAllscdanwei();
		model.addAttribute("danweic",cldanwei);
		
		 
		 int cnum=zyclservice.findAllc()/18;
		 if(zyclservice.findAllc()%18!=0){
				cnum=cnum+1;
			}
		 
			model.addAttribute("page", page);
			model.addAttribute("zy", cnum);
		model.addAttribute("yclAll",cl);
		return "/pages/zj/ycl.jsp";
	}
	//���ԭ����
	@RequestMapping("/addGiverInfo")
	public String addGiverInfo(String lxname,String cpname,String danweiname,String cailinfo, Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		 ZcaiLiaoDetail ycldetail=new ZcaiLiaoDetail(0,lxname,cpname,danweiname,cailinfo);
		  zyclservice.addYcl(ycldetail); 
		  List<ZcaiLiaoDetail> cl = zyclservice.findAllcl(page);
			 int cnum=zyclservice.findAllc()/18;
			 if(zyclservice.findAllc()%18!=0){
					cnum=cnum+1;
				} 
				model.addAttribute("page", page);
				model.addAttribute("zy", cnum); 
			model.addAttribute("yclAll",cl); 
		 return "/pages/zj/yclajx.jsp";
	}
	//ɾ��ԭ����
	@RequestMapping("/deleyclInfo")
	public String deleyclInfo(int id, Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		   zyclservice.deleYcl(id); 
		   List<ZcaiLiaoDetail> cl = zyclservice.findAllcl(page);
			 int cnum=zyclservice.findAllc()/18;
			 if(zyclservice.findAllc()%18!=0){
					cnum=cnum+1;
				} 
				model.addAttribute("page", page);
				model.addAttribute("zy", cnum); 
			model.addAttribute("yclAll",cl); 
		 return "/pages/zj/yclajx.jsp";
	}
	//�޸�ԭ����
	@RequestMapping("/xiugaiclInfo")
	public String xiugaiclInfo(int clid,String lxname,String cpname,String danweiname,String cailinfo,Model model,@RequestParam(defaultValue="1")int page)throws Exception{
		ZcaiLiaoDetail yclxuigai=new ZcaiLiaoDetail(clid,lxname,cpname,danweiname,cailinfo);   
		zyclservice.xiugaiclInfo(yclxuigai); 
		List<ZcaiLiaoDetail> cl = zyclservice.findAllcl(page);
		 int cnum=zyclservice.findAllc()/18;
		 if(zyclservice.findAllc()%18!=0){
				cnum=cnum+1;
			} 
			model.addAttribute("page", page);
			model.addAttribute("zy", cnum); 
			model.addAttribute("yclAll",cl); 
		 return "/pages/zj/yclajx.jsp";
	}
	//��������ѯԭ������Ϣ
	@RequestMapping("/chaxun")
	public String chaxun(String typeycl,String zhi,@RequestParam(defaultValue="1")int page,Model model)throws Exception
	{   int cnum;
		System.out.println("�����ѯ");
		List<ZcaiLiaoDetail> listycl;
		//��ѯ  
		if(zhi.length()==0){
			   listycl = zyclservice.findAllcl(page);
			    cnum=zyclservice.findAllc()/18;
			 if(zyclservice.findAllc()%18!=0){
					cnum=cnum+1;
				}   
		}else{
			if(typeycl.equals("编号")){
				 
				  listycl = zyclservice.tiaojianyclInfoId(zhi,page);
				        cnum=zyclservice.tiaojianyclInfoIdCount(zhi)/18;
				        if(zyclservice.tiaojianyclInfoIdCount(zhi)%18!=0){
							cnum=cnum+1;
						}   
			}
			else{
				 listycl = zyclservice.tiaojianyclInfoName(zhi,page);
				 cnum=zyclservice.tiaojianyclInfoNameCount(zhi)/18;
				 System.out.println("++++++++++"+zyclservice.tiaojianyclInfoNameCount(zhi));
				 System.out.println(cnum);
				 if(zyclservice.tiaojianyclInfoNameCount(zhi)%18!=0){
						cnum=cnum+1;
					} 
			} 
		}
			model.addAttribute("page", page);
			model.addAttribute("zy", cnum);   
		    model.addAttribute("yclAll",listycl);
		return "/pages/zj/yclajx.jsp";
	}
//	//��ѯ������Ϣ
//	@RequestMapping("/findAllYclstyle")
//	public String findAllYclstyle(Model model)throws Exception{
//		List<Materialstype> clstyle = zyclservice.findAllscstyle(); 
//		model.addAttribute("stylec",clstyle);
//		return "/pages/zj/lxajax.jsp";
//	}
//	//��ѯ��λ��Ϣ
//	@RequestMapping("/findAllYcdanwei")
//	public String findAllYcdanwei(Model model)throws Exception{
//		List<Unit> cldanwei = zyclservice.findAllscdanwei();
//		model.addAttribute("danweic",cldanwei);
//		return "/pages/zj/ycl.jsp";
//	}
//	 
	
	//�������
	@RequestMapping("/addleixing")
	public void addleixing(String lxiname,Model model)throws Exception{
		 
		zyclservice.addleixing(lxiname);
	}
	//��ӵ�λ
		@RequestMapping("/addddanwei")
		public void addddanwei(String danweiname,Model model)throws Exception{
			zyclservice.adddangwei(danweiname);
		}
	
	
		@RequestMapping("/findAtt")
		public String findAtt(Model model,@RequestParam(defaultValue="1")int page)throws Exception{
			//���й�Ӧ��
			 System.out.println(page+"+++++++++++++++�����鿴ȫ��");
			 List<ZcaiLiaoDetail> cl = zyclservice.findAllcl(page);
			 int cnum=zyclservice.findAllc()/18;
			 if(zyclservice.findAllc()%18!=0){
					cnum=cnum+1;
				} 
				model.addAttribute("page", page);
				model.addAttribute("zy", cnum);
			 model.addAttribute("yclAll", cl);
			return "/pages/zj/yclajx.jsp";
		}
		
		@RequestMapping("/addcailiaomming")
		public void addcailiaomming(String name,Model model,HttpServletResponse response)throws Exception{
			int ck=1;
			List<Materials> se = zyclservice.chazhaochongmign(name);
			if(se.size()==0)
				ck=0;
			JSONArray js = JSONArray.fromObject(ck);
			System.out.println(js.toString());
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json");
			PrintWriter out = response.getWriter();
			out.write(js.toString());
			out.flush();
			out.close();
			
		}
		@RequestMapping("/chongmaddleixing")
		public void chongmaddleixing(String name,Model model,HttpServletResponse response)throws Exception{
			int ck=1;
			  List<Materialstype> sek = zyclservice.chazmetype(name);
			if(sek.size()==0)
				ck=0;
			JSONArray js = JSONArray.fromObject(ck);
			System.out.println(js.toString());
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json");
			PrintWriter out = response.getWriter();
			out.write(js.toString());
			out.flush();
			out.close();
			
		}
		@RequestMapping("/chongdanwei")
		public void chongdanwei(String name,Model model,HttpServletResponse response)throws Exception{
			int ck=1;
			   List<Unit> sek = zyclservice.chazmdangwei(name);
			if(sek.size()==0)
				ck=0;
			JSONArray js = JSONArray.fromObject(ck);
			System.out.println(js.toString());
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/json");
			PrintWriter out = response.getWriter();
			out.write(js.toString());
			out.flush();
			out.close();
			
		}
		@RequestMapping("/updateleix")
		public String updateleix(Model model)throws Exception{
			//���й�Ӧ��
			List<Materialstype> clstyle = zyclservice.findAllscstyle(); 
			model.addAttribute("stylec",clstyle);
			return "/pages/zj/momo.jsp";
		}
		@RequestMapping("/updateleixx")
		public String updateleixx(Model model)throws Exception{
			//���й�Ӧ��
			System.out.println("进入党委");
			List<Unit> cldanwei = zyclservice.findAllscdanwei();
			model.addAttribute("danweic",cldanwei);
			return "/pages/zj/momo1.jsp";
		}
		
		@RequestMapping("/updateleix1")
		public String updateleix1(Model model)throws Exception{
			//���й�Ӧ��
			List<Materialstype> clstyle = zyclservice.findAllscstyle(); 
			model.addAttribute("stylec",clstyle);
			return "/pages/zj/momo3.jsp";
		}
		@RequestMapping("/updateleixx2")
		public String updateleixx2(Model model)throws Exception{
			//���й�Ӧ��
			System.out.println("进入党委");
			List<Unit> cldanwei = zyclservice.findAllscdanwei();
			model.addAttribute("danweic",cldanwei);
			return "/pages/zj/momo4.jsp";
		}
	
	}

