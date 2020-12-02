package com.ssafy.happy.model.service;

import com.ssafy.happy.model.dto.MemberDto;

public interface MemberService {
	public int joinMember(MemberDto dto);
	public MemberDto selectOne(String userid);
	public int updateMember(MemberDto dto);
	public int deleteMember(String userid);
}