package com.pinhaha.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pinhaha.enums.EnumAppOrderAudingType;
import com.pinhaha.mapper.AppAccountLogMapper;
import com.pinhaha.mapper.AppAreaAgentMapper;
import com.pinhaha.mapper.AppCouponLogMapper;
import com.pinhaha.mapper.AppUserAccountMapper;
import com.pinhaha.mapper.AppUserCouponMapper;
import com.pinhaha.mapper.AppUserMapper;
import com.pinhaha.mapper.AppUserMessageMapper;
import com.pinhaha.mapper.AppUserOrderAudingMapper;
import com.pinhaha.mapper.AppUserPartnerNumMapper;
import com.pinhaha.mapper.MemberLevelMapper;
import com.pinhaha.mapper.MemberLevelOpenMapper;
import com.pinhaha.mapper.MemberOrderMapper;
import com.pinhaha.pojo.AppAccountLog;
import com.pinhaha.pojo.AppCouponLog;
import com.pinhaha.pojo.AppUser;
import com.pinhaha.pojo.AppUserAccount;
import com.pinhaha.pojo.AppUserCoupon;
import com.pinhaha.pojo.AppUserMessage;
import com.pinhaha.pojo.AppUserOrderAuding;
import com.pinhaha.pojo.AppUserPartnerNum;
import com.pinhaha.pojo.MemberLevel;
import com.pinhaha.pojo.MemberLevelOpen;
import com.pinhaha.pojo.MemberOrder;
import com.pinhaha.service.MemberService;
import com.pinhaha.util.DateUtil;

@Service
public class MemberServiceImpl implements MemberService {

	private static Logger log = Logger.getLogger(MemberServiceImpl.class);

	@Autowired
	private AppUserMapper appUserMapper;

	@Autowired
	private AppUserMessageMapper appUserMessageMapper;

	@Autowired
	private MemberLevelMapper memberLevelMapper;

	@Autowired
	private MemberOrderMapper memberOrderMapper;

	@Autowired
	private AppCouponLogMapper appCouponLogMapper;

	@Autowired
	private AppAccountLogMapper appAccountLogMapper;

	@Autowired
	private MemberLevelOpenMapper memberLevelOpenMapper;

	@Autowired
	private AppUserCouponMapper appUserCouponMapper;

	@Autowired
	private AppUserAccountMapper appUserAccountMapper;

	@Autowired
	private AppUserOrderAudingMapper appUserOrderAudingMapper;

	@Autowired
	private AppUserPartnerNumMapper appUserPartnerNumMapper;



