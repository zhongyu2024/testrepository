/**
 * 
 */
package com.pinhaha.api;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pinhaha.mapper.AppVoucherMoneyMapper;
import com.pinhaha.mapper.UserGetVoucherMoneyMapper;
import com.pinhaha.pojo.AppVoucherMoney;
import com.pinhaha.pojo.UserGetVoucherMoney;

/**
*	<p>Title: </p>
* 	<p>Description: </p>
* 	<p>Company: </p> 
* 	@author zhongyu2024
* 	@date 2018年11月16日
*/

@RestController
@RequestMapping("drawApi")
public class DrawApi {
	
	
	@Autowired
	private UserGetVoucherMoneyMapper getVoucherMoneyMapper;
	
	@Autowired
	private AppVoucherMoneyMapper appVoucherMoneyMapper;
	
	@Value("${cookie_domain}")
	private String cookie_domain;
	
	@Value("${admin_sms_phone}")
	private String admin_sms_phone;
	
	@Value("${img_path}")
	private String img_path;

	//提现申请列表
	@RequestMapping("getVoucherMoneyApply")
	public Map<String, Object>  getVoucherMoneyApply(@RequestParam Map<String,Object> map){
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		PageHelper.startPage(page, limit);
		List<UserGetVoucherMoney> list = getVoucherMoneyMapper.getVoucherMoneyApply(map);
		PageInfo<UserGetVoucherMoney> pageInfo = new PageInfo<UserGetVoucherMoney>(list);
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
		    UserGetVoucherMoney um = getVoucherMoneyMapper.selectByPrimaryKey(id);
			AppVoucherMoney mm = appVoucherMoneyMapper.selByOrderNo(um.getOrder_no()).get(0);
			mm.setDrawed(2);
			appVoucherMoneyMapper.updateByPrimaryKeySelective(mm);
		try {
			getVoucherMoneyMapper.updateGetVoucherMoney(is_pay,order_sn, id);
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
			UserGetVoucherMoney gm = getVoucherMoneyMapper.selectByPrimaryKey(id);
			gm.setIs_pay(2);
			gm.setIs_check(1);
			getVoucherMoneyMapper.updateByPrimaryKeySelective(gm);
			if(gm!=null){
				AppVoucherMoney mm = appVoucherMoneyMapper.selByOrderNo(gm.getOrder_no()).get(0);
				mm.setDrawed(3);
				mm.setRefuse_status_(0l);
				appVoucherMoneyMapper.updateByPrimaryKeySelective(mm);
				
				AppVoucherMoney m = new AppVoucherMoney();
				m.setUser_id(gm.getUser_id());
				m.setCreate_time(new Date());
				m.setVoucher_num(gm.getAmount());
				m.setType(2);
				m.setDrawed(3);
				m.setOrder_sn(gm.getOrder_sn());
				m.setRefuse_status_(1l);
				m.setRefuse_id_(mm.getId());
				appVoucherMoneyMapper.insert(m);
			}
			return 1;
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return 0;
		}
		
	}
	
	//更新订单号
	@RequestMapping("updateVoucherOrderSn")
	public int updateVoucherOrderSn(Long id,String order_sn){
		UserGetVoucherMoney u = getVoucherMoneyMapper.selectByPrimaryKey(id);
		u.setOrder_sn(order_sn);
		getVoucherMoneyMapper.updateByPrimaryKeySelective(u);
		return 1;
	}
	
	
	
}
