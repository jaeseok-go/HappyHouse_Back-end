package com.ssafy.happy.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.model.dto.HinfoDto;
import com.ssafy.happy.model.dto.JjimDto;
import com.ssafy.happy.model.mapper.JjimMapper;

@Service
public class JjimServiceImpl implements JjimService{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HinfoDto> selectJjimRank() {
		return sqlSession.getMapper(JjimMapper.class).selectJjimRank();
	}

	@Override
	public int selectIsJjim(JjimDto jjim) {
		return sqlSession.getMapper(JjimMapper.class).selectIsJjim(jjim);
	}

	@Override
	public int deleteJjim(JjimDto jjim) {
		return sqlSession.getMapper(JjimMapper.class).deleteJjim(jjim);
	}

	@Override
	public int insertJjim(JjimDto jjim) {
		return sqlSession.getMapper(JjimMapper.class).insertJjim(jjim);
	}

	@Override
	public int insertHinfo(HinfoDto hinfo) {
		return sqlSession.getMapper(JjimMapper.class).insertHinfo(hinfo);
	}
	
	@Override
	public int isHinfo(String hno) {
		return sqlSession.getMapper(JjimMapper.class).isHinfo(hno);
	}

	@Override
	public List<HinfoDto> selectMyJjim(String userid) {
		return sqlSession.getMapper(JjimMapper.class).selectMyJjim(userid);
	}

	
	
}
