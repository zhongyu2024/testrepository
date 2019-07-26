package com.zy.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.zy.bean.CookBook;
import com.zy.bean.Emp;
import com.zy.bean.Food;
import com.zy.bean.Kitchenkucun;
import com.zy.bean.Listinfo;
import com.zy.bean.ListinfoModel;
import com.zy.bean.Mode;
import com.zy.bean.PageBean;
import com.zy.bean.QueryTime;
import com.zy.bean.SendRecord;
import com.zy.bean.Vip;
import com.zy.bean.VipRecord;
import com.zy.bean.Waitnum;
import com.zy.bean.ZList;
import com.zy.service.WaimaiService;

/**
 * 外卖控制层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/Waimai")
public class WaimaiAction {

	@Resource
	private WaimaiService ws;
	public void setWs(WaimaiService ws) {
		this.ws = ws;
	}
	/**
	 * 初次发送展现页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showWaimai")
	public String showKuaican(Model model)throws Exception{		
		return show(model);
	}
	/**
	 * ajax根据菜系查询菜品信息
	 * @param typeid
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showByType")
	public String showByType(int typeid,Model model)throws Exception{
		List<Food> lists;
		if(typeid==0){
			//查询全部菜品
			lists=ws.getAllFood();
		}else{
			//根据菜系查询菜品
			lists=ws.getByType(typeid);
		}
		yanzheng(lists);		
		model.addAttribute("foods", lists);
		return "/pages/xfr/foodinfo.jsp";
	}
	/**
	 * ajax判断某一类菜是否足够用户点的数量
	 * @param cainame
	 * @param num
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jisuan")
	public String jisuan(String cainame,int num,int typeid,Model model)throws Exception{
		//System.out.println(cainame+"--"+num+"--"+typeid);
		//根据名字查询菜品对象
		Food food=ws.getByName(cainame);
		
		//获取该菜品所需的材料集合
		List<CookBook> ms=ws.getCaipuByFoodid(food.getId());
		for(CookBook ck:ms){
			//去厨房库存中更新材料数据
			boolean b=ws.updateKucun(num*ck.getNum(), ck.getMaterialsid());
		}	
		List<Food> lists;
		if(typeid==0){
			//查询全部菜品
			lists=ws.getAllFood();
		}else{
			//根据菜系查询菜品
			lists=ws.getByType(typeid);
		}
		yanzheng(lists);		
		model.addAttribute("foods", lists);
		return "/pages/xfr/foodinfo.jsp";		
	}
	/**
	 * 查询某个菜品的剩余数量
	 * @param cainame
	 * @throws Exception
	 */
	@RequestMapping("/checkNum")
	public void checkNum(String cainame,HttpServletResponse response)throws Exception{
		//System.out.println(cainame);
		int maxnum=1000000;//保存最大的份数
		//根据菜名获取菜品对象
		Food food=ws.getByName(cainame);		
		//根据菜品获取配方
		List<CookBook> ms=ws.getCaipuByFoodid(food.getId());
		//根据配方到厨房库存中查询库存量
		for(CookBook cb:ms){				
			//计算该菜品的剩余份数
			Kitchenkucun kk=ws.getByMaterialsid(cb.getMaterialsid());
			int x=(int)(kk.getNum()/cb.getNum());
			maxnum=maxnum<=x?maxnum:x;
		}
		//ajax请求
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(maxnum);
		out.flush();
		out.close();
	}
	/**
	 *派送,保存或作废订单
	 * @param model
	 * @param listinfo
	 * @param zl（牌号状态） 0-空闲，1-占用
	 * @param paisong 判断是不是派送记录 0-不是，1-是
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zuofei")
	public String zuofei(Model model,ListinfoModel listinfo,ZList zl,String tel,String manname,String address,int paisong) throws Exception{	
		//System.out.println("sssssssssssss");
		zl.setSendmsg(manname+" "+tel+" "+address);
		String id=listinfo.getLists().get(0).getListid();//获取订单编号
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ordertime=sf.format(new Date());
		double money=0;
		zl.setId(id);
		zl.setOrdertime(ordertime);
		if(paisong!=0){
			//是下单并且派送需要向派送记录表中添加数据
			zl.setSendtime(ordertime);
		}
		for(Listinfo l:listinfo.getLists()){
			l.setPrice(l.getMoney()/l.getNum());
			money+=l.getMoney();
		}
		zl.setPaymoney(money);
		if(zl.getState()==2){
			//恢复之前数据库删除的菜品材料信息
			for(Listinfo ll:listinfo.getLists()){
				//根据菜名获取菜品对象
				Food food=ws.getByName(ll.getCainame());				
				//获取该菜品所需的材料集合
				List<CookBook> ms=ws.getCaipuByFoodid(food.getId());
				for(CookBook ck:ms){
					//去厨房库存中更新材料数据
					boolean b=ws.updateKucun(-ll.getNum()*ck.getNum(), ck.getMaterialsid());
				}
				
			}
			ws.subjiezhang(zl,listinfo.getLists());			
		}else {
			//保存一条订单
			ws.subjiezhang(zl,listinfo.getLists());
		}
		if(paisong!=0){
			//是下单并且派送需要向派送记录表中添加数据
			//根据员工编号获取员工对象
			Emp sendman=ws.getByid(zl.getSendman());
			SendRecord sr=new SendRecord(zl.getId(), sendman.getName(), 0);
			//添加派送记录
			ws.addSenRecord(sr);
			//并且修改订单信息（加入派送人以及派送时间）
			ws.updatelistpaisong(zl);
		}
		//重新发送页面
		return show(model);
		
	}
	/**
	 * 取回界面作废操作
	 * @param listid
	 * @param model
	 * @return
	 */
	@RequestMapping("/quhuizuofei")
	public String quhuizuofei(String listid,Model model){
		ZList z=ws.getListByid(listid);
		//修改订单状态
		ws.edilistzuofei(listid);
		return fasongquhui(model,1,1);
	}
	/**
	 * 外卖取回界面派送外卖
	 * @param listid
	 * @param sendman
	 * @return
	 */
	@RequestMapping("/waimaiquhuipaisong")
	public String waimaiquhuipaisong(String listid,int sendman,Model model){
		ZList z=new ZList();
		z.setId(listid);
		z.setSendman(sendman);
		Emp e=ws.getByid(sendman);
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sendtime=sf.format(new Date());
		z.setSendtime(sendtime);
		ws.updatelistpaisong(z);
		SendRecord sr=new SendRecord(listid, e.getName(), 0);
		ws.addSenRecord(sr);
		return fasongquhui(model,1,2);
	}
	/**
	 * 取回界面按时间搜索
	 * @param time
	 * @param model
	 * @return
	 */
	@RequestMapping("/getBytime")
	public String getBytime(int time,Model model,int pageNum){
		int pageSize=1;
		int start=0;
		int end =0;
		if(time==0){
			//查询全部
			
		}else if(time==10){
			end=10*60;
		}else if(time==20){
			start=10*60;
			end=20*60;
		}else if(time==40){
			start=20*60;
			end=40*60;
		}else if(time==60){
			start=40*60;
			end=60*60;
		}else {
			start=60*60;
			end=120*60;
		}
		int start1=(pageNum-1)*pageSize+1;
		int end1=pageNum*pageSize;
		QueryTime qm=new QueryTime(start,end,start1,end1);
		List<ZList> zls=ws.getBytimeAll(qm);
		PageBean<ZList> pb=new PageBean<ZList>(pageNum, zls.size(), pageSize);			
		pb.setList(ws.getBytimeFenye(qm));
		for(ZList zz:pb.getList()){
 			if(zz.getSendman()!=0){
 				Emp s=ws.getByid(zz.getSendman());
 				zz.setSendname(s.getName());
 			}else{
 				zz.setSendname("");
 			}	
 		}
		model.addAttribute("zls", pb);
		model.addAttribute("url","Waimai/getBytime.do");
		return "/pages/xfr/waimaiquhuilist.jsp";
	}
	/**
	 * 取回界面按状态搜索
	 * @param state
	 * @param model
	 * @param pageNum
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getBystate")
	public String getBystate(int state,Model model,int pageNum)throws Exception{
		List<ZList> zls;
		if(state==0){
			//查询所有未结账的外卖订单
			zls=ws.getlistBystateAndType(4,2);
		}else if(state==1){
			//未派送
			zls=ws.getlistBystateAndType1(4,2);
		}else{
			//已派送
			zls=ws.getlistBystateAndType2(4,2);
		}
 		int pagesize=1;
 		int totalRecord=zls.size();//总记录
 		int start=(pageNum-1)*pagesize+1;
 		int end=pageNum*pagesize;
 		PageBean<ZList> pb=new PageBean<ZList>(pageNum, totalRecord, pagesize); 		
 		if(state==0){
			//查询所有未结账的外卖订单
 			pb.setList(ws.getlistBystateAndTypeAndFenye(4, 2, start, end));
		}else if(state==1){
			//未派送
			pb.setList(ws.getlistBystateAndTypeAndFenye1(4, 2, start, end));
		}else{
			//已派送
			pb.setList(ws.getlistBystateAndTypeAndFenye2(4, 2, start, end));
		}
 		for(ZList zz:pb.getList()){
 			if(zz.getSendman()!=0){
 				Emp s=ws.getByid(zz.getSendman());
 				zz.setSendname(s.getName());
 			}else{
 				zz.setSendname("");
 			}	
 		}
 		model.addAttribute("zls", pb);
		model.addAttribute("url","Waimai/getBystate.do");
		return "/pages/xfr/waimaiquhuilist.jsp";
	}
	/**
	 * 外卖界面展示结账页面
	 * @param danhao
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jiezhang")
	public String jiezhang(Model model,ListinfoModel listinfo,ZList zl,String tel,String manname,String address)throws Exception{
		zl.setSendmsg(manname+" "+tel+" "+address);
		String id=listinfo.getLists().get(0).getListid();//获取订单编号
		ZList zl1=ws.getListByid(id);		
		if(zl1==null){			
			//未提交过订单
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ordertime=sf.format(new Date());
			double money=0;
			zl.setId(id);
			zl.setOrdertime(ordertime);
			for(Listinfo l:listinfo.getLists()){
				l.setPrice(l.getMoney()/l.getNum());
				money+=l.getMoney();
			}
			zl.setPaymoney(money);
			ws.subjiezhang(zl,listinfo.getLists());		
		}
		model.addAttribute("zlist",zl);
		model.addAttribute("cailist", listinfo.getLists());	
		model.addAttribute("types", "waimai");	
		return "/pages/xfr/jiezhang.jsp";
	}
	/**
	 * 派送信息时查找外卖员
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/getpaisongman")
	public void getpaisongman(HttpServletResponse response)throws Exception{
		List<Emp> emps=ws.getpaisongman();
		List<Emp> eee=new ArrayList<Emp>();
		for(Emp e:emps){
			int m=ws.getmannum(e.getName());
			if(m>=5){
				//每个外卖员最多同时派送五分外卖
				eee.add(e);
			}
		}
		for(Emp e:eee){
			emps.remove(e);
		}
		JSONArray js=new JSONArray().fromObject(emps);
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out= response.getWriter();
		out.print(js);
		out.flush();
		out.close();
		
	}
	/**
	 * 取回界面跳转结账
	 * @param model
	 * @param listid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/quhuijiezhang")
	public String quhuijiezhang(Model model,String listid)throws Exception{
		//System.out.println(listid);
		ZList zl=ws.getListByid(listid);		
		List<Listinfo> lists=ws.getbylistid(listid);
		model.addAttribute("zlist", zl);
		model.addAttribute("cailist", lists);
		model.addAttribute("types", "waimaiquhui");	
		return "/pages/xfr/jiezhang.jsp";
	}
	/**
	 * 取回界面详情展示
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getcailist")
	public String getcailist(String id,Model model)throws Exception{
		List<Listinfo> lists=ws.getbylistid(id);
		model.addAttribute("foods",lists);
		return "/pages/xfr/quhuicailist.jsp";
	}
	/**
	 * 保存结账
	 * @param zl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/subjiezhang")
	public String subjiezhang(ZList zl,Model model,String tts)throws Exception {
		System.out.println("进入结账！");
		System.out.println(zl.getVip()+"--"+zl.getId()+"--"+zl.getDazhemoney()+"--"+zl.getRealpay());
		zl.setCashierid(1);////////////////////
		if(zl.getDazhemoney()!=0&&zl.getVip()!=0){
			//是会员支付,添加一条会员消费记录,并且修改会员账户余额
			VipRecord vr=new VipRecord();
			vr.setVipid(zl.getVip());
			vr.setDoman(1);/////////////////////////
			vr.setListid(zl.getId());
			vr.setType(1);
			vr.setMoney(zl.getRealpay());
			ws.subvippay(vr,zl);			
		}else{
			ws.subputongpay(zl);
		}
		
		//重新发送页面
		if(tts.equals("waimai")){
			return show(model);	
		}else {//if(tts.equals("waimaiquhui"))
			return fasongquhui(model,1,1);
		}
	}
	/**
	 * 根据手机号获取会员对象
	 * @param tel
	 *//*
	@RequestMapping("/getvip")
	public void  getvip(String tel,HttpServletResponse response)throws Exception{
		Vip vip=ks.getvip(tel);
		JSONArray js=new JSONArray().fromObject(vip);		
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(js.toString());
		out.flush();
		out.close(); 
	}
	*//**
	 * 展示取回页面
	 * @param model
	 * @param t 1-首次展示，2-分页展示
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showquhui")
	public String showquhui(Model model,int pageNum ,int t)throws Exception{		
 		return fasongquhui(model,pageNum,t);
	}
	private String fasongquhui(Model model,int pageNum,int t){
		List<ZList> zls=ws.getlistBystateAndType(4,2);
 		int pagesize=1;
 		int totalRecord=zls.size();//总记录
 		int start=(pageNum-1)*pagesize+1;
 		int end=pageNum*pagesize;
 		PageBean<ZList> pb=new PageBean<ZList>(pageNum, totalRecord, pagesize);
 		pb.setList(ws.getlistBystateAndTypeAndFenye(4, 2, start, end));
 		for(ZList zz:pb.getList()){
 			if(zz.getSendman()!=0){
 				Emp s=ws.getByid(zz.getSendman());
 				zz.setSendname(s.getName());
 			}else{
 				zz.setSendname("");
 			}	
 		}
		model.addAttribute("zls", pb);
		model.addAttribute("url", "Waimai/showquhui.do");
		if(t==1){
			return "/pages/xfr/waimaiquhui.jsp";
		}else{
			return "/pages/xfr/waimaiquhuilist.jsp";
		}
	}
	/**
	 * 沽清
	 * @param fs
	 * @return
	 */
	private void yanzheng(List<Food> fs){		
		//HashMap<Food, Integer> map=new HashMap<Food, Integer>();
		//遍历菜品列表
		for(Food f:fs){
			//获取该菜品所需的材料集合
			List<CookBook> ms=ws.getCaipuByFoodid(f.getId());
			if(ms.size()>0){
				int n=ms.size();//记录该菜的材料种类的数量
				for(CookBook cb:ms){				
					//查询每种材料的库存量
					Kitchenkucun kk=ws.getByMaterialsid(cb.getMaterialsid());
					if(kk!=null){
						if(kk.getNum()>=cb.getNum()){
							//库存足够
							n--;					
						}
					}
				}
				if(n==0){
					//该菜所需的所有材料均库存足够
					f.setIsguqing(0);					
				}else{
					f.setIsguqing(1);	
				}
			}else{
				f.setIsguqing(1);	
			}
		}
		
	}
	/**
	 * 展示初始外卖界面
	 * @param model
	 * @return
	 */
	private String show(Model model){
		List<Food> foods=ws.getAllFood();		
		List<Mode> cooktypes=ws.getAllCookType();
		List<Mode> yaoqius=ws.getAllYaoqiu();
		yanzheng(foods);		
		model.addAttribute("foods", foods);	
		model.addAttribute("cks", cooktypes);
		model.addAttribute("yqs", yaoqius);
		return "/pages/xfr/Waimai.jsp";
	}
}
