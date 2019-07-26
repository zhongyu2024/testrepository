package com.pinhaha.api;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.zxing.common.StringUtils;
import com.pinhaha.mapper.AppCourseAfflineMapper;
import com.pinhaha.mapper.AppInsBillMapper;
import com.pinhaha.mapper.AppInstructionMapper;
import com.pinhaha.mapper.AppUserMapper;
import com.pinhaha.mapper.AppVoucherMoneyMapper;
import com.pinhaha.mapper.InstructionGetMoneyMapper;
import com.pinhaha.mapper.UserGetVoucherMoneyMapper;
import com.pinhaha.pojo.AppCourse;
import com.pinhaha.pojo.AppCourseAffline;
import com.pinhaha.pojo.AppInsBill;
import com.pinhaha.pojo.AppInstruction;
import com.pinhaha.pojo.AppVoucherMoney;
import com.pinhaha.pojo.InstructionGetMoney;
import com.pinhaha.pojo.UserGetVoucherMoney;
import com.pinhaha.util.Md5Util;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("ins")
public class InsApi extends BaseController{

	@Autowired
    private AppInstructionMapper appInstructionMapper;
	
	@Autowired
	private InstructionGetMoneyMapper getVoucherMoneyMapper;
	
	@Value("${cookie_domain}")
	private String cookie_domain;
	
	@Autowired
	private AppInsBillMapper appInsBillMapper;

	
	//商家列表
	@RequestMapping("insList")
	public Object insList(@RequestParam Map<String,Object> map) throws Exception{
			Integer page = Integer.parseInt((String) map.get("page"));
			Integer pageSize = Integer.parseInt((String) map.get("limit"));
			PageHelper.startPage(page, pageSize);
			//AppInstruction ins = new AppInstruction();
			//ins.setDelete(false);
			List<AppInstruction> list = appInstructionMapper.getInsList();
			PageInfo<AppInstruction> pages = new PageInfo<>(list);
		return this.getPageJson(0, "ins", pages.getTotal(), pages.getList());
	}
	
