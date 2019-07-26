package com.pinhaha.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pinhaha.enums.EnumAppAccountLogType;
import com.pinhaha.enums.EnumAppCouponLogType;
import com.pinhaha.enums.EnumFieldClassVipPrice;
import com.pinhaha.enums.EnumMember;
import com.pinhaha.enums.EnumMemberOrderType;
import com.pinhaha.enums.EnumMemberType;
import com.pinhaha.enums.EnumOrdeReturnType;
import com.pinhaha.mapper.AppAreaAgentMapper;
import com.pinhaha.mapper.AppUserAccountMapper;
import com.pinhaha.mapper.AppUserCouponMapper;
import com.pinhaha.mapper.AppUserMapper;
import com.pinhaha.mapper.MemberLevelMapper;
import com.pinhaha.mapper.MemberLevelOpenMapper;
import com.pinhaha.pojo.AppAccountLog;
import com.pinhaha.pojo.AppAreaAgent;
import com.pinhaha.pojo.AppCouponLog;
import com.pinhaha.pojo.AppUser;
import com.pinhaha.pojo.AppUserAccount;
import com.pinhaha.pojo.AppUserCoupon;
import com.pinhaha.pojo.MemberLevel;
import com.pinhaha.pojo.MemberOrder;
import com.pinhaha.service.ManagerService;
import com.pinhaha.service.MemberService;
import com.pinhaha.util.DateUtil;


@Service
public class ManagerServiceImpl implements ManagerService{
	

	@Autowired
	private AppUserMapper appUserMapper;


	@Autowired
	private MemberLevelMapper memberLevelMapper;


	@Autowired
	private AppAreaAgentMapper appAreaAgentMapper;

	@Autowired
	private MemberLevelOpenMapper memberLevelOpenMapper;

	@Autowired
	private AppUserCouponMapper appUserCouponMapper;

	@Autowired
	private AppUserAccountMapper appUserAccountMapper;


