package com.pinhaha.mapper;

import org.apache.ibatis.annotations.Param;

import com.pinhaha.pojo.MemberLevelOpen;

import tk.mybatis.mapper.common.Mapper;

public interface MemberLevelOpenMapper extends Mapper<MemberLevelOpen>{
	Integer selectCountByUseInviteMember(@Param("userId")Long userId,@Param("inviteUserId")Long inviteUserId,@Param("memberId")Long memberId ,@Param("inviteMemberId")Long inviteMemberId);
}