	//商家信息
	@RequestMapping("updateview")
	public Object updateview(@RequestParam("id") Long id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AppInstruction ins = appInstructionMapper.selectByPrimaryKey(id);
		return this.setJson(true, null, ins);
	}
		
		
	//添加商家
	@RequestMapping("insert")
	public Object insert(AppInstruction ins) throws Exception{
		
		try {
			if(ins!=null) {
				ins.setPwd(Md5Util.MD5Encode(ins.getPwd(), null));
				ins.setCreate_time(new Date());
				ins.setStatus(0L);
				appInstructionMapper.insertSelective(ins);
				return this.setJson(true, "添加成功！", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.setJson(true, "添加失败！", null);
	}
	
	//修改商家
	@RequestMapping("update")  
	public Object update(AppInstruction ins,String img1,String img2,String img3,String img4
			) throws Exception{
		System.out.println(ins);
		try {
			if(ins!=null) {
				AppInstruction i = appInstructionMapper.selectByPrimaryKey(ins.getId());
				if(ins.getPwd()!=null&&ins.getPwd()!="") {
					ins.setPwd(Md5Util.MD5Encode(ins.getPwd(), null));
				}
				if(img1==null||img1=="") {
					ins.setImg_url(i.getImg_url());
				}else {
					ins.setImg_url(img1);
				}
				if(img2==null||img2=="") {
					ins.setId_card_up(i.getId_card_up());
				}else {
					ins.setId_card_up(img2);
				}
				if(img3==null||img3=="") {
					ins.setId_card_down(i.getId_card_down());
				}else {
					ins.setId_card_down(img3);
				}
				if(img4==null||img4=="") {
					ins.setBus_lisence(i.getBus_lisence());
				}else {
					ins.setBus_lisence(img4);
				}
				appInstructionMapper.updateByPrimaryKeySelective(ins);
				return this.setJson(true, "修改成功！", null);
			}
			return this.setJson(true, "修改失败！", null);
		} catch (Exception e) {
			e.printStackTrace();
			return this.setJson(true, "修改失败！", null);
		}
		
	}
	
	//修改商家
	@RequestMapping("updateStatus")  
	public Object update(Long id,Long status) throws Exception{
		AppInstruction i = appInstructionMapper.selectByPrimaryKey(id);
		i.setStatus(status);
		appInstructionMapper.updateByPrimaryKeySelective(i);
		return this.setJson(true, "修改成功！", null);
	}
	
	//锁定商家
	@RequestMapping("lock")  
	public Object lock(Long id) throws Exception{
		try {
				AppInstruction i = appInstructionMapper.selectByPrimaryKey(id);
				i.setStatus(2L);
				appInstructionMapper.updateByPrimaryKeySelective(i);
				return this.setJson(true, "锁定成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.setJson(true, "锁定失败！", null);
	}
	
	//删除商家
	@RequestMapping("delete")  
	public Object delete(Long id) throws Exception{
		try {
				AppInstruction i = appInstructionMapper.selectByPrimaryKey(id);
				i.setDeleted(true);
				appInstructionMapper.updateByPrimaryKeySelective(i);
				return this.setJson(true, "删除成功！", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.setJson(true, "删除失败！", null);
	}
	
	
	
	
	
	//提现申请列表
	@RequestMapping("getVoucherMoneyApply")
	public Map<String, Object>  getVoucherMoneyApply(@RequestParam Map<String,Object> map){
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		PageHelper.startPage(page, limit);
		List<InstructionGetMoney> list = getVoucherMoneyMapper.getVoucherMoneyApply(map);
		PageInfo<InstructionGetMoney> pageInfo = new PageInfo<InstructionGetMoney>(list);
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		map2.put("code", 0);
		map2.put("msg", pageInfo);
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	//提现
	@Transactional
	@RequestMapping("updateGetVoucherMoney")
	public int updateGetVoucherMoney(int is_pay,int id,Long user_id,String order_sn){
		try {
			AppInsBill bill = appInsBillMapper.selByGetMId(String.valueOf(id));
			bill.setType_(AppInsBill.ORDER_NUMBER_4);
			appInsBillMapper.updateByPrimaryKey(bill);
			//getVoucherMoneyMapper.updateGetVoucherMoney(is_pay,order_sn, id);
			InstructionGetMoney gm = getVoucherMoneyMapper.selectByPrimaryKey(id);
			gm.setIs_pay(1);
			gm.setIs_check(1);
			getVoucherMoneyMapper.updateByPrimaryKeySelective(gm);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}
	
	//拒绝提现
	@Transactional
	@RequestMapping("refuseGetvoucherMoney")
	public int refuseGetvoucherMoney(int is_pay,int id){
		try {
			InstructionGetMoney gm = getVoucherMoneyMapper.selectByPrimaryKey(id);
			gm.setIs_pay(2);
			gm.setIs_check(1);
			getVoucherMoneyMapper.updateByPrimaryKeySelective(gm);
			
			AppInsBill bills = appInsBillMapper.selByGetMId(String.valueOf(id));
			bills.setType_(AppInsBill.ORDER_NUMBER_3);
			appInsBillMapper.updateByPrimaryKey(bills);
			
			AppInsBill bill =  new AppInsBill();
			bill.setCreate_time_(new Date());
			bill.setIns_id_(bills.getIns_id_());
			bill.setMid_(bills.getMid_());
			bill.setMunber_(gm.getAmount().toString());
			bill.setType_(AppInsBill.ORDER_NUMBER_5);
			appInsBillMapper.insert(bill);
			
//			AppVoucherMoney m = getVoucherMoneyMapper.getVoucherMoneyByOrderNo(gm.getOrder_no());
//			m.setDrawed(3);
//			appVoucherMoneyMapper.updateByPrimaryKeySelective(m);
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return 0;
		}
		
	}
	
	//更新订单号
	@RequestMapping("updateVoucherOrderSn")
	public int updateVoucherOrderSn(Long id,String order_sn){
		InstructionGetMoney u = getVoucherMoneyMapper.selectByPrimaryKey(id);
		u.setOrder_sn(order_sn);
		getVoucherMoneyMapper.updateByPrimaryKeySelective(u);
		return 1;
	}
	
	
	
}
