package com.ssafy.happy.model.mapper;

import com.ssafy.happy.model.dto.MemberDto;

public interface MemberMapper {

	int joinMember(MemberDto dto);
	MemberDto selectOne(String userid);
	int updateMember(MemberDto dto);
	int deleteMember(String userid);
}