	@Autowired
	private MemberService memberService;
	
	
	@Override
	public Boolean fieldClassMember(AppUser user, String memberId) {

		Date now = new Date();
		MemberLevel buyMemberLevel = memberLevelMapper.selectByPrimaryKey(Long.valueOf(memberId));

		String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
		// 添加信息到订单表
		MemberOrder order = new MemberOrder();
		// 1.支付宝，2.微信，3.上级拆分，4.下级申请 5.系统审核订单
		order.setOrder_type(EnumMemberOrderType.HIGHSEND.getType());
		// 订单号
		order.setOrder_no(orderNo);
		order.setCreate_time(now);
		// 用户是否关闭
		order.setIs_closed(false);
		// 是否支付成功
		order.setIs_pay(true);
		order.setUser_id(user.getId());
		// 会员id
		order.setMember_id(buyMemberLevel.getId());
		// 订单金额
		order.setOrder_price(buyMemberLevel.getMember_price());
		order.setPay_time(now);
		// 优惠金额
		order.setReduction_price(new BigDecimal(0));
		// 0.待审核 1.未计算 2.计算中 3.结算完毕
		order.setReturn_type(EnumOrdeReturnType.alreadyReturn.getType());
		order.setOver_time(DateUtil.getDayAfter(now, 30));
		// 添加信息到审核表

		AppUser inviteUser=appUserMapper.selectByPrimaryKey(user.getInvitation_user_id());
		
		/**
		 * 一:如果购买人购买的会员等级是基础会员
		 */
		if (buyMemberLevel.getType().intValue() == EnumMemberType.baseMember.getType().intValue()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user", user);
			map.put("buyMemberLevel", buyMemberLevel);
			map.put("now", now);
			map.put("order", order);
			/**
			 * 1. 先跑区域代理收益
			 */
			Long provinceId = user.getProvince_id();
			Long cityId = user.getCity_id();
			AppAreaAgent provinceAgent = null;
			AppAreaAgent cityAgent = null;
			if (provinceId != null) {
				provinceAgent = appAreaAgentMapper.seleProvinceAgent(provinceId);
				// 省级代理人
				if (provinceAgent != null) {
					AppUser provinceUser = appUserMapper.selectByPrimaryKey(provinceAgent.getUser_id());
					if (provinceUser != null && provinceUser.getMember_level_end_time().after(now)) {// 不为空没过期
						// 省级代理人
						MemberLevel provinceLevel = memberLevelMapper.selectByPrimaryKey(provinceUser.getMember_level_id());
						// 不为空并且为区域代理类型,账户增加收益
						if (provinceLevel != null && provinceLevel.getType().intValue() == EnumMemberType.areaMember.getType().intValue() && provinceLevel.getProvince_return() != null) {
							// 账户表
							AppUserAccount account = appUserAccountMapper.selectByUserId(provinceUser.getId());
							AppAccountLog appAccountLog = new AppAccountLog();
							String message = "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
							appAccountLog.setChange_amount(provinceLevel.getProvince_return());
							appAccountLog.setCreate_time(now);
							appAccountLog.setUser_id(provinceUser.getId());
							appAccountLog.setMessage(message);
							appAccountLog.setBefore_amount(account.getTotal_amount());
							appAccountLog.setProducu_user_id(user.getId());
							appAccountLog.setType(EnumAppAccountLogType.provinceReturn.getType());

							map.put("provinceAccount", account);
							map.put("provinceAccountLog", appAccountLog);
						}
					}
				}
			}
			if (provinceId != null && cityId != null) {
				cityAgent = appAreaAgentMapper.seleCityAgent(provinceId, cityId);
				// 市级代理人
				if (cityAgent != null) {
					AppUser cityUser = appUserMapper.selectByPrimaryKey(cityAgent.getUser_id());
					if (cityUser != null && cityUser.getMember_level_end_time().after(now)) {
						// 市级代理人
						MemberLevel cityLevel = memberLevelMapper.selectByPrimaryKey(cityUser.getMember_level_id());
						// 不为空并且为区域代理类型,账户增加收益
						if (cityLevel != null && cityLevel.getType().intValue() == EnumMemberType.areaMember.getType().intValue() && cityLevel.getCity_return() != null) {
							AppAccountLog appAccountLog = new AppAccountLog();
							String message = "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
							appAccountLog.setChange_amount(cityLevel.getCity_return());
							appAccountLog.setCreate_time(now);
							appAccountLog.setUser_id(cityUser.getId());
							appAccountLog.setMessage(message);
							appAccountLog.setProducu_user_id(user.getId());
							appAccountLog.setType(EnumAppAccountLogType.cityReturn.getType());
							AppUserAccount account = appUserAccountMapper.selectByUserId(cityUser.getId());
							appAccountLog.setBefore_amount(account.getTotal_amount());

							map.put("cityAccount", account);
							map.put("cityAccountLog", appAccountLog);
						}
					}
				}

			}

			/**
			 * 2.普通会员计算收益了
			 */

			// 邀请人会员等级
			MemberLevel inviteMemberLevel = memberLevelMapper.selectByPrimaryKey(inviteUser.getMember_level_id());

			int flag = memberLevelOpenMapper.selectCountByUseInviteMember(user.getId(), inviteUser.getId(), buyMemberLevel.getId(), inviteMemberLevel.getId());
			if (inviteMemberLevel.getType().intValue() == EnumMemberType.baseMember.getType().intValue()) {// 邀请人也是基础会员,开始计算一级收益
				// 第一次推荐才能获得
				if (flag <= 0) {
					String message = "邀请人:" + inviteUser.getUser_name() + "(" + inviteUser.getPhone() + ")," + "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
					AppUserAccount account = appUserAccountMapper.selectByUserId(inviteUser.getId());
					AppAccountLog appAccountLog = new AppAccountLog();
					appAccountLog.setChange_amount(buyMemberLevel.getOne_level_return());
					appAccountLog.setCreate_time(now);
					appAccountLog.setUser_id(inviteUser.getId());
					appAccountLog.setMessage(message);
					appAccountLog.setBefore_amount(account.getTotal_amount());
					appAccountLog.setProducu_user_id(user.getId());
					appAccountLog.setType(EnumAppAccountLogType.oneReturn.getType());

					map.put("inviteOneAccount", account);
					map.put("inviteOneAccountLog", appAccountLog);
				}

			} else if (inviteMemberLevel.getType().intValue() != EnumMemberType.baseMember.getType().intValue()) {// 邀请人属于高级会员及以上
																													// 需要归还购买本金
				// 如果上级不是基础会员,此次购买所得金额为该会员所有
				String message = "邀请人:" + inviteUser.getUser_name() + "(" + inviteUser.getPhone() + ")," + "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
				AppUserAccount account = appUserAccountMapper.selectByUserId(inviteUser.getId());
				AppAccountLog appAccountLog = new AppAccountLog();
				appAccountLog.setChange_amount(new BigDecimal(EnumFieldClassVipPrice.VIP.getPrice()));
				appAccountLog.setCreate_time(now);
				appAccountLog.setUser_id(inviteUser.getId());
				appAccountLog.setMessage(message);
				appAccountLog.setBefore_amount(account.getTotal_amount());
				appAccountLog.setProducu_user_id(user.getId());
				appAccountLog.setType(EnumAppAccountLogType.highBaseReturn.getType());

				map.put("inviteOneAccount", account);
				map.put("inviteOneAccountLog", appAccountLog);
			}

			/**
			 * 注：非基础会员在 推荐基础会员不获得任何一级二级或者提成 ,只赚差价
			 */

			// 邀请人会员等级邀请购买需要扣除学习码
			if (inviteMemberLevel.getType().intValue() != EnumMemberType.baseMember.getType().intValue() && inviteMemberLevel.getShare_buy_use_coupon() && buyMemberLevel.getMember_coupon_number() > 0) {
				AppCouponLog appCouponLog = new AppCouponLog();
				String message = "邀请人:" + inviteUser.getUser_name() + "(" + inviteUser.getPhone() + ")," + "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
				appCouponLog.setChange_num(0 - buyMemberLevel.getMember_coupon_number());
				appCouponLog.setCreate_time(now);
				appCouponLog.setMessage(message);
				appCouponLog.setProduce_user_id(user.getId());
				appCouponLog.setType(EnumAppCouponLogType.sendOther.getType());
				appCouponLog.setUser_id(inviteUser.getId());
				AppUserCoupon userCoupon = appUserCouponMapper.selectByUserId(inviteUser.getId());
				appCouponLog.setBefore_num(userCoupon.getCourse_total());
				map.put("inviteCoupon", userCoupon);
				map.put("inviteCouponLog", appCouponLog);

			}

			try {
				memberService.baseMemberReturn(map);
			} catch (Exception e) {
				return false;
			}

		}
		/**
		 * 购买人购买的是非基础会员类型
		 */
		if (buyMemberLevel.getType().intValue() != EnumMemberType.baseMember.getType().intValue()) {
			// 先成为普通会员才能成为高级会员,不计算区域收益了
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("user", user);
			tempMap.put("buyMemberLevel", buyMemberLevel);
			tempMap.put("now", now);
			tempMap.put("order", order);

			// 邀请人会员等级
			MemberLevel inviteMemberLevel = memberLevelMapper.selectByPrimaryKey(inviteUser.getMember_level_id());
			int flag = memberLevelOpenMapper.selectCountByUseInviteMember(user.getId(), inviteUser.getId(), buyMemberLevel.getId(), inviteMemberLevel.getId());
			
			boolean flag1=false;
			BigDecimal total=BigDecimal.ZERO;
			AppUserAccount account = appUserAccountMapper.selectByUserId(inviteUser.getId());
			/**
			 * 高级会员是个阈值 高级会员 中 高推低 可以获得 一次性返点 和差价 大于高级会员 低推高有返点 高推低只有差价 高级以上 低推高
			 * 有返点
			 **/
			if ((inviteMemberLevel.getId().longValue() >= EnumMember.gaojihehuoren.getId().longValue() && // 邀请人会员的等级大于高级合伙人
					buyMemberLevel.getId().longValue() >= EnumMember.gaojihehuoren.getId().longValue() // 购买人会员的等级大于高级合伙人
					&& inviteMemberLevel.getLevle_grade() <= buyMemberLevel.getLevle_grade()) // 邀请人等级小于购买人等级.比如
					|| (inviteMemberLevel.getId().longValue() < EnumMember.gaojihehuoren.getId().longValue() && // 邀请人小于高级会员范围
							buyMemberLevel.getId().longValue() < EnumMember.gaojihehuoren.getId().longValue() // 购买人也是高级会员范围
							&& inviteMemberLevel.getLevle_grade() == buyMemberLevel.getLevle_grade())) {
				
				if (inviteMemberLevel.getReturn_point() != null) {// 邀请人属于高级会员才有返点
					if (flag<=0) {
						BigDecimal amount = buyMemberLevel.getMember_price().multiply(inviteMemberLevel.getReturn_point()).setScale(2, BigDecimal.ROUND_DOWN);
						String message = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," + "购买" + buyMemberLevel.getMember_name() +"";
						AppAccountLog appAccountLog = new AppAccountLog();
						appAccountLog.setChange_amount(amount);
						appAccountLog.setCreate_time(now);
						appAccountLog.setUser_id(inviteUser.getId());
						appAccountLog.setMessage(message);
						appAccountLog.setProducu_user_id(user.getId());
						appAccountLog.setType(EnumAppAccountLogType.poiontReturn.getType());
						
						appAccountLog.setBefore_amount(account.getTotal_amount());

						tempMap.put("inviteAccount", account);
						tempMap.put("inviteAccountLog", appAccountLog);
						flag1=true;
						total=account.getTotal_amount().add(amount);
					}
				}
				
			}
			if (inviteMemberLevel.getLevle_grade() > buyMemberLevel.getLevle_grade() && inviteMemberLevel.getShare_buy_use_coupon() && buyMemberLevel.getMember_coupon_number() > 0) {// 邀请人会员等级邀请购买需要扣除学习码
				EnumFieldClassVipPrice enump=EnumFieldClassVipPrice.getByType(buyMemberLevel.getId().intValue());
				if(enump==null){
					return false;
				}
				
				String message2 = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," + "购买" + buyMemberLevel.getMember_name() +"";
				AppAccountLog appAccountTwoLog = new AppAccountLog();
				appAccountTwoLog.setChange_amount(new BigDecimal(enump.getPrice()));
				appAccountTwoLog.setCreate_time(now);
				appAccountTwoLog.setUser_id(inviteUser.getId());
				appAccountTwoLog.setMessage(message2);
				appAccountTwoLog.setProducu_user_id(user.getId());
				appAccountTwoLog.setType(EnumAppAccountLogType.highBaseReturn.getType());
				
				
				if(flag1){
					appAccountTwoLog.setBefore_amount(total);	
				}else{
					appAccountTwoLog.setBefore_amount(account.getTotal_amount());
				}

				tempMap.put("inviteAccount", account);
				tempMap.put("inviteAccountTwoLog", appAccountTwoLog);
				
				
				
				// 邀请人要扣除学习码
				AppCouponLog appCouponLog = new AppCouponLog();
				String message = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," + "购买" + buyMemberLevel.getMember_name() +"";
				appCouponLog.setChange_num(0 - buyMemberLevel.getMember_coupon_number());
				appCouponLog.setCreate_time(now);
				appCouponLog.setMessage(message);
				appCouponLog.setProduce_user_id(user.getId());
				appCouponLog.setType(EnumAppCouponLogType.sendOther.getType());
				appCouponLog.setUser_id(inviteUser.getId());
				AppUserCoupon userCoupon = appUserCouponMapper.selectByUserId(inviteUser.getId());
				appCouponLog.setBefore_num(userCoupon.getCourse_total());
				tempMap.put("inviteCoupon", userCoupon);
				tempMap.put("inviteCouponLog", appCouponLog);
				
			}
			// 购买人要增加相应的学习码
			AppCouponLog addLog = new AppCouponLog();
			String message1 = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," +"购买" + buyMemberLevel.getMember_name()+"";
			addLog.setChange_num(buyMemberLevel.getMember_coupon_number());
			addLog.setCreate_time(now);
			addLog.setMessage(message1);
			addLog.setProduce_user_id(inviteUser.getId());
			addLog.setType(EnumAppCouponLogType.recevieOther.getType());
			addLog.setUser_id(user.getId());
			AppUserCoupon userCoupon1 = appUserCouponMapper.selectByUserId(user.getId());
			addLog.setBefore_num(userCoupon1.getCourse_total());
			tempMap.put("buyerCoupon", userCoupon1);
			tempMap.put("buyerCouponLog", addLog);
			// 这里要做事务控制
			try {
				memberService.highReturnTranInsertUpdate(tempMap);
			} catch (Exception e) {
				// 跑失败了
				return false;
			}
		}
		return true;
	}

