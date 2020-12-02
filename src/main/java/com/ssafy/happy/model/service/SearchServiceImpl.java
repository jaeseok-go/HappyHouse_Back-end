package com.ssafy.happy.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happy.model.dto.DongCodeDto;
import com.ssafy.happy.model.dto.GugunCodeDto;
import com.ssafy.happy.model.dto.SidoCodeDto;
import com.ssafy.happy.model.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<SidoCodeDto> initSido(){
		return sqlSession.getMapper(SearchMapper.class).initSido();
	}
	
	@Override
	public List<GugunCodeDto> initGugun(String sido_code){
		//sido_code는 코드 전체의 앞 두자리
		StringBuilder sb = new StringBuilder();
		sb.append(sido_code);
		return sqlSession.getMapper(SearchMapper.class).initGugun(sb.substring(0, 2));
	}
	
	@Override
	public List<DongCodeDto> initDong(String gugun_code){
		//gugun_code는 코드 전체의 앞 다섯자리
		StringBuilder sb = new StringBuilder();
		sb.append(gugun_code);
		
		List<DongCodeDto> list = sqlSession.getMapper(SearchMapper.class).initDong(sb.substring(0, 5));
		return list; 
	}
	@Override
	public List<DongCodeDto> searchByDongName(String dong_name){
		List<DongCodeDto> list = sqlSession.getMapper(SearchMapper.class).searchByDongName(dong_name);
		return list; 
	}
}
