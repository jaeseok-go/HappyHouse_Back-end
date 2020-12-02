package com.ssafy.happy.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.model.dto.MemberDto;
import com.ssafy.happy.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int joinMember(MemberDto dto) {
		return sqlSession.getMapper(MemberMapper.class).joinMember(dto);
	}

	@Override
	public MemberDto selectOne(String userid) {
		return sqlSession.getMapper(MemberMapper.class).selectOne(userid);
	}
	
	@Override
	public int updateMember(MemberDto dto) {
		return sqlSession.getMapper(MemberMapper.class).updateMember(dto);
	}

	@Override
	public int deleteMember(String userid) {
		return sqlSession.getMapper(MemberMapper.class).deleteMember(userid);
	}
	
}
