package com.zy.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Emp;
import com.zy.bean.Foodtable;
import com.zy.bean.FoodtableQuery;
import com.zy.bean.Hetable;
import com.zy.bean.Listinfo;
import com.zy.bean.Newhtid;
import com.zy.bean.ZList;
import com.zy.service.ZzyFoodTableService;
import java.util.Date;
import java.text.SimpleDateFormat;
@Controller
@RequestMapping("/tangshi")
public class TangShiAction {
	@Resource
	private ZzyFoodTableService zftService;

	public void setZftService(ZzyFoodTableService zftService) {
		this.zftService = zftService;
	}
	//初始化
	@RequestMapping("/findAllCanTai")
	public String findAllCanTai(Model model)throws Exception
	{
		List<Foodtable> ftlist=zftService.findAllTables();
		model.addAttribute("initcantai", 0);
		model.addAttribute("initstate", 3);
		model.addAttribute("initarea", 2);
		System.out.println(ftlist.size());
		List<Emp> fuwu=zftService.findAllFuWu();
		model.addAttribute("fuwu", fuwu);
		for(Foodtable ft:ftlist)
		{
/*			System.out.println(ft.getId()+"-----"+ft.getState());*/
			if(ft.getState()==1)
			{

				ft.setZlist(zftService.findZListByFT(ft.getId()));
/*				System.out.println(ft.getHetai());*/
				if(ft.getHetai()==1)
				{
					double hetaimoney;
					hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
/*					System.out.println(zftService.findZListByFT(ft.getId()).getId());*/
					List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
					for(Hetable h:zilist)
					{
						hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
					}
					ft.setHtmoney(hetaimoney);
				}

			}

				if(zftService.findYudingByFT(ft.getId())!=null)
				{
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
					String today = df.format(new Date());
					/*System.out.println(today);*/
					SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
					Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
					String yuday = df.format(date);

					if(today.equals(yuday))
					{
						System.out.println("找到预定餐桌");
						//获取当前时间所处的营业时段
						if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
						{
							ft.setYuding(zftService.findYudingByFT(ft.getId()));
							if(ft.getState()==0)
							{
								if(zftService.updateFoodtableState(ft.getId(), 2))
									{
										System.out.println("初始化更新餐桌状态完成");
										ft.setState(2);
										/*System.out.println(ft.getYuding().getYutime());*/
										String ytime=ft.getYuding().getYutime().substring(5, 16);
										ft.setYutime(ytime);
									}							
							}
							else if(ft.getState()==2)
							{
								String ytime=ft.getYuding().getYutime().substring(5, 16);
								ft.setYutime(ytime);
								
							}

						}else
						{
							if(ft.getState()==2)
							{
								ft.setState(0);
							}
						}					
					}else
					{
						if(ft.getState()==2)
						{
							ft.setState(0);
						}
					}

				}else
				{
					if(ft.getState()==2)
					{
						ft.setState(0);
					}
				}

/*			System.out.println(zftService.findYudingByFT(ft.getId()));*/

		}
		System.out.println(ftlist.size());
		model.addAttribute("tables", ftlist);
		return "/pages/zzy/TangShi.jsp";
	}
	//中间作为刷新
	@RequestMapping("/findByQuery")
	public String findByQuery(Model model,int cantai,int state,int area)throws Exception
	{
		System.out.println(cantai+"--"+state+"--"+area);
		FoodtableQuery ftq=new FoodtableQuery();
		ftq.setSeatsize(cantai);
		ftq.setState(state);
		ftq.setArea(area);
		model.addAttribute("ddcantai", cantai);
		model.addAttribute("ddstate", state);
		model.addAttribute("ddarea", area);
		List<Foodtable> ftlist=zftService.findByQuery(ftq);
		
		for(Foodtable ft:ftlist)
		{

			if(ft.getState()==1)
			{

				ft.setZlist(zftService.findZListByFT(ft.getId()));
				if(ft.getHetai()==1)
				{
					double hetaimoney;
					hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
					List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
					for(Hetable h:zilist)
					{
						hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
					}
					ft.setHtmoney(hetaimoney);
				}
			}
			else if(ft.getState()==0||ft.getState()==2)
			{
				List<Emp> fuwu=zftService.findAllFuWu();
				System.out.println(fuwu.size());
				model.addAttribute("fuwu", fuwu);
			}
/*			if(zftService.findYudingByFT(ft.getId())!=null)
			{
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				String today = df.format(new Date());
				System.out.println(today);
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
				Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
				String yuday = df.format(date);
				System.out.println(yuday);
				if(today.equals(yuday))
				{
					if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
					{	
						if(ft.getState()==0){
						ft.setYuding(zftService.findYudingByFT(ft.getId()));
						if(zftService.updateFoodtableState(ft.getId(), 2))
						{
							System.out.println("初始化更新餐桌状态完成");
							System.out.println(ft.getYuding().getYutime());
							String ytime=ft.getYuding().getYutime().substring(5, 16);
							model.addAttribute("queryytime", ytime);
						}
						}
					}
				}
				//获取当前时间所处的营业时段

			}*/
			if(zftService.findYudingByFT(ft.getId())!=null)
			{
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				String today = df.format(new Date());
				/*System.out.println(today);*/
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
				Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
				String yuday = df.format(date);

				if(today.equals(yuday))
				{
					System.out.println("找到预定餐桌");
					//获取当前时间所处的营业时段
					if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
					{
						ft.setYuding(zftService.findYudingByFT(ft.getId()));
						if(ft.getState()==0)
						{
							if(zftService.updateFoodtableState(ft.getId(), 2))
								{
									System.out.println("初始化更新餐桌状态完成");
									ft.setState(2);
									/*System.out.println(ft.getYuding().getYutime());*/
									String ytime=ft.getYuding().getYutime().substring(5, 16);
									ft.setYutime(ytime);
								}							
						}
						else if(ft.getState()==2)
						{
							String ytime=ft.getYuding().getYutime().substring(5, 16);
							ft.setYutime(ytime);
							
						}

					}else
					{
						if(ft.getState()==2)
						{
							if(zftService.updateFoodtableState(ft.getId(), 0))
							{
								ft.setState(0);
							}
						}
					}					
				}else
				{
					if(ft.getState()==2)
					{
						if(zftService.updateFoodtableState(ft.getId(), 0))
						{
							ft.setState(0);
						}
					}
				}

			}else
			{
				if(ft.getState()==2)
				{
					if(zftService.updateFoodtableState(ft.getId(), 0))
					{
						ft.setState(0);
					}
				}
			}
		}
		System.out.println(ftlist.size());
		model.addAttribute("querytables", ftlist);
		return "/pages/zzy/queryCanTai.jsp";
	}
	//右侧订单
	@RequestMapping("/DingDanfindByQuery")
	public String DingDanfindByQuery(Model model,int id,int ddcantai,int ddstate,int ddarea)throws Exception
	{
		Foodtable ft = zftService.findFTByid(id);
		System.out.println(ft.getName());
		if(ft.getState()==1)
		{
			ft.setZlist(zftService.findZListByFT(ft.getId()));
			List<Listinfo> lf=zftService.findListinfo(zftService.findZListByFT(ft.getId()).getId());
			System.out.println(lf.size());
			model.addAttribute("DDXQ", lf);
			if(ft.getHetai()==1)
			{
				double hetaimoney;
				hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
				List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
				for(Hetable h:zilist)
				{
					hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
				}
				ft.setHtmoney(hetaimoney);
			}
			if(ft.getHetai()==2)
			{
				ft.setFutableid(zftService.findFTByid(zftService.findFTBylistid(zftService.findhetableByBid(zftService.findZListByFT(ft.getId()).getId()).getAid()).getTableid()).getName());
			}
		}
		else if(ft.getState()==0||ft.getState()==2)
		{
			List<Emp> fuwu=zftService.findAllFuWu();
			System.out.println(fuwu.size());
			model.addAttribute("fuwu", fuwu);
		}
		System.out.println("id=" + ft.getId());
		model.addAttribute("ddcantai", ddcantai);
		model.addAttribute("ddstate", ddstate);
		model.addAttribute("ddarea", ddarea);
		model.addAttribute("dds", ft);
		return "/pages/zzy/queryDingDan.jsp";
	}
	//开台
	@RequestMapping("/addKaiTai")
	public String addKaiTai(Model model,String dingdanid,int tableid,int dingdaneatnum,int fuwuid,int dingdancashierid,int xdcantai,int xdstate,int xdarea)throws Exception
	{
		System.out.println("jkinru ");
		Foodtable yuft=zftService.findFTByid(tableid);
		if(yuft.getState()==2)
		{
			if(zftService.gukedaodian(zftService.findYudingByFT(yuft.getId()).getId()))
			{
				System.out.println("顾客到店成功");
			}
			
		}
		System.out.println(dingdanid+"------"+tableid+"------"+dingdaneatnum+"------"+fuwuid+"------"+dingdancashierid+"------"+xdcantai+"------"+xdstate+"------"+xdarea);
		if(zftService.addKaiTai(dingdanid, tableid, dingdaneatnum, fuwuid, dingdancashierid))
		{
			System.out.println("插入成功");
/*			
			FoodtableQuery ftq=new FoodtableQuery();
			ftq.setSeatsize(xdcantai);
			ftq.setState(xdstate);
			ftq.setArea(xdarea);
			List<Foodtable> ftlist=zftService.findByQuery(ftq);*/
			
			if(zftService.updateFoodtableState(tableid, 1))
			{
				System.out.println("更新成功");
				System.out.println(xdcantai+"--"+xdstate+"--"+xdarea);
				FoodtableQuery ftq=new FoodtableQuery();
				ftq.setSeatsize(xdcantai);
				ftq.setState(xdstate);
				ftq.setArea(xdarea);
				model.addAttribute("ddcantai", xdcantai);
				model.addAttribute("ddstate", xdstate);
				model.addAttribute("ddarea", xdarea);
				List<Foodtable> ftlist=zftService.findByQuery(ftq);
				
				for(Foodtable ft:ftlist)
				{

					if(ft.getState()==1)
					{
						ft.setZlist(zftService.findZListByFT(ft.getId()));
						if(ft.getHetai()==1)
						{
							double hetaimoney;
							hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
							List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
							for(Hetable h:zilist)
							{
								hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
							}
							ft.setHtmoney(hetaimoney);
						}
					}
					else if(ft.getState()==0)
					{
						List<Emp> fuwu=zftService.findAllFuWu();
						System.out.println(fuwu.size());
						model.addAttribute("fuwu", fuwu);
					}
					if(zftService.findYudingByFT(ft.getId())!=null)
					{
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
						String today = df.format(new Date());
						/*System.out.println(today);*/
						SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
						Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
						String yuday = df.format(date);

						if(today.equals(yuday))
						{
							System.out.println("找到预定餐桌");
							//获取当前时间所处的营业时段
							if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
							{
								ft.setYuding(zftService.findYudingByFT(ft.getId()));
								if(ft.getState()==0)
								{
									if(zftService.updateFoodtableState(ft.getId(), 2))
										{
											System.out.println("初始化更新餐桌状态完成");
											ft.setState(2);
											/*System.out.println(ft.getYuding().getYutime());*/
											String ytime=ft.getYuding().getYutime().substring(5, 16);
											ft.setYutime(ytime);
										}							
								}
								else if(ft.getState()==2)
								{
									String ytime=ft.getYuding().getYutime().substring(5, 16);
									ft.setYutime(ytime);
									
								}

							}else
							{
								if(ft.getState()==2)
								{
									if(zftService.updateFoodtableState(ft.getId(), 0))
									{
										ft.setState(0);
									}
								}
							}					
						}else
						{
							if(ft.getState()==2)
							{
								if(zftService.updateFoodtableState(ft.getId(), 0))
								{
									ft.setState(0);
								}
							}
						}

					}else
					{
						if(ft.getState()==2)
						{
							if(zftService.updateFoodtableState(ft.getId(), 0))
							{
								ft.setState(0);
							}
						}
					}
				}
				System.out.println(ftlist.size()+"成功");
				model.addAttribute("querytables", ftlist);
				return "/pages/zzy/queryCanTai.jsp";
			}
			
		}
		
		return null;
	}
	//清台
	@RequestMapping("/qingtai")
	public String qingtai(String qtdingdanid,int qttableid,int qtcantai,int qtstate,int qtarea,Model model)throws Exception
	{
		System.out.println("进入清台处理");
		Foodtable ftt=zftService.findFTByid(qttableid);
		if(ftt.getHetai()==1)
		{
			
			String fulistid=zftService.findZListByFT(qttableid).getId();
			List<Hetable> zilist1=zftService.findzilistByfu(fulistid);
			if(zftService.updatefoodtablehetai(0, qttableid))
			{
				System.out.println("更新父合台状态成功"+qttableid);
				for(Hetable h1:zilist1)
				{
					ZList zl=zftService.findZListByid(h1.getBid());
					if(zftService.updatefoodtablehetai(0, zl.getTableid()))
					{
						if(zftService.qingtai(zftService.findZListByFT(zl.getTableid()).getId())){
							if(zftService.updateFoodtableState(zl.getTableid(), 0))
							{
								System.out.println("更新子合台状态成功--"+zl.getTableid());
								if(zftService.deletehetable(zftService.findZListByFT(qttableid).getId()))
								{
									
									System.out.println("删除成功");
								}							
							}							
						}


					}
				}			
			}	
		}
		if(zftService.qingtai(qtdingdanid))
		{
			if(zftService.updateFoodtableState(qttableid, 0))
			{
				System.out.println("清台完成");

				System.out.println(qtcantai+"--"+qtstate+"--"+qtarea);
				FoodtableQuery ftq=new FoodtableQuery();
				ftq.setSeatsize(qtcantai);
				ftq.setState(qtstate);
				ftq.setArea(qtarea);
				model.addAttribute("ddcantai", qtcantai);
				model.addAttribute("ddstate", qtstate);
				model.addAttribute("ddarea", qtarea);
				List<Foodtable> ftlist=zftService.findByQuery(ftq);
				
				for(Foodtable ft:ftlist)
				{

					if(ft.getState()==1)
					{

						ft.setZlist(zftService.findZListByFT(ft.getId()));
						if(ft.getHetai()==1)
						{
							double hetaimoney;
							hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
							List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
							for(Hetable h:zilist)
							{
								hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
							}
							ft.setHtmoney(hetaimoney);
						}

					}
					else if(ft.getState()==0)
					{
						List<Emp> fuwu=zftService.findAllFuWu();
						System.out.println(fuwu.size());
						model.addAttribute("fuwu", fuwu);
					}
					if(zftService.findYudingByFT(ft.getId())!=null)
					{
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
						String today = df.format(new Date());
						/*System.out.println(today);*/
						SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
						Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
						String yuday = df.format(date);

						if(today.equals(yuday))
						{
							System.out.println("找到预定餐桌");
							//获取当前时间所处的营业时段
							if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
							{
								ft.setYuding(zftService.findYudingByFT(ft.getId()));
								if(ft.getState()==0)
								{
									if(zftService.updateFoodtableState(ft.getId(), 2))
										{
											System.out.println("初始化更新餐桌状态完成");
											ft.setState(2);
											/*System.out.println(ft.getYuding().getYutime());*/
											String ytime=ft.getYuding().getYutime().substring(5, 16);
											ft.setYutime(ytime);
										}							
								}
								else if(ft.getState()==2)
								{
									String ytime=ft.getYuding().getYutime().substring(5, 16);
									ft.setYutime(ytime);
									
								}

							}else
							{
								if(ft.getState()==2)
								{
									if(zftService.updateFoodtableState(ft.getId(), 0))
									{
										ft.setState(0);
									}
								}
							}					
						}else
						{
							if(ft.getState()==2)
							{
								if(zftService.updateFoodtableState(ft.getId(), 0))
								{
									ft.setState(0);
								}
							}
						}

					}else
					{
						if(ft.getState()==2)
						{
							if(zftService.updateFoodtableState(ft.getId(), 0))
							{
								ft.setState(0);
							}
						}
					}
				}
				System.out.println(ftlist.size()+"成功");
				model.addAttribute("querytables", ftlist);
				return "/pages/zzy/queryCanTai.jsp";
			}
		}
		return null;
	}
	//合台搜索
	@RequestMapping("hetaifind")
	public String hetaifind(Model model,int htcantai,int htarea,int htseltableid)throws Exception
	{
		System.out.println(htcantai+"----"+"----"+htarea+"----"+htseltableid);
		model.addAttribute("htfutableid", htseltableid);
		List<Foodtable> ftlist=zftService.canhetaitable(htcantai, htarea);
		System.out.println("可合台的个数"+ftlist.size());
		for(Foodtable ft : ftlist)
		{
			ft.setZlist(zftService.findZListByFT(ft.getId()));
		}
		model.addAttribute("canhetaitable",ftlist);
		return "/pages/zzy/htqueryCanTai.jsp";
	}
	@RequestMapping("newhetai")
	public String newhetai(Model model,String res,int nhcantai,int nhstate,int nharea)throws Exception
	{
		
		
		System.out.println(res);
		String[] strs=res.split("/");
		int futableid=Integer.parseInt(strs[0].toString());
		String fulistid=zftService.findZListByFT(futableid).getId();

		if(zftService.updatefoodtablehetai(1, futableid))
		{
			
			for(int i=0,len=strs.length;i<len;i++){
				  if(i!=0)
				  {
					 int zitableid=Integer.parseInt(strs[i].toString());
					 String zilistid=zftService.findZListByFT(zitableid).getId();

					 if(zftService.addhetai(fulistid, zilistid))
					 {
						 System.out.println("插入合台表成功");
						 if(zftService.updatefoodtablehetai(2, zitableid))
						 {
							 System.out.println("更新桌位合台状态成功");
						 }
					 }
				  }
				}			
		}
		FoodtableQuery ftq=new FoodtableQuery();
		ftq.setSeatsize(nhcantai);
		ftq.setState(nhstate);
		ftq.setArea(nharea);
		model.addAttribute("ddcantai", nhcantai);
		model.addAttribute("ddstate", nhstate);
		model.addAttribute("ddarea", nharea);
		List<Foodtable> ftlist=zftService.findByQuery(ftq);
		
		for(Foodtable ft:ftlist)
		{

			if(ft.getState()==1)
			{

				ft.setZlist(zftService.findZListByFT(ft.getId()));
				if(ft.getHetai()==1)
				{
					double hetaimoney;
					hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
					List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
					for(Hetable h:zilist)
					{
						hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
					}
					ft.setHtmoney(hetaimoney);
				}
			}
			else if(ft.getState()==0)
			{
				List<Emp> fuwu=zftService.findAllFuWu();
				System.out.println(fuwu.size());
				model.addAttribute("fuwu", fuwu);
			}
			if(zftService.findYudingByFT(ft.getId())!=null)
			{
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				String today = df.format(new Date());
				/*System.out.println(today);*/
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
				Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
				String yuday = df.format(date);

				if(today.equals(yuday))
				{
					System.out.println("找到预定餐桌");
					//获取当前时间所处的营业时段
					if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
					{
						ft.setYuding(zftService.findYudingByFT(ft.getId()));
						if(ft.getState()==0)
						{
							if(zftService.updateFoodtableState(ft.getId(), 2))
								{
									System.out.println("初始化更新餐桌状态完成");
									ft.setState(2);
									/*System.out.println(ft.getYuding().getYutime());*/
									String ytime=ft.getYuding().getYutime().substring(5, 16);
									ft.setYutime(ytime);
								}							
						}
						else if(ft.getState()==2)
						{
							String ytime=ft.getYuding().getYutime().substring(5, 16);
							ft.setYutime(ytime);
							
						}

					}else
					{
						if(ft.getState()==2)
						{
							if(zftService.updateFoodtableState(ft.getId(), 0))
							{
								ft.setState(0);
							}
						}
					}					
				}else
				{
					if(ft.getState()==2)
					{
						if(zftService.updateFoodtableState(ft.getId(), 0))
						{
							ft.setState(0);
						}
					}
				}

			}else
			{
				if(ft.getState()==2)
				{
					if(zftService.updateFoodtableState(ft.getId(), 0))
					{
						ft.setState(0);
					}
				}
			}
		}
		System.out.println(ftlist.size()+"成功");
		model.addAttribute("querytables", ftlist);
		return "/pages/zzy/queryCanTai.jsp";	

	}
	//拆台
	@RequestMapping("chaitai")
	public String chaitai(Model model,int cttableid,int ctcantai,int ctstate,int ctarea)throws Exception
	{
		String fulistid=zftService.findZListByFT(cttableid).getId();
		
		List<Hetable> zilist1=zftService.findzilistByfu(fulistid);
		
		if(zftService.updatefoodtablehetai(0, cttableid))
		{
			System.out.println("更新父合台状态成功"+cttableid);
			for(Hetable h1:zilist1)
			{
				ZList zl=zftService.findZListByid(h1.getBid());
				if(zftService.updatefoodtablehetai(0, zl.getTableid()))
				{
					System.out.println("更新子合台状态成功--"+zl.getTableid());
					if(zftService.deletehetable(zftService.findZListByFT(cttableid).getId()))
					{
						System.out.println("删除成功");
					}
					
				}
			}			
		}
		
		FoodtableQuery ftq=new FoodtableQuery();
		ftq.setSeatsize(ctcantai);
		ftq.setState(ctstate);
		ftq.setArea(ctarea);
		model.addAttribute("ddcantai", ctcantai);
		model.addAttribute("ddstate", ctstate);
		model.addAttribute("ddarea", ctarea);
		List<Foodtable> ftlist=zftService.findByQuery(ftq);
		
		for(Foodtable ft:ftlist)
		{

			if(ft.getState()==1)
			{

				ft.setZlist(zftService.findZListByFT(ft.getId()));
				if(ft.getHetai()==1)
				{
					double hetaimoney;
					hetaimoney=zftService.findZListByFT(ft.getId()).getPaymoney();
					List<Hetable> zilist=zftService.findzilistByfu(zftService.findZListByFT(ft.getId()).getId());
					for(Hetable h:zilist)
					{
						hetaimoney+=zftService.findZListByid(h.getBid()).getPaymoney();
					}
					ft.setHtmoney(hetaimoney);
				}

			}
			else if(ft.getState()==0)
			{
				List<Emp> fuwu=zftService.findAllFuWu();
				System.out.println(fuwu.size());
				model.addAttribute("fuwu", fuwu);
			}
			if(zftService.findYudingByFT(ft.getId())!=null)
			{
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				String today = df.format(new Date());
				/*System.out.println(today);*/
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
				Date date = sdf.parse( zftService.findYudingByFT(ft.getId()).getYutime() );
				String yuday = df.format(date);

				if(today.equals(yuday))
				{
					System.out.println("找到预定餐桌");
					//获取当前时间所处的营业时段
					if(zftService.findYudingByFT(ft.getId()).getOpentimeid()==zftService.findNowTime().getId())
					{
						ft.setYuding(zftService.findYudingByFT(ft.getId()));
						if(ft.getState()==0)
						{
							if(zftService.updateFoodtableState(ft.getId(), 2))
								{
									System.out.println("初始化更新餐桌状态完成");
									ft.setState(2);
									/*System.out.println(ft.getYuding().getYutime());*/
									String ytime=ft.getYuding().getYutime().substring(5, 16);
									ft.setYutime(ytime);
								}							
						}
						else if(ft.getState()==2)
						{
							String ytime=ft.getYuding().getYutime().substring(5, 16);
							ft.setYutime(ytime);
							
						}

					}else
					{
						if(ft.getState()==2)
						{
							if(zftService.updateFoodtableState(ft.getId(), 0))
							{
								ft.setState(0);
							}
						}
					}					
				}else
				{
					if(ft.getState()==2)
					{
						if(zftService.updateFoodtableState(ft.getId(), 0))
						{
							ft.setState(0);
						}
					}
				}

			}else
			{
				if(ft.getState()==2)
				{
					if(zftService.updateFoodtableState(ft.getId(), 0))
					{
						ft.setState(0);
					}
				}
			}
		}
		System.out.println(ftlist.size()+"成功");
		model.addAttribute("querytables", ftlist);
		return "/pages/zzy/queryCanTai.jsp";
	}
	
}