	/**
	 * 代客户拆分  (钱需要归还到客户账户)
	 */
	@Override
	public Boolean chaifenMember(AppUser user, String memberId) {

		Date now = new Date();
		MemberLevel buyMemberLevel = memberLevelMapper.selectByPrimaryKey(Long.valueOf(memberId));

		String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
		// 添加信息到订单表
		MemberOrder order = new MemberOrder();
		// 1.支付宝，2.微信，3.上级拆分，4.下级申请 5.系统审核订单
		order.setOrder_type(EnumMemberOrderType.HIGHSEND.getType());
		// 订单号
		order.setOrder_no(orderNo);
		order.setCreate_time(now);
		// 用户是否关闭
		order.setIs_closed(false);
		// 是否支付成功
		order.setIs_pay(true);
		order.setUser_id(user.getId());
		// 会员id
		order.setMember_id(buyMemberLevel.getId());
		// 订单金额
		order.setOrder_price(buyMemberLevel.getMember_price());
		order.setPay_time(now);
		// 优惠金额
		order.setReduction_price(new BigDecimal(0));
		// 0.待审核 1.未计算 2.计算中 3.结算完毕
		order.setReturn_type(EnumOrdeReturnType.alreadyReturn.getType());
		order.setOver_time(DateUtil.getDayAfter(now, 30));
		// 添加信息到审核表

		AppUser inviteUser=appUserMapper.selectByPrimaryKey(user.getInvitation_user_id());
		
		/**
		 * 一:如果购买人购买的会员等级是基础会员
		 */
		if (buyMemberLevel.getType().intValue() == EnumMemberType.baseMember.getType().intValue()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user", user);
			map.put("buyMemberLevel", buyMemberLevel);
			map.put("now", now);
			map.put("order", order);
			/**
			 * 1. 先跑区域代理收益
			 */
			Long provinceId = user.getProvince_id();
			Long cityId = user.getCity_id();
			AppAreaAgent provinceAgent = null;
			AppAreaAgent cityAgent = null;
			if (provinceId != null) {
				provinceAgent = appAreaAgentMapper.seleProvinceAgent(provinceId);
				// 省级代理人
				if (provinceAgent != null) {
					AppUser provinceUser = appUserMapper.selectByPrimaryKey(provinceAgent.getUser_id());
					if (provinceUser != null && provinceUser.getMember_level_end_time().after(now)) {// 不为空没过期
						// 省级代理人
						MemberLevel provinceLevel = memberLevelMapper.selectByPrimaryKey(provinceUser.getMember_level_id());
						// 不为空并且为区域代理类型,账户增加收益
						if (provinceLevel != null && provinceLevel.getType().intValue() == EnumMemberType.areaMember.getType().intValue() && provinceLevel.getProvince_return() != null) {
							// 账户表
							AppUserAccount account = appUserAccountMapper.selectByUserId(provinceUser.getId());
							AppAccountLog appAccountLog = new AppAccountLog();
							String message = "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
							appAccountLog.setChange_amount(provinceLevel.getProvince_return());
							appAccountLog.setCreate_time(now);
							appAccountLog.setUser_id(provinceUser.getId());
							appAccountLog.setMessage(message);
							appAccountLog.setBefore_amount(account.getTotal_amount());
							appAccountLog.setProducu_user_id(user.getId());
							appAccountLog.setType(EnumAppAccountLogType.provinceReturn.getType());

							map.put("provinceAccount", account);
							map.put("provinceAccountLog", appAccountLog);
						}
					}
				}
			}
			if (provinceId != null && cityId != null) {
				cityAgent = appAreaAgentMapper.seleCityAgent(provinceId, cityId);
				// 市级代理人
				if (cityAgent != null) {
					AppUser cityUser = appUserMapper.selectByPrimaryKey(cityAgent.getUser_id());
					if (cityUser != null && cityUser.getMember_level_end_time().after(now)) {
						// 市级代理人
						MemberLevel cityLevel = memberLevelMapper.selectByPrimaryKey(cityUser.getMember_level_id());
						// 不为空并且为区域代理类型,账户增加收益
						if (cityLevel != null && cityLevel.getType().intValue() == EnumMemberType.areaMember.getType().intValue() && cityLevel.getCity_return() != null) {
							AppAccountLog appAccountLog = new AppAccountLog();
							String message = "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
							appAccountLog.setChange_amount(cityLevel.getCity_return());
							appAccountLog.setCreate_time(now);
							appAccountLog.setUser_id(cityUser.getId());
							appAccountLog.setMessage(message);
							appAccountLog.setProducu_user_id(user.getId());
							appAccountLog.setType(EnumAppAccountLogType.cityReturn.getType());
							AppUserAccount account = appUserAccountMapper.selectByUserId(cityUser.getId());
							appAccountLog.setBefore_amount(account.getTotal_amount());

							map.put("cityAccount", account);
							map.put("cityAccountLog", appAccountLog);
						}
					}
				}

			}

			/**
			 * 2.普通会员计算收益了
			 */

			// 邀请人会员等级
			MemberLevel inviteMemberLevel = memberLevelMapper.selectByPrimaryKey(inviteUser.getMember_level_id());

			int flag = memberLevelOpenMapper.selectCountByUseInviteMember(user.getId(), inviteUser.getId(), buyMemberLevel.getId(), inviteMemberLevel.getId());
			if (inviteMemberLevel.getType().intValue() == EnumMemberType.baseMember.getType().intValue()) {// 邀请人也是基础会员,开始计算一级收益
				// 第一次推荐才能获得
				if (flag <= 0) {
					String message = "邀请人:" + inviteUser.getUser_name() + "(" + inviteUser.getPhone() + ")," + "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
					AppUserAccount account = appUserAccountMapper.selectByUserId(inviteUser.getId());
					AppAccountLog appAccountLog = new AppAccountLog();
					appAccountLog.setChange_amount(buyMemberLevel.getOne_level_return());
					appAccountLog.setCreate_time(now);
					appAccountLog.setUser_id(inviteUser.getId());
					appAccountLog.setMessage(message);
					appAccountLog.setBefore_amount(account.getTotal_amount());
					appAccountLog.setProducu_user_id(user.getId());
					appAccountLog.setType(EnumAppAccountLogType.oneReturn.getType());

					map.put("inviteOneAccount", account);
					map.put("inviteOneAccountLog", appAccountLog);
				}

			} else if (inviteMemberLevel.getType().intValue() != EnumMemberType.baseMember.getType().intValue()) {// 邀请人属于高级会员及以上
																													// 需要归还购买本金
				// 如果上级不是基础会员,此次购买所得金额为该会员所有
				String message = "邀请人:" + inviteUser.getUser_name() + "(" + inviteUser.getPhone() + ")," + "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
				AppUserAccount account = appUserAccountMapper.selectByUserId(inviteUser.getId());
				AppAccountLog appAccountLog = new AppAccountLog();
				appAccountLog.setChange_amount(buyMemberLevel.getMember_price());
				appAccountLog.setCreate_time(now);
				appAccountLog.setUser_id(inviteUser.getId());
				appAccountLog.setMessage(message);
				appAccountLog.setBefore_amount(account.getTotal_amount());
				appAccountLog.setProducu_user_id(user.getId());
				appAccountLog.setType(EnumAppAccountLogType.highBaseReturn.getType());

				map.put("inviteOneAccount", account);
				map.put("inviteOneAccountLog", appAccountLog);
			}

			/**
			 * 注：非基础会员在 推荐基础会员不获得任何一级二级或者提成 ,只赚差价
			 */

			// 邀请人会员等级邀请购买需要扣除学习码
			if (inviteMemberLevel.getType().intValue() != EnumMemberType.baseMember.getType().intValue() && inviteMemberLevel.getShare_buy_use_coupon() && buyMemberLevel.getMember_coupon_number() > 0) {
				AppCouponLog appCouponLog = new AppCouponLog();
				String message = "邀请人:" + inviteUser.getUser_name() + "(" + inviteUser.getPhone() + ")," + "付款人:" + user.getUser_name() + "(" + user.getPhone() + ")," + "购买" + buyMemberLevel.getMember_name() + "";
				appCouponLog.setChange_num(0 - buyMemberLevel.getMember_coupon_number());
				appCouponLog.setCreate_time(now);
				appCouponLog.setMessage(message);
				appCouponLog.setProduce_user_id(user.getId());
				appCouponLog.setType(EnumAppCouponLogType.sendOther.getType());
				appCouponLog.setUser_id(inviteUser.getId());
				AppUserCoupon userCoupon = appUserCouponMapper.selectByUserId(inviteUser.getId());
				appCouponLog.setBefore_num(userCoupon.getCourse_total());
				map.put("inviteCoupon", userCoupon);
				map.put("inviteCouponLog", appCouponLog);

			}

			try {
				memberService.baseMemberReturn(map);
			} catch (Exception e) {
				return false;
			}

		}
		/**
		 * 购买人购买的是非基础会员类型
		 */
		if (buyMemberLevel.getType().intValue() != EnumMemberType.baseMember.getType().intValue()) {
			// 先成为普通会员才能成为高级会员,不计算区域收益了
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("user", user);
			tempMap.put("buyMemberLevel", buyMemberLevel);
			tempMap.put("now", now);
			tempMap.put("order", order);

			// 邀请人会员等级
			MemberLevel inviteMemberLevel = memberLevelMapper.selectByPrimaryKey(inviteUser.getMember_level_id());
			int flag = memberLevelOpenMapper.selectCountByUseInviteMember(user.getId(), inviteUser.getId(), buyMemberLevel.getId(), inviteMemberLevel.getId());
			
			boolean flag1=false;
			BigDecimal total=BigDecimal.ZERO;
			AppUserAccount account = appUserAccountMapper.selectByUserId(inviteUser.getId());
			/**
			 * 高级会员是个阈值 高级会员 中 高推低 可以获得 一次性返点 和差价 大于高级会员 低推高有返点 高推低只有差价 高级以上 低推高
			 * 有返点
			 **/
			if ((inviteMemberLevel.getId().longValue() >= EnumMember.gaojihehuoren.getId().longValue() && // 邀请人会员的等级大于高级合伙人
					buyMemberLevel.getId().longValue() >= EnumMember.gaojihehuoren.getId().longValue() // 购买人会员的等级大于高级合伙人
					&& inviteMemberLevel.getLevle_grade() <= buyMemberLevel.getLevle_grade()) // 邀请人等级小于购买人等级.比如
					|| (inviteMemberLevel.getId().longValue() < EnumMember.gaojihehuoren.getId().longValue() && // 邀请人小于高级会员范围
							buyMemberLevel.getId().longValue() < EnumMember.gaojihehuoren.getId().longValue() // 购买人也是高级会员范围
							&& inviteMemberLevel.getLevle_grade() == buyMemberLevel.getLevle_grade())) {
				
				if (inviteMemberLevel.getReturn_point() != null) {// 邀请人属于高级会员才有返点
					if (flag<=0) {
						BigDecimal amount = buyMemberLevel.getMember_price().multiply(inviteMemberLevel.getReturn_point()).setScale(2, BigDecimal.ROUND_DOWN);
						String message = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," + "购买" + buyMemberLevel.getMember_name() +"";
						AppAccountLog appAccountLog = new AppAccountLog();
						appAccountLog.setChange_amount(amount);
						appAccountLog.setCreate_time(now);
						appAccountLog.setUser_id(inviteUser.getId());
						appAccountLog.setMessage(message);
						appAccountLog.setProducu_user_id(user.getId());
						appAccountLog.setType(EnumAppAccountLogType.poiontReturn.getType());
						
						appAccountLog.setBefore_amount(account.getTotal_amount());

						tempMap.put("inviteAccount", account);
						tempMap.put("inviteAccountLog", appAccountLog);
						flag1=true;
						total=account.getTotal_amount().add(amount);
					}
				}
				
			}
			if (inviteMemberLevel.getLevle_grade() > buyMemberLevel.getLevle_grade() && inviteMemberLevel.getShare_buy_use_coupon() && buyMemberLevel.getMember_coupon_number() > 0) {// 邀请人会员等级邀请购买需要扣除学习码
				
				String message2 = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," + "购买" + buyMemberLevel.getMember_name() +"";
				AppAccountLog appAccountTwoLog = new AppAccountLog();
				appAccountTwoLog.setChange_amount(buyMemberLevel.getMember_price());
				appAccountTwoLog.setCreate_time(now);
				appAccountTwoLog.setUser_id(inviteUser.getId());
				appAccountTwoLog.setMessage(message2);
				appAccountTwoLog.setProducu_user_id(user.getId());
				appAccountTwoLog.setType(EnumAppAccountLogType.highBaseReturn.getType());
				
				
				if(flag1){
					appAccountTwoLog.setBefore_amount(total);	
				}else{
					appAccountTwoLog.setBefore_amount(account.getTotal_amount());
				}

				tempMap.put("inviteAccount", account);
				tempMap.put("inviteAccountTwoLog", appAccountTwoLog);
				
				
				
				// 邀请人要扣除学习码
				AppCouponLog appCouponLog = new AppCouponLog();
				String message = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," + "购买" + buyMemberLevel.getMember_name() +"";
				appCouponLog.setChange_num(0 - buyMemberLevel.getMember_coupon_number());
				appCouponLog.setCreate_time(now);
				appCouponLog.setMessage(message);
				appCouponLog.setProduce_user_id(user.getId());
				appCouponLog.setType(EnumAppCouponLogType.sendOther.getType());
				appCouponLog.setUser_id(inviteUser.getId());
				AppUserCoupon userCoupon = appUserCouponMapper.selectByUserId(inviteUser.getId());
				appCouponLog.setBefore_num(userCoupon.getCourse_total());
				tempMap.put("inviteCoupon", userCoupon);
				tempMap.put("inviteCouponLog", appCouponLog);
				
			}
			// 购买人要增加相应的学习码
			AppCouponLog addLog = new AppCouponLog();
			String message1 = "邀请人:"+inviteUser.getUser_name()+"("+inviteUser.getPhone()+"),"+"付款人:"+user.getUser_name()+"("+user.getPhone()+")," +"购买" + buyMemberLevel.getMember_name()+"";
			addLog.setChange_num(buyMemberLevel.getMember_coupon_number());
			addLog.setCreate_time(now);
			addLog.setMessage(message1);
			addLog.setProduce_user_id(inviteUser.getId());
			addLog.setType(EnumAppCouponLogType.recevieOther.getType());
			addLog.setUser_id(user.getId());
			AppUserCoupon userCoupon1 = appUserCouponMapper.selectByUserId(user.getId());
			addLog.setBefore_num(userCoupon1.getCourse_total());
			tempMap.put("buyerCoupon", userCoupon1);
			tempMap.put("buyerCouponLog", addLog);
			// 这里要做事务控制
			try {
				memberService.highReturnTranInsertUpdate(tempMap);
			} catch (Exception e) {
				// 跑失败了
				return false;
			}
		}
		return true;
	}
}