	@Transactional(rollbackFor = Exception.class)
	public void baseMemberReturn(Map<String, Object> tempMap)  {

		Date now = (Date) tempMap.get("now");
		AppUser user = (AppUser) tempMap.get("user");
		if (tempMap.get("oldUser") != null) {
			AppUser oldUser = (AppUser) tempMap.get("oldUser");
			user.setInvitation_user_id(oldUser.getId());
		}
		MemberLevel buyMemberLevel = (MemberLevel) tempMap.get("buyMemberLevel");
		MemberOrder order = (MemberOrder) tempMap.get("order");

		AppUserAccount provinceAccount = (AppUserAccount) tempMap.get("provinceAccount");
		AppAccountLog provinceAccountLog = (AppAccountLog) tempMap.get("provinceAccountLog");

		if (provinceAccount != null && provinceAccountLog != null) {
			if (user.getMember_level_id() == null) {
				if (appUserAccountMapper.changeAccountByUserAndChangeMoney(provinceAccountLog.getChange_amount(), provinceAccount.getId().longValue()) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + provinceAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
				if (appAccountLogMapper.insert(provinceAccountLog) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + provinceAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
				AppUserMessage message = new AppUserMessage();
				message.setUser_id(provinceAccountLog.getUser_id());
				message.setContext(DateUtil.getDateTimeFormat(now) + "获得收益金额" + provinceAccountLog.getChange_amount() + "元，请到我的-账单管理中查看详情。");
				message.setCreate_time(now);
				message.setIs_read(false);
				message.setType(1);
				if (appUserMessageMapper.insert(message) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + provinceAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
			}
		}

		AppUserAccount cityAccount = (AppUserAccount) tempMap.get("cityAccount");
		AppAccountLog cityAccountLog = (AppAccountLog) tempMap.get("cityAccountLog");

		if (cityAccount != null && cityAccountLog != null) {
			if (user.getMember_level_id() == null) {
				if (appUserAccountMapper.changeAccountByUserAndChangeMoney(cityAccountLog.getChange_amount(), cityAccount.getId().longValue()) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + cityAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
				if (appAccountLogMapper.insert(cityAccountLog) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + cityAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
				AppUserMessage message = new AppUserMessage();
				message.setUser_id(cityAccountLog.getUser_id());
				message.setContext(DateUtil.getDateTimeFormat(now) + "获得收益金额" + cityAccountLog.getChange_amount() + "元，请到我的-账单管理中查看详情。");
				message.setCreate_time(now);
				message.setIs_read(false);
				message.setType(1);
				if (appUserMessageMapper.insert(message) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + cityAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
			}
		}

		AppUserAccount inviteOneAccount = (AppUserAccount) tempMap.get("inviteOneAccount");
		AppAccountLog inviteOneAccountLog = (AppAccountLog) tempMap.get("inviteOneAccountLog");

		if (inviteOneAccount != null && inviteOneAccountLog != null) {
			if (appUserAccountMapper.changeAccountByUserAndChangeMoney(inviteOneAccountLog.getChange_amount(), inviteOneAccount.getId().longValue()) <= 0) {
				log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteOneAccountLog.getMessage());
				throw new RuntimeException("account insert error!! roll back!!");
			}
			if (appAccountLogMapper.insert(inviteOneAccountLog) <= 0) {
				log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteOneAccountLog.getMessage());
				throw new RuntimeException("account insert error!! roll back!!");
			}
			AppUserMessage message = new AppUserMessage();
			message.setUser_id(inviteOneAccountLog.getUser_id());
			message.setContext(DateUtil.getDateTimeFormat(now) + "获得收益金额" + inviteOneAccountLog.getChange_amount() + "元，请到我的-账单管理中查看详情。");
			message.setCreate_time(now);
			message.setIs_read(false);
			message.setType(1);
			if (appUserMessageMapper.insert(message) <= 0) {
				log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteOneAccountLog.getMessage());
				throw new RuntimeException("account insert error!! roll back!!");
			}
		}


		AppUserCoupon inviteCoupon = (AppUserCoupon) tempMap.get("inviteCoupon");
		AppCouponLog inviteCouponLog = (AppCouponLog) tempMap.get("inviteCouponLog");

		if (inviteCoupon != null && inviteCouponLog != null) {
			if (appUserCouponMapper.changeCouponByUserAndChangeNum(inviteCouponLog.getChange_num(), inviteCoupon.getId()) <= 0) {
				log.error(" couponNum is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteCouponLog.getMessage());
				throw new RuntimeException("coupon insert error!! roll back!!");
			}
			if (appCouponLogMapper.insert(inviteCouponLog) <= 0) {
				log.error(" couponNum is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteCouponLog.getMessage());
				throw new RuntimeException("coupon insert error!! roll back!!");
			}
		}

		MemberLevel oldlevel = memberLevelMapper.selectByPrimaryKey(user.getMember_level_id());
		Date endTime = DateUtil.getMonthAfter(now, buyMemberLevel.getTime_unit());
		// 更新用户等级
		if (oldlevel == null || oldlevel.getLevle_grade().intValue() < buyMemberLevel.getLevle_grade().intValue()) {
			user.setMember_level_id(buyMemberLevel.getId());
			user.setMember_level_end_time(endTime);
			appUserMapper.updateByPrimaryKey(user);
		} else if (oldlevel.getLevle_grade().intValue() == buyMemberLevel.getLevle_grade().intValue()) {
			endTime = DateUtil.getMonthAfter(user.getMember_level_end_time(), buyMemberLevel.getTime_unit());
			user.setMember_level_end_time(endTime);
			appUserMapper.updateByPrimaryKey(user);
		}
		// 更新等级开通日志
		MemberLevelOpen open = new MemberLevelOpen();
		if (user.getInvitation_user_id() != null) {
			open.setInvite_user_id(user.getInvitation_user_id());
		}
		open.setMember_id(buyMemberLevel.getId());
		open.setOpen_time(now);
		open.setUser_id(user.getId());
		if (user.getInvitation_user_id() != null) {
			AppUser inviteUser = appUserMapper.selectByPrimaryKey(user.getInvitation_user_id());
			if (inviteUser.getMember_level_id() != null) {
				open.setInvite_member_id(inviteUser.getMember_level_id());
			}
		}
		open.setEnd_time(endTime);
		memberLevelOpenMapper.insert(open);

		if (memberOrderMapper.insertSelective(order) <= 0) {
			throw new RuntimeException("sendCouponToOther error!! ");
		}

		AppUserOrderAuding auding = appUserOrderAudingMapper.selectOrderAudingByOrderNo(order.getOrder_no());
		if (auding == null) {
			auding = new AppUserOrderAuding();
			auding.setAuding_type(EnumAppOrderAudingType.systemSend.getType());// 系统审核
			auding.setCreate_time(now);
			auding.setInvite_id(user.getInvitation_user_id());
			auding.setOrder_no(order.getOrder_no());
			auding.setUser_id(user.getId());
			if (appUserOrderAudingMapper.insert(auding) <= 0) {
				throw new RuntimeException("auding insert error!! ");
			}
		}

	}

	@Transactional(rollbackFor = Exception.class)
	public void highReturnTranInsertUpdate(Map<String, Object> tempMap) {
		Date now = (Date) tempMap.get("now");
		AppUser user = (AppUser) tempMap.get("user");
		if (tempMap.get("oldUser") != null) {
			AppUser oldUser = (AppUser) tempMap.get("oldUser");
			user.setInvitation_user_id(oldUser.getId());
		}
		MemberLevel buyMemberLevel = (MemberLevel) tempMap.get("buyMemberLevel");
		MemberOrder order = (MemberOrder) tempMap.get("order");

		AppUserAccount inviteAccount = (AppUserAccount) tempMap.get("inviteAccount");
		AppAccountLog inviteAccountLog = (AppAccountLog) tempMap.get("inviteAccountLog");
		AppAccountLog inviteAccountTwoLog = (AppAccountLog) tempMap.get("inviteAccountTwoLog");
		AppUserCoupon inviteCoupon = (AppUserCoupon) tempMap.get("inviteCoupon");
		AppCouponLog inviteCouponLog = (AppCouponLog) tempMap.get("inviteCouponLog");
		AppUserCoupon buyerCoupon = (AppUserCoupon) tempMap.get("buyerCoupon");
		AppCouponLog buyerCouponLog = (AppCouponLog) tempMap.get("buyerCouponLog");

		if (inviteAccount != null && (inviteAccountLog != null || inviteAccountTwoLog!=null)) {
			BigDecimal change=BigDecimal.ZERO;
			if(inviteAccountLog!=null){
				change=change.add(inviteAccountLog.getChange_amount());
			}
			if(inviteAccountTwoLog!=null){
				change=change.add(inviteAccountTwoLog.getChange_amount());
			}
			
			if (appUserAccountMapper.changeAccountByUserAndChangeMoney(change, inviteAccount.getId().longValue()) <= 0) {
				log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteAccountLog.getMessage());
				throw new RuntimeException("account insert error!! roll back!!");
			}
			if(inviteAccountLog!=null){
				if (appAccountLogMapper.insert(inviteAccountLog) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
				
				AppUserMessage message = new AppUserMessage();
				message.setUser_id(inviteAccountLog.getUser_id());
				message.setContext(DateUtil.getDateTimeFormat(now) + "获得收益金额" + inviteAccountLog.getChange_amount() + "元，请到我的-账单管理中查看详情。");
				message.setCreate_time(now);
				message.setIs_read(false);
				message.setType(1);
				if (appUserMessageMapper.insert(message) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
			}
			
			if(inviteAccountTwoLog!=null){
				if (appAccountLogMapper.insert(inviteAccountTwoLog) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteAccountLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
				
				
				AppUserMessage message = new AppUserMessage();
				message.setUser_id(inviteAccountTwoLog.getUser_id());
				message.setContext(DateUtil.getDateTimeFormat(now) + "获得收益金额" + inviteAccountTwoLog.getChange_amount() + "元，请到我的-账单管理中查看详情。");
				message.setCreate_time(now);
				message.setIs_read(false);
				message.setType(1);
				if (appUserMessageMapper.insert(message) <= 0) {
					log.error(" accountMoney is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteAccountTwoLog.getMessage());
					throw new RuntimeException("account insert error!! roll back!!");
				}
			}
			
	
		}

		if (inviteCoupon != null && inviteCouponLog != null) {
			if (appUserCouponMapper.changeCouponByUserAndChangeNum(inviteCouponLog.getChange_num(), inviteCoupon.getId()) <= 0) {
				log.error(" couponNum is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteCouponLog.getMessage());
				throw new RuntimeException("coupon insert error!! roll back!!");
			}
			if (appCouponLogMapper.insert(inviteCouponLog) <= 0) {
				log.error(" couponNum is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + inviteCouponLog.getMessage());
				throw new RuntimeException("coupon insert error!! roll back!!");
			}
		}

		if (buyerCoupon != null && buyerCouponLog != null) {
			if (appUserCouponMapper.changeCouponByUserAndChangeNum(buyerCouponLog.getChange_num(), buyerCoupon.getId()) <= 0) {
				log.error(" couponNum is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + buyerCouponLog.getMessage());
				throw new RuntimeException("coupon insert error!! roll back!!");
			}
			if (appCouponLogMapper.insert(buyerCouponLog) <= 0) {
				log.error(" couponNum is not enough error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + buyerCouponLog.getMessage());
				throw new RuntimeException("coupon insert error!! roll back!!");
			}
		}

		MemberLevel oldlevel = memberLevelMapper.selectByPrimaryKey(user.getMember_level_id());
		Date endTime = DateUtil.getMonthAfter(now, buyMemberLevel.getTime_unit());
		// 更新用户等级
		if (oldlevel == null || oldlevel.getLevle_grade().intValue() < buyMemberLevel.getLevle_grade().intValue()) {
			user.setMember_level_id(buyMemberLevel.getId());
			user.setMember_level_end_time(endTime);
			appUserMapper.updateByPrimaryKey(user);
		} else if (oldlevel.getLevle_grade().intValue() == buyMemberLevel.getLevle_grade().intValue()) {
			endTime = DateUtil.getMonthAfter(user.getMember_level_end_time(), buyMemberLevel.getTime_unit());
			user.setMember_level_end_time(endTime);
			appUserMapper.updateByPrimaryKey(user);
		}
		// 更新等级开通日志
		MemberLevelOpen open = new MemberLevelOpen();
		if (user.getInvitation_user_id() != null) {
			open.setInvite_user_id(user.getInvitation_user_id());
		}
		open.setMember_id(buyMemberLevel.getId());
		open.setOpen_time(now);
		if (user.getInvitation_user_id() != null) {
			AppUser inviteUser = appUserMapper.selectByPrimaryKey(user.getInvitation_user_id());
			if (inviteUser.getMember_level_id() != null) {
				open.setInvite_member_id(inviteUser.getMember_level_id());
			}
		}
		open.setUser_id(user.getId());
		open.setEnd_time(endTime);
		memberLevelOpenMapper.insert(open);

		if (buyMemberLevel.getSend_partner_num() != null && buyMemberLevel.getSend_partner_num() > 0) {
			AppUserPartnerNum num = appUserPartnerNumMapper.selectByUserId(user.getId());
			if (num == null) {
				num = new AppUserPartnerNum();
				num.setParent_num(buyMemberLevel.getSend_partner_num());
				num.setUser_id(user.getId());
				num.setCreate_time(now);
				if (appUserPartnerNumMapper.insert(num) <= 0) {
					log.error(" appUserPartnerNum is not already in error!!! --------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
					throw new RuntimeException("appUserPartnerNum insert error!! roll back!!");
				}
			} else {
				appUserPartnerNumMapper.changeNumByUserId(buyMemberLevel.getSend_partner_num(), user.getId());
			}
		}

		if (memberOrderMapper.insertSelective(order) <= 0) {
			throw new RuntimeException("sendCouponToOther error!! ");
		}
		
		
		AppUserOrderAuding auding = appUserOrderAudingMapper.selectOrderAudingByOrderNo(order.getOrder_no());
		if (auding == null) {
			auding = new AppUserOrderAuding();
			auding.setAuding_type(EnumAppOrderAudingType.systemSend.getType());// 系统审核
			auding.setCreate_time(now);
			auding.setInvite_id(user.getInvitation_user_id());
			auding.setOrder_no(order.getOrder_no());
			auding.setUser_id(user.getId());
			if (appUserOrderAudingMapper.insert(auding) <= 0) {
				throw new RuntimeException("auding insert error!! ");
			}
		}

	}
}
